import React, { Component } from 'react';
import Frame from "../Frame";
import FrameTitle from "../FrameTitle";
import { makeStyles } from '@material-ui/core/styles';
import Paper from '@material-ui/core/Paper';
import Grid from '@material-ui/core/Grid';
import HomeBarChart from "./HomeBarChart";
import "../../assets/css/homestyle.css";

// const useStyles = makeStyles((theme) => ({
//     root: {
//       flexGrow: 1,
//     },
//     paper: {
//       padding: theme.spacing(0),
//       textAlign: 'center',
//       backgroundColor: '#143340',
//       color:'white',
//       fontSize:"16px",
//     },
//   }));

export default class RankIP extends Component {
    render(){
        // const classes = useStyles();
    
        return(
            <Frame>
                <FrameTitle value="IP所在城市"/>
                <div>
                    <Grid container spacing={0}>
                        <Grid item xs={3}>
                            <div className="rankpaper">
                                <p>排名</p>
                                <div style={{fontSize:'14px'}}>
                                {
                                    this.props.IPs.map((value,key)=>{
                                        return (
                                            <div style={{width:"35%",marginLeft:"30%"}}>
                                                <div key={key} className="rankNum">{key+1}
                                                </div>
                                            </div>
                                        )
                                    })
                                }
                                </div>
                            </div>
                        </Grid>
                        <Grid item xs={9}>
                            <div className="rankpaper">
                                <div>
                                    <div style={{float:"flex",justifyContent:"center",marginTop:"16px",marginBottom:"10px"}}>
                                        <span style={{position:"relative",right:"25%"}}>城市</span>
                                        <span style={{position:"relative",left:"11%"}}>IP数</span>
                                    </div>
                                    {/* <p>城市&emsp;&emsp;&emsp;&emsp;IP数</p> */}
                                    <div id={"home2"} style={{height:"212px",width:"100%"}}>
                                        <HomeBarChart data={this.props.IPs} barId={"home2"}/>
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