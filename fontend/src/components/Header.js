import zIndex from '@material-ui/core/styles/zIndex';
import React, { Component } from 'react';
import "../assets/css/header.css";
import Title_Img from "../imgs/title_logo.png";
import Nav from './Nav';

//画时钟函数
function drawClock() {
    let w = window.innerWidth
        || document.body.clientWidth;
    let canvas = document.getElementById('canvas_clock');
    //canvas容器没有准备好时，直接return
    if (!canvas) return;
    canvas.width = 300;
    let now = new Date();
    let ctx = canvas.getContext('2d');
    ctx.save();
    //设置放缩比例
    let scale_number = w / 1536;
    ctx.clearRect(0, 0, 160 * scale_number, 160 * scale_number);
    //设置始终位置并按比例自适应
    let translate_x = 175 * scale_number, translate_y = 25;
    ctx.translate(translate_x, translate_y);
    ctx.scale(0.13 * scale_number, 0.13 * scale_number);
    ctx.rotate(-Math.PI / 2);
    ctx.strokeStyle = "#3ac0d8";
    ctx.fillStyle = "#143340";
    ctx.lineWidth = 4;
    ctx.lineCap = "round";
    // Hour marks
    ctx.save();
    for (let i = 0; i < 12; i++) {
        ctx.beginPath();
        ctx.rotate(Math.PI / 6);
        ctx.moveTo(100, 0);
        ctx.lineTo(120, 0);
        ctx.stroke();
    }
    ctx.restore();
    // Minute marks
    ctx.save();
    ctx.lineWidth = 5;
    for (let i = 0; i < 60; i++) {
        if (i % 5 != 0) {
            ctx.beginPath();
            ctx.moveTo(117, 0);
            ctx.lineTo(120, 0);
            ctx.stroke();
        }
        ctx.rotate(Math.PI / 30);
    }
    ctx.restore();
    var sec = now.getSeconds();
    var min = now.getMinutes();
    var hr = now.getHours();
    hr = hr >= 12 ? hr - 12 : hr;
    ctx.fillStyle = "black";
    // write Hours
    ctx.save();
    ctx.rotate(hr * (Math.PI / 6) + (Math.PI / 360) * min + (Math.PI / 21600) * sec)
    ctx.lineWidth = 10;
    ctx.beginPath();
    ctx.moveTo(-20, 0);
    ctx.lineTo(80, 0);
    ctx.stroke();
    ctx.restore();
    // write Minutes
    ctx.save();
    ctx.rotate((Math.PI / 30) * min + (Math.PI / 1800) * sec)
    ctx.lineWidth = 8;
    ctx.beginPath();
    ctx.moveTo(-28, 0);
    ctx.lineTo(112, 0);
    ctx.stroke();
    ctx.restore();
    // Write seconds
    ctx.save();
    ctx.rotate(sec * Math.PI / 30);
    ctx.strokeStyle = "#5CD0FD";
    ctx.fillStyle = "#5CD0FD";
    ctx.lineWidth = 6;
    ctx.beginPath();
    ctx.moveTo(-30, 0);
    ctx.lineTo(83, 0);
    ctx.stroke();
    ctx.beginPath();
    ctx.arc(0, 0, 10, 0, Math.PI * 2, true);
    ctx.fill();
    ctx.beginPath();
    ctx.arc(95, 0, 10, 0, Math.PI * 2, true);
    ctx.stroke();
    ctx.fillStyle = "rgba(0,0,0,0)";
    ctx.arc(0, 0, 3, 0, Math.PI * 2, true);
    ctx.fill();
    ctx.restore();
    ctx.beginPath();
    ctx.lineWidth = 14;
    ctx.strokeStyle = '#5CD0FD';
    ctx.arc(0, 0, 142, 0, Math.PI * 2, true);
    ctx.stroke();
    ctx.restore();
    window.requestAnimationFrame(drawClock);
}


class Header extends Component {
    constructor(props) {
        super(props);
        this.state = {
            nav_number: this.props.nav_number,
        }
    }
    drawBorder() {
        let canvas = document.getElementById('tutorial');
        let ctx = canvas.getContext('2d');
        let w = window.innerWidth
            || document.body.clientWidth;
        canvas.width = w;
        let gradient = ctx.createLinearGradient(0, 0, canvas.width, 0);
        gradient.addColorStop(0, '#5cd0fd');
        gradient.addColorStop(0.25, '#ECE80F');
        gradient.addColorStop(0.5, '#5cd0fd');
        gradient.addColorStop(0.75, '#ECE8EF');
        gradient.addColorStop(1, '#5cd0fd');
        ctx.strokeStyle = gradient;
        ctx.lineWidth = 3;
        ctx.beginPath();
        ctx.moveTo(0, 0);
        ctx.lineTo(w / 10, 70);
        ctx.lineTo((15 * w) / 40, 70);
        ctx.lineTo((2 * w) / 5, 105);
        ctx.lineTo((3 * w) / 5, 105);
        ctx.lineTo((25 * w) / 40, 70);
        ctx.lineTo((9 * w) / 10, 70);
        ctx.lineTo(w, 0);
        ctx.stroke();
    }


    // time(){
    //     let time=new Date();
    //     let daytime=' 星期'+'日一二三四五六'.charAt(time.getDay());
    //     let datetime=time.getFullYear()+"年"+(time.getMonth()+1)+"月"+time.getDate()+"日";
    //     let clock_time=time.getHours()+":"+time.getMinutes();
    //     let string_time=datetime+" "+daytime+" "+clock_time;
    //     return string_time; 
    // }

    canvasDrawBorder() {
        this.drawBorder();
        window.addEventListener('resize', this.drawBorder);
    }

    componentDidMount() {
        this.canvasDrawBorder();
        window.requestAnimationFrame(drawClock);
    }




    render() {
        return (
            <div>
                <div className="heading" style={{ position: "relative" }}>
                    <div style={{ position: "absolute", left: "11%", top: "13%" }}><Nav nav_number={this.props.nav_number} /></div>
                    <canvas id="canvas_clock" style={{ position: "absolute", left: "76%", top: "4%" }}>
                    </canvas>
                    <div style={{ zIndex: "-1" }}><canvas id="tutorial" style={{ position: "absolute" }}>
                    </canvas></div>
                    <div id="time" style={{ color: "#5CD0FD", position: "relative", left: "70%", top: "15%", margin: "0px" }}>
                        {/* {setInterval("time.innerHTML=new Date().getFullYear()+" +''+
                            "' 星期'+'日一二三四五六'.charAt(new Date().getDay());", 1000)} */}
                        {setInterval(() => {
                            let time = new Date();
                            let daytime = ' 星期' + '日一二三四五六'.charAt(time.getDay());
                            let datetime = time.getFullYear() + "年" + (time.getMonth() + 1) + "月" + time.getDate() + "日";
                            let Hours=time.getHours()<10?'0'+time.getHours():time.getHours();
                            let Minutes=time.getMinutes()<10?'0'+time.getMinutes():time.getMinutes();
                            let clock_time = Hours + ":" + Minutes;
                            let string_time = datetime + " " + daytime + " " + clock_time;
                            if (document.getElementById("time"))
                                document.getElementById("time").innerHTML = string_time;
                        }, 1000)}
                    </div>
                    <div style={{ width: "6%", position: "absolute", left: "44%", top: "5%", margin: "0px" }}>
                        <img src={Title_Img} style={{ width: "90%", position: "absolute" }} />
                    </div>
                    <span className="Title" style={{ left: "51%" }}>白&emsp;泽</span>
                    <p className="Title" style={{ top: "40%", fontSize: "16px" }}>反诈骗网站的智能侦查取证研判系统</p>
                </div>
            </div>
        )
    }
}

export default Header;
