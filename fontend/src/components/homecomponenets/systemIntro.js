import React, { Component } from 'react';
import Frame from "../Frame";
import FrameTitle from "../FrameTitle";
import { makeStyles } from '@material-ui/core/styles';
import Paper from '@material-ui/core/Paper';
import Grid from '@material-ui/core/Grid';
import rArrow from "../../imgs/rarrow.png"
import "../../assets/css/imgView.css"
// import "../../assets/css/photoTurning.css"
import home1 from "../../imgs/home1.png"
import home2 from "../../imgs/home2.png"
import home3 from "../../imgs/home3.png"
import home4 from "../../imgs/home4.png"
import ReactDOM from 'react-dom';
import "react-responsive-carousel/lib/styles/carousel.min.css"; // requires a loader
import { Carousel } from 'react-responsive-carousel';


export default class SystemIntro extends Component {
    render(){
        return(
            <Frame heightZZ = "100">
                    <FrameTitle value="今日新增"/>
                    <div style={{alignContent:"center",height:"100%"}} >
                        {/* 轮流播放插件 */}
                        <Carousel showThumbs = {false} autoPlay = {true} infiniteLoop = {true}  >
                            <div style = {{height:"100%"}}>
                                <img src={home1} style = {{width:"87%"}} />
                                <p className="legend">新增截图 1</p>
                            </div>
                            <div style = {{height:"100%"}}>
                                <img src={home2} style = {{width:"87%"}}/>
                                <p className="legend">新增截图 2</p>
                            </div>
                            <div style = {{height:"100%"}}>
                                <img src={home3}  style = {{width:"87%"}}/>
                                <p className="legend">新增截图 3</p>
                            </div>
                            <div style = {{height:"100%"}}>
                                <img src={home4} style = {{width:"87%"}}/>
                                <p className="legend">新增截图 4</p>
                            </div>
                        </Carousel>

                    </div>
                    
            </Frame>
        );
    }    
}
