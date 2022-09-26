const fs = require('fs').promises;
const existsSync = require('fs').existsSync;
const puppeteer = require('puppeteer-core');
const Promise = require('bluebird');
const util = require('util');
const {Parser} = require("fast-mhtml");

const exec = util.promisify(require('child_process').exec);
const {browser, bin, pngquant, output} = require('./config');

// const { timestamp, compressPNG } = require('./utils');

async function compressPNG(pngPath) {
    try {        
        if (!existsSync(bin)) {
            await fs.mkdir(bin);
            await exec(`touch ${pngquant}`);
            await exec(`chmod 777 ${pngquant}`);
        } else if (!existsSync(pngquant)){
            await exec(`touch ${pngquant}`);
            await exec(`chmod 777 ${pngquant}`);
        }

        const {stdout, stderr} = await exec(`${pngquant}  --force --quality=45-85 ${pngPath} -o ${pngPath}`);
    } catch (err) {
        console.error(err);
    }
}

class Crawler {
    constructor(device) {
        return (async () => {
            this.browser = await puppeteer.launch(browser);
            this.device = device;
            this.baseOutputDir = output;
            return this;
        }).call(this);

    }

    async newCrawlerTab({url}) {
        try {
            const page = await this.browser.newPage();
            try {
                let URL;
                if (!url.startsWith('http')) {
                    URL = 'https://' + url
                } else {
                    URL = url
                }
                console.log('in javascript, url = ' + URL);

                const response1 = await page.goto(URL, {timeout: 5000});
                await page.emulate(this.device);
                console.log("response1有反应")
                const cdp = await page.target().createCDPSession();
                const requestIds = [];
                const requests = {};

                await cdp.send('Network.enable');
                cdp.on('Network.requestWillBeSent', (req) => {
                    requestIds.push(req.requestId);
                    requests[req.requestId] = {request: req};
                });
                cdp.on('Network.responseReceived', (res) => {
                    if (requestIds.includes(res.requestId)) {
                        requests[res.requestId].response = res;
                    }
                });

                const response2 = await page.goto(URL, {timeout: 5000});
                await page.waitForTimeout(5000);
                console.log("response2有反应")
                const dir = `${this.baseOutputDir}/${url}`;
                if (!existsSync(dir)) {
                    await fs.mkdir(dir);
                }

                await page.screenshot({path: `${dir}/screenshot.png`});
                console.log('finish saving screenshot');

                await compressPNG(`${dir}/screenshot.png`);
                console.log('finish saving compress png');

                const {data} = await cdp.send('Page.captureSnapshot', {format: 'mhtml'});

                let status = -1;
                if (response1 !== null) {
                    status = response1._status;
                } else if (response2 !== null) {
                    status = response2._status;
                } else if (data.length > 0) {
                    status = 200;
                } else {
                    throw Error('status error');
                }

                const parser = new Parser({});
                parser.parse(data);

                await fs.writeFile(`${dir}/page.mhtml`, data);
                console.log('finish saving mhtml');

                const array = parser.spit();
                for (let item of array) {
                    const {filename, content, type} = item;
                    if (type === 'text/html') {
                        await fs.writeFile(`${dir}/page.html`, content);
                        console.log('finish saving html');
                        break;
                    }
                }

                const currentURL = page.url();
                requests.originalURL = URL;
                requests.currentURL = currentURL;
                await fs.writeFile(`${dir}/network.json`, JSON.stringify(requests));
            } catch (error) {
                const message = error.message;
                let errorType;
                if (message.startsWith('Navigation timeout')) {
                    errorType = 'Navigation timeout';
                } else if (message.indexOf('at') > 0) {
                    errorType = message.split(' at ')[0];
                } else {
                    errorType = message;
                }
                console.log(message);
            }

            await page.close();
        } catch (error) {
            console.error(error);
        }
    }

    async close() {
        await this.browser.close();
    }
}

(async () => {
    const argv = process.argv.splice(2);
    // if (!argv || argv.length !== 1) {
    //     console.log('Parameter error!');
    //     process.exit(0);
    // }
    const crawler = await new Crawler(puppeteer.devices['iPhone X']);

    // await crawler.newCrawlerTab({url: argv[0]});
    await crawler.newCrawlerTab({url: 'www.baidu.com'});    

    // const rows = [[10, 'https://www.renrendai.com/'], [11, 'https://www.leyu586.com/'], [12, 'https://xiaodai.meituan.com']];
    // await Promise.map(rows, async (row) => {
    //     const crawler_id = row[0];
    //     const target_url = row[1];
    //     await crawler.newCrawlerTab({id: crawler_id, url: target_url});
    // }, {concurrency: 1})

    await crawler.close();
    process.exit(0);
})();
