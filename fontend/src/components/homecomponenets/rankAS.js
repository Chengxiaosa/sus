import React, { Component } from 'react';
import Frame from "../Frame";
import FrameTitle from "../FrameTitle";
import { makeStyles } from '@material-ui/core/styles';
import Paper from '@material-ui/core/Paper';
import Grid from '@material-ui/core/Grid';
import HomeBarChart from "./HomeBarChart"
import "../../assets/css/homestyle.css"

export default class RankAS extends Component {  
    // const classes = useStyles();
    render(){
        return(
            <Frame>
                <FrameTitle value="IP所属自治系统统计"/>
                <div>
                    <Grid container spacing={0}>
                        <Grid item xs={3}>
                            <div className="rankpaper">
                                <p>排名</p>
                                
                                <div style={{fontSize:'14px'}}>
                                    {/* 有空优化一下代码 */}
                                    <div style={{width:"35%",marginLeft:"30%"}}>
                                        <div key={0} className="rankNum">{1}
                                        </div>
                                    </div>
                                    <div style={{width:"35%",marginLeft:"30%"}}>
                                        <div key={1} className="rankNum">{2}
                                        </div>
                                    </div>
                                    <div style={{width:"35%",marginLeft:"30%"}}>
                                        <div key={2} className="rankNum">{3}
                                        </div>
                                    </div>
                                    <div style={{width:"35%",marginLeft:"30%"}}>
                                        <div key={3} className="rankNum">{4}
                                        </div>
                                    </div>
                                    <div style={{width:"35%",marginLeft:"30%"}}>
                                        <div key={4} className="rankNum">{5}
                                        </div>
                                    </div>
                                {/* {
                                    this.props.AsAtIps.map((value,key)=>{
                                        return (
                                            <div style={{width:"35%",marginLeft:"30%"}}>
                                                <div key={key} className="rankNum">{key+1}
                                                </div>
                                            </div>
                                        )
                                    })
                                } */}
                                </div>
                            </div>
                        </Grid>
                        <Grid item xs={9}>
                            <div className="rankpaper">
                                <div >
                                    <div style={{float:"flex",justifyContent:"center",marginTop:"16px",marginBottom:"8px"}}>
                                        <span style={{position:"relative",right:"23%"}}>AS</span>
                                        <span style={{position:"relative",left:"5%"}}>域名数</span>
                                    </div>
                                    <div id={"home_as"} style={{height:"212.3px",width:"100%",marginBottom:"0px"}}>
                                        <HomeBarChart data={this.props.AsAtIps} barId={"home_as"}/>
                                    </div>
                                </div>
                            </div>
                        </Grid>
        
                    </Grid>
                </div>

            </Frame>
        );
    }
}