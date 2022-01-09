const util = require('util');
const exec = util.promisify(require('child_process').exec);

const { pngquant } = require('./config');

function formatDate(date) {
    const y = date.getFullYear();
    let m = date.getMonth() + 1;
    m = m < 10 ? '0' + m : m;
    let d = date.getDate();
    d = d < 10 ? ('0' + d) : d;
    return y + '-' + m + '-' + d;
};


function formatTime(date) {
    let h = date.getHours();
    h = h < 10 ? '0' + h : h;
    let m = date.getMinutes();
    m = m < 10 ? '0' + m : m;
    let s = date.getSeconds();
    s = s < 10 ? '0' + s : s;
    return h + ':' + m + ':' + s;
};


function formatDateTime(date) {
    const fDate = formatDate(date);
    const fTime = formatTime(date);
    return fDate + ' ' + fTime;
};


function timestamp() {
    return formatDateTime(new Date());
}

async function compressPNG(pngPath) {
    try {
        const { stdout, stderr } = await exec(`${pngquant}  --force --quality=45-85 ${pngPath} -o ${pngPath}`);
    } catch(err) {
        console.error(err);
    }
}


module.exports = {
    formatDate,
    formatTime,
    formatDateTime,
    timestamp,
    compressPNG
};