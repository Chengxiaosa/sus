from flask import Flask, request, jsonify
import json, random, string
app = Flask(__name__)



@app.route('/')
def hello():
    return 'Hello World!' 

#exploitapp
@app.route('/total',methods = ['GET'])
def total(): 
    return 'Hello World!' 

# headpage
@app.route('/head',methods = ['GET'])
def head():
    totalSite = random.randint(1,100000000)
    totalApp = random.randint(1,10000000)
    rankTLD = random_array(5,"domain","domainNum")
    rankIP = random_array(5,"city","ipNum")
    server = {
        "cpu": 0.75,
        "memory": 0.75,
        "bandwidth": 100,
        "request": random.randint(1,1000)
        }
    data = {
        "site":random.randint(1,100),
        "app":random.randint(1,50),
        "city":"BeiJing"
        }
    rankPaymentChannel = random_array(5,"channel","number")
    rankBank = random_array(5,"bank","number")

    dict = {
        "totalSite": totalSite,
        "totalApp": totalApp, 
        "rankTLD": rankTLD,
        "rankIP": rankIP, 
        "server": server,
        "dailyData": data,
        "rankPaymentChannel": rankPaymentChannel,
        "rankBank": rankBank
        }
    return jsonify(dict)

def random_array(n,a,b,c=0): # n=len(array)
    res = []
    for i in range(n):
        tmp = {a:''.join(random.sample('abcdefghijklmnopqrstuvwxyz',random.randint(2,4))),
            b:random.randint(1,100)}
        if c:
            tmp[c] = random.randint(1,100)
        res.append(tmp)
    return res


# statisticpage
@app.route('/statistics', methods = ['GET'])
def statistics():
    rankAsAtIp = []
    asIndustry = []
    tldDistribution = []
    rankIpCity = []
    domainAtRegistrar = []
    seedNum = random.randint(1, 1000)
    avgSeedNum = random.randint(1, 1000)
    foundSites = random.randint(1, 10000000)
    foundApps = random.randint(1, 10000000)
    
    for i in range(10):
        ipNum = random.randint(1, 1000)
        tmp1 = {"asName": ''.join(random.sample('ABCDEFGHIJKLMNOPQRSTUVWXYZ',random.randint(3,10))), 
               "ipNum": ipNum, 
               "domainNum": ipNum}
        rankAsAtIp.append(tmp1)
        tmp2 = {"tld": '.' + ''.join(random.sample('ABCDEFGHIJKLMNOPQRSTUVWXYZ',random.randint(3,10))), 
                "number": random.randint(1, 1000)}
        tldDistribution.append(tmp2)
        tmp3 = {"city": ''.join(random.sample('abcdefghijklmnopqrstuvwxyz',random.randint(2,4))), 
                "ipNum": random.randint(1, 1000)}
        rankIpCity.append(tmp3)
    
    alist = []
    sum = 0
    for i in range(3):
        tmp = random.randint(1, 1000)
        alist.append(tmp)
        sum = sum + tmp
    for i in range(3):
        tmp = {"industry": ''.join(random.sample('abcdefghijklmnopqrstuvwxyz',random.randint(2,4))), 
               "number": alist[i], 
               "proportion": alist[i] / sum}
        asIndustry.append(tmp)
        
    alist = []
    sum = 0
    for i in range(7):
        tmp = random.randint(1, 1000)
        alist.append(tmp)
        sum = sum + tmp
    for i in range(7):
        tmp = {"registrar": ''.join(random.sample('abcdefghijklmnopqrstuvwxyz',random.randint(2,4))), 
               "number": alist[i], 
               "proportion": alist[i] / sum}
        domainAtRegistrar.append(tmp)
    
    dict = {
        "rankAsAtIp": rankAsAtIp, 
        "asIndustry": asIndustry, 
        "tldDistribution": tldDistribution, 
        "rankIpCity": rankIpCity, 
        "domainAtRegistrar": domainAtRegistrar, 
        "seedNum": seedNum, 
        "avgSeedNum": avgSeedNum, 
        "foundSites": foundSites, 
        "foundApps": foundApps
    }
    return jsonify(dict)

#findingpage
@app.route('/dailyfinding',methods = ['GET','POST'])
def finding(): 
    print("#################/dailyfinding")
    if request.method == 'POST': # TODO
        request_json=request.get_json(force=True)
        if request_json:
            ip = request_json['ip']
            domain = request_json['domain']
            certificate = request_json['certificate']
    
    server = {
        "cpu": {
            "cpuProp":random.randint(1,100),
            "cpuStatus":{
                "live":random.randint(1,5),
                "total":5
            }
        },
        "memory": {
            "memProp":random.randint(1,100),
            "memStatus":{
                "use":random.randint(1,128),
                "total":128
            }
        },
        "disk":{
            "diskProp":random.randint(1,100),
            "diskSpeed":random.randint(1,10)
        },
        "bandwidth": 100,
        "request": random.randint(1,5000),
        "rx":random.randint(1,10),
        "tx":random.randint(1,10)
        }
    dailydata = {
        "site":random.randint(1,100),
        "app":random.randint(1,50),
        "city":"BeiJing",
        "tLD":".cn"
        }
    sitesByIp = []
    sitesByDomain = []
    sitesByCert = []
    availableDomain = []
    for i in range(5):
        sitesByIp.append(random_url())
        sitesByDomain.append(random_url())
        sitesByCert.append(random_url())
        tmp = {"availDom":random_url(),
            "result":True}
        availableDomain.append(tmp)
    citys = []
    for i in range(10):
        citys.append(''.join(random.sample('abcdefghijklmnopqrstuvwxyz',random.randint(2,4))))
    dict = {
        "server" : server,
        "dailyData" : dailydata,
        "sitesByIp":sitesByIp,
        "sitesByDomain":sitesByDomain,
        "sitesByCert":sitesByCert,
        "availableDomain":availableDomain,
        "citys" : citys
    }
    return jsonify(dict)    

def random_url():
    url = "www."
    url += ''.join(random.sample('abcdefghijklmnopqrstuvwxyz',random.randint(5,12)))
    url += ".com"
    return url

#exploitpage
@app.route('/exploit',methods = ['GET','POST'])
def exploitpage():
    print("#############################exploit##########################")
    return "POST to ./app or ./sites to find more."
    
#exploitsites
@app.route('/exploit/sites',methods = ['GET','POST'])
def exploitsites(): 
    # this cant get here
    print("#############################exploit/sites##########################")
    if request.method == 'POST': # TODO
        request_json=request.get_json(force=True)
        if request_json:
            path = request_json['path']
    
    screenshot = {}
    ip = str(random.randint(1, 255)) + '.' + str(random.randint(1, 255)) + '.' + str(random.randint(1, 255)) + '.' + str(random.randint(1, 255))
    location = ''.join(random.sample('abcdefghijklmnopqrstuvwxyz',random.randint(5,10)))
    registrar = ''.join(random.sample('abcdefghijklmnopqrstuvwxyz',random.randint(2,4))) + '.com'
    redirect = 'https://' + ''.join(random.sample('abcdefghijklmnopqrstuvwxyz',random.randint(5,12))) + '.com/'
    type = ''.join(random.sample('abcdefghijklmnopqrstuvwxyz',random.randint(5,12)))
    peopleNum = random.randint(1, 10000000)
    certificate = {"certType": ''.join(random.sample('ABCDEFGHIJKLMNOPQRSTUVWXYZ',random.randint(3, 5))), 
                   "issuer": ''.join(random.sample('abcdefghijklmnopqrstuvwxyz',random.randint(8,15))), 
                   "subject": ''.join(random.sample('abcdefghijklmnopqrstuvwxyz',random.randint(5,12))) + '.com'}
    relatedSites = []
    for i in range(3):
        relatedSites.append(random_url())
    relatedApp = False
    if random.randint(0, 1) == 1:
        relatedApp = True
    relatedAppIcon = {}
    
    dict = {
        "screenshot": screenshot, 
        "ip": ip, 
        "location": location, 
        "registrar": registrar, 
        "redirect": redirect, 
        "type": type, 
        "peopleNum": peopleNum, 
        "certificate": certificate, 
        "relatedSites": relatedSites, 
        "relatedApp": relatedApp, 
        "relatedAppIcon": relatedAppIcon
    }
    return jsonify(dict)
    
#exploitapp
@app.route('/exploit/app',methods = ['GET','POST'])
def exploitapp(): 
    if request.method == 'POST': # TODO
        request_json=request.get_json(force=True)
        if request_json:
            path = request_json['path']
    
    icon = {}
    screenshot = {}
    domain = 'https://' + str(random.randint(100, 100000)) + '.com:' + str(random.randint(100, 100000))
    ip = str(random.randint(1, 255)) + '.' + str(random.randint(1, 255)) + '.' + str(random.randint(1, 255)) + '.' + str(random.randint(1, 255))
    location = ''.join(random.sample('abcdefghijklmnopqrstuvwxyz',random.randint(5,10)))
    family = ''.join(random.sample('abcdefghijklmnopqrstuvwxyz',random.randint(5,8)))
    platform = ''.join(random.sample('abcdefghijklmnopqrstuvwxyz',random.randint(3,5))) + '.me'
    version = 'V' + str(random.randint(1, 100)) + '.' + str(random.randint(1, 100)) + '.' + str(random.randint(100, 100000))
    produceTime = '2020.7.30' + ' 14:19:36'
    
    paymentChannel = []
    for i in range(4):
        tmp = {"channel": ''.join(random.sample('abcdefghijklmnopqrstuvwxyz',random.randint(5,8))), 
               "channelIcon": ''}
        paymentChannel.append(tmp)
        
    accounts = []
    for i in range(2):
        tmp = {"accountNo": random.randint(1000000000000000000, 10000000000000000000), 
               "bank": ''.join(random.sample('ABCDEFGHIJKLMNOPQRSTUVWXYZ',random.randint(3, 4))), 
               "person": ''.join(random.sample('abcdefghijklmnopqrstuvwxyz',random.randint(5,10))), 
               "bankIcon": ''}
        accounts.append(tmp)
    
    signature = {"issuer": ''.join(random.sample('abcdefghijklmnopqrstuvwxyz',random.randint(5,10))), 
                 "signTime": '2017.8.19 14:02:31', 
                 "mD5": 'ACDCF0E956A8C986D6C8E0C4B076432B'}
    relatedSites = False
    if random.randint(0, 1) == 1:
        relatedSites = True
    
    dict = {
        "icon": icon, 
        "screenshot": screenshot, 
        "domain": domain, 
        "ip": ip, 
        "location": location, 
        "family": family, 
        "platform": platform, 
        "version": version, 
        "produceTime": produceTime, 
        "paymentChannel": paymentChannel, 
        "accounts": accounts, 
        "signature": signature, 
        "relatedSites": relatedSites
    }
    return jsonify(dict)



if __name__ == '__main__':
    # app.run(host='10.177.35.156',port=5000, debug = True)
    app.run(host='127.0.0.1',port=5001, debug = True)


