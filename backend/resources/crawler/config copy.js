const config = {
    browser: {
        executablePath: '/usr/bin/google-chrome',
        args: ['--no-sandbox', '--disable-dev-shm-usage', '--disable-gpu', '--ignore-certificate-errors']
    },
    mongo: {
        db: '',
        uri: 'mongodb://fraud:N0_fr%40ud@ml.a0ab.com:27017/fraud_detection'
    },
    mysql: {
        host: 'ml.a0ab.com',
        port: 3306,
        user: 'fraud',
        password: 'N0_fr@ud',
        database: 'fraud_detection_v2'
    },
    // output: `${__dirname}/../seaweedfs/data/mount/work_of_scam/webpage`,
    output:`${__dirname}/crawler_result`,
    pngquant: `${__dirname}/bin/pngquant`,
    redis: {
        port: 16379,
        host: '10.176.36.25',
        family: 4
    },
}

module.exports = config;
