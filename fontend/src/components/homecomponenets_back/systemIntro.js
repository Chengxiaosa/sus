import React, { Component } from 'react';
import Frame from "../Frame";
import FrameTitle from "../FrameTitle";
import { makeStyles } from '@material-ui/core/styles';
import Paper from '@material-ui/core/Paper';
import Grid from '@material-ui/core/Grid';
import rArrow from "../../imgs/rarrow.png"


export default class SystemIntro extends Component {
    render(){
        return(
            <Frame>
                <FrameTitle value="系统简介"/>
                <div className="Intropaper" style={{width:"90%", marginLeft:"5%", marginTop:"8%", marginBottom:"4%", height:"750px"}}>
                    <div className="Introitem">
                        <div style={{width:"25%"}}>
                            <img src={rArrow} width="100%"></img>
                        </div>
                        <div style={{marginLeft:"3%"}}>
                            白泽系统基于已知诈骗网站，自动挖掘潜在诈骗网站，并进行高精准研判，形成“查-甄-判”为一体的智能侦查取证研判系统。
                        </div>
                    </div>
                    <br/>
                    <div className="Introitem">
                        <div style={{width:"40%"}}>
                            <img src={rArrow} width="100%"></img>
                        </div>
                        <div style={{marginLeft:"3%"}}>
                            系统基于少量已知诈骗网站，创新性地提出运用开发者足迹发现未知诈骗网站，化被动为主动，
                            将打击电信网络诈骗犯罪由传统的“案发事后追踪”模式改变为新型的“案前事先预防”模式。
                        </div>
                    </div>
                    <br/>
                    <div className="Introitem">
                        <div style={{width:"25%"}}>
                            <img src={rArrow} width="100%"></img>
                        </div>
                        <div style={{marginLeft:"3%"}}>
                            本系统针对性地构建了抗加密的“端到端”诈骗信息收集链路，可有效规避证书加密、IP屏蔽、代码反调试、页面隐藏伪装等反侦察手段的干扰。
                        </div>
                    </div>
                    <br/>
                    <div className="Introitem">
                        <div style={{width:"27%"}}>
                            <img src={rArrow} width="100%"></img>
                        </div>
                        <div style={{marginLeft:"3%"}}>
                            可对诈骗网站特征进行多维度的归纳总结，挖掘其特点与共性，揭露网络黑产的复杂生态体系，披露电信网络诈骗生态中的多方参与者，为公安机关进一步精准打击提供方向性指导。
                        </div>
                    </div>
                    <br/>
                    <div className="Introitem">
                        <div style={{width:"18%"}}>
                            <img src={rArrow} width="100%"></img>
                        </div>
                        <div style={{marginLeft:"3%"}}>
                             目前，本系统已由厦门警方试运行，并取得初步成效。经国家反诈骗中心厦门分中心验证，诈骗网站准确率达到99.03%。
                        </div>
                    </div>
                    <br/>
                </div>
            </Frame>
        );
    }    
}

{/* <Grid container spacing={0}>
                    <Grid item xs={6}>
                        <div className="paper" >
                            
                        </div>
                    </Grid>
                    <Grid item xs={6}>
                        <div className="paper">
                            
                        </div>
                    </Grid>
                </Grid> */}