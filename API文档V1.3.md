
# 查询total
## GET /total
### 参数列表
### 返回值
```
{
    "totalSeed":,//种子数量
    "totalScanSite":,//累计扫描可疑网站
    "totalApp":,//累计发现诈骗APP数量
    "totalSite":,//累计发现诈骗网站数量
    "totalScanApp":,//累计扫描APP数量
}
```

# 查询daily
## GET /daily
### 参数列表
### 返回值
```
{
    "dailySiteNum":,//当日识别诈骗网站数量
    "dailySites":[//当日识别的黑产网站
        {
            "date":"",
            "type":"",
            "ip":"",
            "purl":""
        }
    ]
    "dailyScanSite":,//当日扫描可疑网站数量
}
```

# 查询服务器资源信息
## GET /Server
### 参数列表
### 返回值
```
{
    "cpu":,//CPU占用
    "memory":,//内存占用
    "bandwidth":,//带宽
    "request":,//请求次数
    "diskRate"://磁盘速率
}
```

# 查询自治系统信息
## GET /network/AS
### 参数列表
### 返回值
```
{
    AS:[
        {
            "asName":,//AS名称
            "ipNum":,//ip数
            "domainNum"://域名数
            "industry"://AS行业类型
        }
    ]
}

```

# 查询顶级域名分布信息
## GET /network/tld
### 参数列表
### 返回值
```
{
    tld:[
        {
            "tldName":,
            "tldNumber":
        }
    ]
}
```

# 查询注册商信息
## GET /network/registrar
### 参数列表
### 返回值
```
{
    registrar:[
        {
        "registrar":,
        "number":,
        "proportion":
        }
    ]

}
```

# 查询行业信息
## GET /network/industry
### 参数列表
### 返回值
```
{
    industry:[
        {
        "industry":,
        "number":,
        "proportion":
        }
    ]

}
```

# 查询城市信息
## GET /network/city
### 参数列表
### 返回值
```
{
    city:[
        "cityName",
        "cityIpNum":,
        "long":,
        "lat":,
        "cityIpNumHis",
        "cityIpNumToday":
    ]
}
```

# 查询国家信息
## GET /network/country
### 参数列表
### 返回值
```
{
    country:[
        "cuntryIpNum":,
        "long":,
        "lat":,
        "countryIpNumHis",
        "countryIpNumToday":
    ]
}
```

# 查询家族/集群信息
## GET /cluster
### 参数列表
### 返回值
```
{
    cluster:[
        "clusterVisitIn30d":,//家族30天内访问量
        "clusterType":,//家族涉黑类型
        "clusterIps":,//家族的IPlist
        "findDate":,//发现该家族日期
        "clusterTotalDomain":,//家族总共域名数量
        "clusterTotalIP":,//家族总共IP数量
        "clusterUUid":,//家族编号
    ]
}
```

# 根据url查询可疑网站
## POST /findSitesByUrl
### 参数列表
名称 | 类型|描述
---- | ---|---
url|string|种子的域名

### 返回值
```
{
    "pUrl"：，//种子网站截图
    "discovery":[//新发现可疑网站
        {
            domainFromCert://证书共同主体
            domainFromDns://DNS记录
            domainFromSubnet://同有子网
            generationDomain://域名生成
        }
    ]

}
```

# 深入挖掘：域名查询
## POST /exploit/findSitesByDomain
### 参数列表
名称 | 类型|描述
---- | ---|---
domain|string|种子的域名

### 返回值
```
{
    "screenshot":,//网站页面
    "ip":,//ip
    "long":，//经度
    "lat":,//纬度
    "address":,//定位地点
    "registrar":,//注册商（网站主体信息）
    "registerTime":,//注册时间（网站主体信息）
    "redirect":[],//后台服务器地址
    "type":,//网站类型
    "relatedSites":[]//潜在同伙网站
}
```

# 通过域名查询证书
使用模块： 深入挖掘
## POST /findCertificateByDomain
### 参数列表
名称 | 类型|描述
---- | ---|---
domain|string|种子的域名

### 返回值
```
{
    "certType":,//证书类型
    "issuer":,//证书颁发者
    "certSerial":,//证书序列号
    "expireTime"://过期时间

}
```

# 通过IP查询所在城市以及经纬度
使用模块:网站集群
## POST /findCityByIp
### 参数列表
名称 | 类型|描述
---- | ---|---
area|int|地图的范围（1为全球，2为境内，3为境外）
IP|string|要查询地址的IP

### 返回值
```
{
    "CityData":[//当日发现IP所属城市
        {
            "ip":,//查询时使用的IP
            "cityName":,//城市
            "long":,//经度
            "lat"://纬度
        }
    ]
}
```


# 根据集群查找集群信息
使用模块：网站集群  
## POST /findClusterByid
### 参数列表
名称 | 类型|描述
---- | ---|---
clusterId|int|家族编号

### 返回值
```
 {
    "clusterDomains": [],//域名分布
    "clusterMainScreenshot":,//网站截图
    "domainType": [],//集群信息：网站类型
    "dnsIpCluster": [],//集群信息：后台服务器地址
    "ipCluster": ,//集群信息:ip地址
    "siteMainInfo": ,//集群信息:网站主体信息
    "clusterDynamics":[//集群动态
        {
            "date":,//发现时间
            "action",//行为
        }

    ],
}
```
# 根据前端传入的list判断网站危险性
使用模块：足迹发现
## POST /judge
### 参数列表
名称 | 类型|描述
---- | ---|---
domains|list|域名集合

### 返回值
```
{
    "errorDomains":[]//无法解析的域名和IP
    "goodDomains":[]//低风险的域名
    "badDomains":[]//高危的域名
    "uncertainDomains":[]//不能确定的域名
    "result":[//结果分析 高危诈骗网站和低风险网站
        {
            "type":,//1为高危0为低风险
            "number":,//数量
            "proportion"://占比
        },
    ]
    "pUrlkid1"://识别结果截图左
    "pUrlkid2"：//识别结果截图右
}
```

# 深入挖掘：APP查询
## POST /exploit/findAppByPath
### 参数列表
名称 | 类型|描述
---- | ---|---
path|string|app的路径

### 返回值
```
{
    "icon":,//app图标
    "screenshot":,//截图
    "domain":,//后台域名
    "ip":,
    "long":，//经度
    "lat":,//纬度
    "address":,//地址
    "family":,//家族
    "platform":,//分发平台
    "version":,//版本号
    "produceTime":,//制作时间
    "paymentChannel":[
        {

            "channel":,//支付渠道
            "channelIcon"://图标
        }
    ],
    "accounts":[//收款账户
        {
            "accountNo":,//账户号码
            "bank":,//银行
            "person":,//开户人
            "bankIcon"://银行图标
        }
    ],
    "signature":{
        "issuer":,//签名发布者
        "signTime":,//签名时间
        "mD5":
    },
    "relatedSite"://true为发现了相关网站，false为没发现
}
