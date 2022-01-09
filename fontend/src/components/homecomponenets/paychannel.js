import React, {Component} from 'react';
import Frame from "../Frame";
import FrameTitle from "../FrameTitle";
import HomeBarChart from "./HomeBarChart"

export default class PayChannel extends Component {
    render(){
        let IconSrc=[];
        for(let i in this.props.PaymentChannels){
            
            let iconsrc = require("../../imgs/"+this.props.PaymentChannels[i].icon).default;
            IconSrc.push(iconsrc);
        }
        
        return(
            <Frame>
                <FrameTitle value="支付渠道"/>
                <div id={"home3"} style={{height:"351px",width:"100%"}}>
                    <HomeBarChart data={this.props.PaymentChannels} barId={"home3"}/>
                </div>

                <div className="imgs">
                {
                    IconSrc.map((item)=>{
                        return(
                            
                            <div style={{width:"20%",textAlign:"center"}}>
                                <img src={item} alt="支付渠道"  width="70%" style={{marginTop:"14.5px",backgroundColor:"white"}}></img>
                            </div>
                           
                        )
                    })
                }
                </div>

                <br/>
            </Frame>
        );
    }
}