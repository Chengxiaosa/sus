const config = {
    browser: {
        executablePath: '/usr/bin/google-chrome',
        args: ['--no-sandbox', '--disable-dev-shm-usage', '--disable-gpu', '--ignore-certificate-errors']
    },
    // output: `${__dirname}/crawler_result`,
    output:`/mnt/hard_disk/new/crawler/crawler_result`,
    bin: `${__dirname}/bin`,
    pngquant: `${__dirname}/bin/pngquant`,
}

module.exports = config;
