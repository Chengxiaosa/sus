import React, { Component } from 'react';
import Navigation from "../Navigation";
import DataStatistics from "./datastatistics"
// import RankTLD from "./rankTLD"
import RankAS from "./rankAS"
import RankIP from "./rankIP"
import Server from "./server"
import DailyData from "./dailydata";
import PayChannel from "./paychannel";
import Bank from "./bank";
import { makeStyles } from '@material-ui/core/styles';
import Paper from '@material-ui/core/Paper';
import Grid from '@material-ui/core/Grid';
import StatisticsMapData from "../StatisticsMapData";
import SystemIntro from './systemIntro';
import axios from "../../Utils/axios";
import { Box } from '@material-ui/core';
var pjson = require('../../../package.json')
var pjsonUrl = pjson.config.url


// const useStyles = makeStyles((theme) => ({
//   root: {
//     flexGrow: 1,
//   },
//   paper: {
//     textAlign: 'center',
//     backgroundColor: '#143340',
    
//   },
// }));

class HomeBody extends Component {
//   const classes = useStyles();

    render(){
        console.log("多次执行HomeBody")
        return (
            (this.props.AppNum === 0 || this.props.SiteNum === 0 || this.props.Servers.bandwidth === 0 || this.props.Servers.diskRate === 0 || this.props.Servers.request === 0)?
              <div style={{color:"#ECE8EF"}}><h2>loading...</h2></div>:
            
                <div id = "second" >
                    
                    <Box sx={{ flexGrow: 1 }} style={{width :"96%",marginLeft:"2%"}}>
                    <div 
                            style={{
                                height: '16rem',
                                display: "flex", flexDirection: "column"
                              }}>
                            <div style = {{height:"54%"}}>
                            <Grid container spacing={0}  style = {{height:"100%"}}>
                                <Grid item xs={3} style = {{height:"100%"}}>
                                    
                                        <SystemIntro/>
                                    
                                </Grid>
                                <Grid item xs={9} >
                                        <div style = {{height:"100%"}}>
                                        <div id={"area3"} style={{height:"100%"}} > 
                                            <StatisticsMapData area={'world'} mapID={'area3'}/>
                                        </div>
                                            
                                    </div>
                                </Grid>
                                </Grid>
                            </div>
                            <div style = {{height:'1.5%'}}/>
                            <div style = {{display:"flex",height:'17.5%',width:'100%'}}>
                                <div style = {{height:"100%",width:'30%'}}>

                                        <DataStatistics AppNum={this.props.AppNum} SiteNum={this.props.SiteNum} 
                                            dailySiteNum={this.props.dailySiteNum} dailyAppNum={this.props.dailyAppNum}/>

                                </div>
                                <div style = {{height:"100%",width:'5%'}}/>
                                <div style = {{height:"100%",width:'30%'}}>

                                        <DailyData dailyDatas={this.props.dailyDatas}/>

                                </div>
                                <div style = {{height:"100%",width:'5%'}}/>
                                <div style = {{height:"100%",width:'30%'}}>

                                        <Server Servers={this.props.Servers}/>

                                </div>
                                </div>
                        </div>

                    </Box>
                </div>


        );
    }
}

export default HomeBody