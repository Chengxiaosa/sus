import React from 'react';
import { makeStyles, createStyles, Theme } from '@material-ui/core/styles';
import Paper from '@material-ui/core/Paper';
import Grid from '@material-ui/core/Grid';
import Frame from "./Frame";
import Navigation from "./Navigation";
import FrameTitle from "./FrameTitle";
import HorizontalNav from "./HorizontalNav";
import StatisticsCharts from "./StatisticsCharts";
import StatisticsPieChart from "./StatisticsPieChart";
import StatisticsWordCloud from "./StatisticsWordCloud";
import StatisticsMapData from "./StatisticsMapData";

const useStyles = makeStyles((theme: Theme) =>
    createStyles({
        root: {
            flexGrow: 1,

        },
        paper: {
            backgroundColor: '#143340',
            padding: theme.spacing(1),
            textAlign: 'center',
        },
    }),
);


export default function StatisticsChina(props) {
    const classes = useStyles();
    return (
        <div className={classes.root}>
            <Navigation nav_number="p2"/>
            <Grid container spacing={2}>
                <Grid item xs={4}>
                    <div style={{position:"relative",left:"15%",width:"85%"}}>
                    <Paper className={classes.paper} elevation={0}>
                        <div style={{display:"flex",flexDirection:"column"}}>
                            <div style={{marginBottom:"35px"}}>
                                <Frame>
                                    <FrameTitle value={"IP所属自治系统统计"}/>
                                    <StatisticsCharts data={props.AsAtIps2} barPosition={'left'} area={'china'}/>
                                </Frame>
                            </div>

                            <div style={{marginBottom:"35px"}}>
                                <Frame>
                                    <FrameTitle value={"自治系统涉及的行业类型"}/>
                                    <div id={'pie chart3'} style={{height:"187.5px",width:"100%"}}/>
                                    <StatisticsPieChart data={props.asIndustries2} pieId={"pie chart3"} area={'china'}/>
                                </Frame>
                            </div>

                            <div>
                                <Frame>
                                    <FrameTitle value={"顶级域名分布"}/>
                                    <div id={"wordCloud2"} style={{width:"100%",height:"125px"}}/>
                                    <StatisticsWordCloud data={props.tldDistributions2} id={"wordCloud2"}/>
                                </Frame>
                            </div>
                        </div>

                    </Paper>
                    </div>
                </Grid>
                <Grid item xs={5}>
                    <Paper className={classes.paper} elevation={0}>
                        <div style={{display:"flex",flexDirection:"column",justifyContent:"space-between"}}>
                            {/* <HorizontalNav grandfatherChange={props.fatherChange} active={props.reg_number}/> */}
                            <div style={{marginBottom:"130px"}}>
                                <div id={"area2"} style={{width:"100%",height:"500px"}}/>
                                <StatisticsMapData area={'china'} mapID={'area2'}/>
                            </div>

                            <div>
                                <Frame>
                                    <FrameTitle value={"数据统计"}/>
                                    <div style={{display:"flex"}}>
                                        <div style={{width:"25%",textAlign:"center",color:"#8ef0f8"}}>
                                            <p>种子数量</p>
                                            <p style={{fontSize:"30px"}}>{props.seedNum2}</p>
                                        </div>
                                        <div style={{width:"25%",textAlign:"center",color:"#8ef0f8"}}>
                                            <p>平均种子发现数</p>
                                            <p style={{fontSize:"30px"}}>{props.avgSeedNum2}</p>
                                        </div>
                                        <div style={{width:"25%",textAlign:"center",color:"#8ef0f8"}}>
                                            <p>累计识别诈骗网站</p>
                                            <p style={{fontSize:"30px"}}>{props.foundSites2}</p>
                                        </div>
                                        <div style={{width:"25%",textAlign:"center",color:"#8ef0f8"}}>
                                            <p>累计别诈骗应用</p>
                                            <p style={{fontSize:"30px"}}>{props.foundApps2}</p>
                                        </div>

                                    </div>
                                </Frame>
                            </div>
                        </div>
                    </Paper>
                </Grid>
                <Grid item xs={3}>
                    <Paper className={classes.paper} elevation={0}>
                        <div style={{display:"flex",flexDirection:"column",marginRight:"15px"}}>
                            <div style={{marginBottom:"40px"}}>
                                <Frame>
                                    <FrameTitle value={"IP所在城市"}/>
                                    <StatisticsCharts data={props.IpCities2} barPosition={"right"} area={'china'}/>
                                </Frame>
                            </div>

                            <div >
                                <Frame>
                                    <FrameTitle value={"注册商涉及的域名数"}/>
                                    <div id={'pie chart4'} style={{height:"375px",width:"100%"}}/>
                                    <StatisticsPieChart data={props.domainAtRegistrars2} pieId={"pie chart4"} area={'china'}/>
                                </Frame>
                            </div>

                        </div>
                    </Paper>
                </Grid>
            </Grid>
        </div>
    );
}
