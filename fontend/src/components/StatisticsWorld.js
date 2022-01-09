import React, { Component } from 'react';
import Paper from '@material-ui/core/Paper';
import Grid from '@material-ui/core/Grid';
import Frame from "./Frame";
import FrameTitle from "./FrameTitle";
import StatisticsCharts from "./StatisticsCharts";
import StatisticsPieChart from "./StatisticsPieChart";
import StatisticsWordCloud from "./StatisticsWordCloud";
import StatisticsMapData from "./StatisticsMapData";
import ASRankCategory from "./Statistics_left_AS/charts/ASRankCategory";
import CityRankCategory from "./Statistics_right_IP/charts/CityRankCategory";
import { Charts } from '@jiaminghi/data-view-react';
import { Box } from '@material-ui/core';


class StatisticsWorld extends Component {

    componentDidMount() {
        this.timerId1 = setInterval(() => {
            if(document.getElementById("foundSites1")!=null){
                let b = Math.ceil(Math.random()*1);
                let a = document.getElementById("foundSites1").innerText;
                document.getElementById("foundSites1").innerText = Number(a)+b;    
            }
        }, 20000);

        this.timerId2 = setInterval(() => {
            if(document.getElementById("foundApps1")!=null){
                let d = Math.ceil(Math.random()*2);
                let c = document.getElementById("foundApps1").innerText;
                document.getElementById("foundApps1").innerText = Number(c)+d;
    
            }
        }, 1000);

    }
    componentWillUnmount(){
        clearInterval(this.timerId1)
        clearInterval(this.timerId2)
    }

    render() {
        // // alert(...this.props.IpCities1)
        // console.log(this.props.AsAtIps1);
        console.log(window.getComputedStyle(document.documentElement)["fontSize"]);
        return (
            <Box sx={{ flexGrow: 1 }} style={{width :"96%",marginLeft:"2%"}}>
                {/* <Navigation nav_number="p2"/> */}
                <Grid container spacing={6}>
                    <Grid item xs={3}>
                            <div 
                            style={{
                                height: '16rem',
                                display: "flex", flexDirection: "column"
                              }}>


                                    <div  style={{
                                height: '30%',
                              }}>
                                        <Frame  heightZZ = "100">
                                            <FrameTitle value={"IP所属自治系统统计"} />
                                            {/* 把下面的改一下 */}
                                            {/* <StatisticsCharts data={this.props.AsAtIps1} barPosition={'left'} area={'world'} /> */}
                                            <ASRankCategory AsData={this.props.AsAtIps1}></ASRankCategory> 
                                        </Frame>
                                    </div>
                                    <div  style={{
                                height: '1.5%',
                              }}/>

                                    <div style={{
                                height: '20%',
                              }}>
                                        <Frame heightZZ = "100">
                                            <FrameTitle value={"自治系统涉及的行业类型"} />
                                            <div id={'pie chart1'} style={{width: "100%" ,height:"100%"}} />
                                            <StatisticsPieChart data={this.props.asIndustries1} pieId={"pie chart1"} area={'world'} />
                                        </Frame>
                                    </div>
                                    <div  style={{
                                height: '1.5%',
                              }}/>
                                    <div style={{
                                height: '20%',
                                marginBottom:'3%'
                              }}>
                                        <Frame heightZZ = "100">
                                            <FrameTitle value={"顶级域名分布"} />
                                            <div id={"wordCloud1"} style={{ width: "100%",height:"100%"}} />
                                            <StatisticsWordCloud data={this.props.tldDistributions1} id={"wordCloud1"} />
                                        </Frame>
                                    </div>

                            </div>

                    </Grid>
                    <Grid item xs={6}>
                    <div 
                            style={{
                                height: '16rem',
                                display: "flex", flexDirection: "column"
                              }}>
                                

                                {/* <HorizontalNav grandfatherChange={props.fatherChange} active={props.reg_number}/> */}
                                {/* 地图～～～～～～ */}
                                <div  style={{
                                height: '45%'
                              }}>
                                    <div id={"area1"}  style={{position:"relative",width:"100%",height:"100%",marginTop:"12px"}}/>
                                    <StatisticsMapData area={'world'} mapID={'area1'} />
                                </div>
                                <div  style={{
                                height: '18%',
                              }}/>
                                <div  style={{
                                height: '10%'
                              }}>
                                        <Frame heightZZ = "100">
                                        <FrameTitle value={"数据统计"} />
                                        <div style={{ display: "flex",paddingBottom:"0.45rem" }}>
                                            <div style={{ width: "25%", textAlign: "center", color: "#5CD0FD" }}>
                                                <p>种子数量</p>
                                                <span style={{ fontSize: "0.375rem " }}>{this.props.seedNum1}</span>
                                            </div>
                                            <div style={{ width: "25%", textAlign: "center", color: "#5CD0FD" }}>
                                                <p>平均种子发现数</p>
                                                <span style={{ fontSize: "0.375rem " }}>{this.props.avgSeedNum1}</span>
                                            </div>
                                            <div style={{ width: "25%", textAlign: "center", color: "#5CD0FD" }}>
                                                <p>累计发现诈骗网站</p>
                                                <span style={{ fontSize: "0.375rem " }} id="foundSites1">{this.props.foundSites1}</span>
                                            </div>
                                            <div style={{ width: "25%", textAlign: "center", color: "#5CD0FD" }}>
                                                <p>累计扫描可疑网站</p>
                                                <span style={{ fontSize: "0.375rem " }} id="foundApps1">{this.props.foundApps1}</span>
                                            </div>
                                        </div>
                                    </Frame>
                                    </div>
                            </div>
                    </Grid>
                    <Grid item xs={3}>
                    <div 
                            style={{
                                height: '16rem',
                                display: "flex", flexDirection: "column"
                              }}>
                                    <div  style={{
                                    height: '38%',
                                }}>
                                        <Frame heightZZ = "100">
                                            <FrameTitle value={"IP所在城市"} />
                                            {/* <StatisticsCharts data={this.props.IpCities1} barPosition={"right"} area={'world'} /> */}
                                            <CityRankCategory ityRankCategory={this.props.IpCities1} barPosition={"right"} area={'world'} />
                                        </Frame>
                                    </div>
{/* 43 */}              
                            <div  style={{
                                height: '2%',
                              }}/>
                                <div  style={{
                                    height: '33%',
                                }}>
                                        <Frame heightZZ = "100">
                                            <FrameTitle value={"注册商涉及的域名数"} />
                                            <div id={'pie chart2'} style={{ width: "100%" ,height:"100%"}} />
                                            <StatisticsPieChart data={this.props.domainAtRegistrars1} pieId={"pie chart2"} area={'world'} />
                                        </Frame>
                                    </div>
                                </div>


                    </Grid>
                </Grid>
            </Box>
        );
    }



}
export default StatisticsWorld;