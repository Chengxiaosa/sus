const fs = require('fs').promises;
const existsSync = require('fs').existsSync;
const puppeteer = require('puppeteer-core');
const Promise = require('bluebird');

const { Parser } = require("fast-mhtml");

const { browser, output } = require('./config');
const { DB } = require('./db');
const { timestamp, compressPNG } = require('./utils');

class Crawler {
    constructor(device) {
        return (async () => {
            this.browser = await puppeteer.launch(browser);
            this.device = device;
            this.baseOutputDir = output;
            return this;
        }).call(this);
       
    }

    async newCrawlerTab({id, url},flag) {
        try {
            const page = await this.browser.newPage();
            await page.setExtraHTTPHeaders({
                'Accept-Language': 'zh-CN,zh;q=0.9,zh-TW;q=0.8,en;q=0.7'
            });
            const urlname = url

            
            if (!urlname.startsWith('http://') && !urlname.startsWith('https://') ) {
                if(flag == 0){
                    url = 'https://' + url
                }else{
                    url = 'http://' + url
                }
                
            } 
            
            let updateSQL;
            try {
                const response1 = await page.goto(url, {timeout: 45000});

                await page.emulate(this.device);

                const cdp = await page.target().createCDPSession();
                const requestIds = [];
                const requests = {};

                await cdp.send('Network.enable');
                cdp.on('Network.requestWillBeSent', (req) => { requestIds.push(req.requestId); requests[req.requestId] = { request: req }; });
                cdp.on('Network.responseReceived', (res) => { if(requestIds.includes(res.requestId)){ requests[res.requestId].response = res; } });

                const response2 = await page.goto(url, {timeout: 45000});

                await page.waitForTimeout(5000);

                // const dir = `${this.baseOutputDir}/${urlname}`;
                const dir = `${this.baseOutputDir}/${id}`;

                if(!existsSync(dir)) {
                    await fs.mkdir(dir);
                }

                await page.screenshot({path: `${dir}/screenshot.png`});

                await compressPNG(`${dir}/screenshot.png`);

                const { data } = await cdp.send('Page.captureSnapshot', { format: 'mhtml' });
                
                let status = -1;
                if(response1 !== null) {
                    status = response1._status;
                } else if(response2 !== null) {
                    status = response2._status;
                } else if(data.length > 0) {
                    status = 200;
                } else {
                    throw Error('status error');
                }

                const parser = new Parser({});
                parser.parse(data);

                updateSQL = `update fraud_crawler_sustainable set web_status_code=${status}, sus_flag=2,task_finish_time='${timestamp()}' where crawler_id='${id}';`;
                await fs.writeFile(`${dir}/page.mhtml`, data);

                const array = parser.spit();
                for(let item of array) {
                    const {filename, content, type} = item;
                    if(type !== 'text/html') {
                        continue;
                    } else {
                        await fs.writeFile(`${dir}/page.html`, content);
                        break;
                    }
                }

                const currentURL = page.url();
                requests.originalURL = url;
                requests.currentURL = currentURL;

                await fs.writeFile(`${dir}/network.json`, JSON.stringify(requests));
            } catch(error) {
                const message = error.message;
                let errorType;
                if(message.startsWith('Navigation timeout')){
                    errorType = 'Navigation timeout';
                } else if(message.indexOf('at') > 0) {
                    errorType = message.split(' at ')[0];
                } else {
                    errorType = message;
                }

                updateSQL = `update fraud_crawler_sustainable set web_status_code=-1, sus_flag = -5 ,error='${errorType}', task_finish_time='${timestamp()}' where crawler_id='${id}';`;
                const database = this.db;
                console.log(updateSQL)
                await database.update(updateSQL);
                await page.close();
                if(message){
                    return('no way')
                }
            }


            const database = this.db;
            console.log(updateSQL)
            await database.update(updateSQL);
            await page.close();


        } catch(error) {
            console.error(error);
        }
    }

    async close() {
        await this.browser.close();
    }
}

(async ()=> {
    const argv = process.argv.splice(2);
    if (!argv || argv.length !== 2) {
        console.log('Parameter error!');
        process.exit(0);
    }
    const crawler = await new Crawler(puppeteer.devices['iPhone X']);

    const db = await new DB();
    crawler.db = db;


    // const rows = await db.fetchFromRedis('fraud_crawler', 1000);

    // await Promise.map(rows, async (row)=>{
    //     const {crawler_id, target_url} = row;
    //     await crawler.newCrawlerTab({id: crawler_id, url: target_url});
    // }, {concurrency: 50})
    // ??????????????????????????? ???????????????https ,????????????http
    url = argv[0]
    startFlag = 0
    if (url.startsWith('http://') || url.startsWith('https://') ) {
        startFlag  = 1 
    }        
    let falseMessage = ''
    falseMessage = await crawler.newCrawlerTab({id:argv[1],url: argv[0]},0);
    await crawler.close();
    const crawler1 = await new Crawler(puppeteer.devices['iPhone X']);
    crawler1.db = db;
    if(falseMessage == 'no way' && startFlag  != 1 ){
        falseMessage = await crawler1.newCrawlerTab({id:argv[1],url: argv[0]},1);
        crawler1.close();
    }

    await db.close();


    process.exit(0);
})();

