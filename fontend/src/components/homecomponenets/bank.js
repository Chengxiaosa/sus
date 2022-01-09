import React, {Component} from 'react';
import Frame from "../Frame";
import FrameTitle from "../FrameTitle";
import "../../assets/css/homestyle.css"
import HomeLineChart from "./HomeLineChart"

export default class Bank extends Component {
    render(){
        // let BankSrc=[];
        // for(let i in this.props.Banks){
            
        //     let banksrc = require("../../imgs/"+this.props.Banks[i].icon).default;
        //     BankSrc.push(banksrc);
        // }
        // console.log(this.props.hostProviders[0].provider)
            
        return(
            // (this.props.hostProviders[0].number === 0)?
            // <div style={{color:"white"}}><h2>loading...</h2></div>
            // :
            <Frame>
                <FrameTitle value="主机提供商"/>
                
                <div id={"home4"} style={{height:"353px",width:"100%"}}>
                    <HomeLineChart data={this.props.hostProviders} barId={"home4"}/>
                </div>
                
                
                {/* <div className="imgs">
                {
                    BankSrc.map((item)=>{
                        return(
                            
                            <div style={{width:"20%",textAlign:"center"}}>
                                <img src={item} alt="银行" width="70%" style={{marginTop:"14.5px",backgroundColor:"white"}}></img>
                            </div>
                           
                        )
                    })
                }
                </div> */}

                <br/>
                
            </Frame>
        );
    }
}