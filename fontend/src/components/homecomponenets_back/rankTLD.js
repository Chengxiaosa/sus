import React, { Component } from 'react';
import Frame from "../Frame";
import FrameTitle from "../FrameTitle";
import { makeStyles } from '@material-ui/core/styles';
import Paper from '@material-ui/core/Paper';
import Grid from '@material-ui/core/Grid';
import HomeBarChart from "./HomeBarChart"
import "../../assets/css/homestyle.css"

// const useStyles = makeStyles((theme) => ({
//   root: {
//     flexGrow: 1,
//   },
//   paper: {
//     padding: theme.spacing(0),
//     textAlign: 'center',
//     backgroundColor: '#143340',
//     color:'white',
//     fontSize:"16px",
//   },
// }));

export default class RankTLD extends Component {  
    // const classes = useStyles();
    render(){
        return(
            <Frame>
                <FrameTitle value="顶级域名分布"/>
                <div>
                    <Grid container spacing={0}>
                        <Grid item xs={3}>
                            <div className="rankpaper">
                                <p>排名</p>
                                <div style={{fontSize:'14px'}}>
                                {
                                    this.props.TLDs.map((value,key)=>{
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
                                <div >
                                    <div style={{float:"flex",justifyContent:"center",marginTop:"16px",marginBottom:"8px"}}>
                                        <span style={{position:"relative",right:"23%"}}>顶级域名</span>
                                        <span style={{position:"relative",left:"5%"}}>域名数</span>
                                    </div>
                                    {/* <p>顶级域名&emsp;&emsp;&emsp;域名数</p> */}
                                    <div id={"home1"} style={{height:"212.3px",width:"100%",marginBottom:"0px"}}>
                                        <HomeBarChart data={this.props.TLDs} barId={"home1"}/>
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