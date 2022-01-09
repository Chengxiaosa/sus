import React, { Component } from 'react';
import Grid from '@material-ui/core/Grid';
import Button from '@material-ui/core/Button';
import Navigation from "./Navigation";
import Map from "../map";
import Frame from "./Frame";
import FrameTitle from "./FrameTitle";
import DailyFindingPieChart from "./DailyFindingPieChart";
import StatisticsMapData from "./StatisticsMapData";
import search from "../imgs/search_pro.png"
import yes from "../imgs/yes.png"
import no from "../imgs/no.png"
import arrow from "../imgs/arrow.png"
import Findingmap from "./findingmap"
import "../assets/css/finding.css"
import "../assets/css/loading.css"
import FindData from './FindData';
import StatisticsPieChart from "./StatisticsPieChart";
import axios from "../Utils/axios"
import PredData from './PredData';
import { Box } from '@material-ui/core';
import { Loading } from '@jiaminghi/data-view-react';
import {ResultCategory,ResultCategory2}  from './finding/Result';
var pjson = require('../../package.json')
var pjsonUrl = pjson.config.url
var staticUrl = pjson.config.staticUrl

React.axios = axios

export default class DailyFindingChild extends Component {


    saveScreenshot=(screenshot)=>{
        this.setState({
            screenshot:screenshot
        })
    }

    saveBadScreenshot1=(bad_screenshot1)=>{
        this.setState({
            bad_screenshot1:bad_screenshot1
        })
    }

    saveBadScreenshot2=(bad_screenshot2)=>{
        this.setState({
            bad_screenshot2:bad_screenshot2
        })
    }

    saveDomains_from_boom=(domains_from_boom)=>{
        this.setState({
            domains_from_boom:domains_from_boom
        })
    }
    saveDomains_from_dns=(domains_from_dns)=>{
        this.setState({
            domains_from_dns:domains_from_dns
        })
    }
    saveDomains_from_cert=(domains_from_cert)=>{
        this.setState({
            domains_from_cert:domains_from_cert
        })
    }
    saveDomains_from_subnet=(domains_from_subnet)=>{
        this.setState({
            domains_from_subnet:domains_from_subnet
        })
    }

    saveGood_domains=(good_domains)=>{
        this.setState({
            good_domains:good_domains
        })
    }
    saveBad_domains=(bad_domains)=>{
        this.setState({
            bad_domains:bad_domains
        })
    }
    saveUncertain_domains=(uncertain_domains)=>{
        this.setState({
            uncertain_domains:uncertain_domains
        })
    }
    saveFlag=(num)=>{
        this.setState({
            flagLoading:num
        })
    }
    saveFlag1=(num)=>{
        this.setState({
            flagLoading1:num
        })
    }
    saveFlag2=(num)=>{
        this.setState({
            flagLoading2:num
        })
    }
    saveFlag3=(num)=>{
        this.setState({
            flagLoading3:num
        })
    }
    saveFlag4=(num)=>{
        this.setState({
            flagLoading4:num
        })
    }
    saveInfo=(info)=>{
        this.setState({
            info:info
        })
    }
    saveResultData=(possibleResult,port80Result,flag)=>{
        let possible = this.state.possible
        possible[flag-1] = possibleResult
        let port80 = this.state.port80
        port80[flag-1] = port80Result
        this.setState({
            possible:possible,
            port80:port80
        })
    }
    actCrawler = (domain)  =>{
        axios.get(pjsonUrl+'/activityCrawler?url='+domain).then(
            response => {
                console.log("动态爬取完成")
                this.judege(domain)
            }       
        )     

    }

    judege = (domain) =>{
        axios.get(pjsonUrl+'/judge?url='+domain).then(
            response => {
                this.saveGood_domains(response.data.good_domains)
                this.saveBad_domains(response.data.bad_domains)
                this.saveUncertain_domains(response.data.uncertain_domains)
                let bad_domains_to_pick = Object.keys(this.state.bad_domains);
                let n1 = Math.floor(Math.random() * bad_domains_to_pick.length + 1)-1;
                this.saveBadScreenshot1(staticUrl+"/backend/resources/crawler/crawler_result/"+bad_domains_to_pick[n1]+"/screenshot.png");
                if(bad_domains_to_pick.length>1){
                    let n2 = Math.floor(Math.random() * bad_domains_to_pick.length + 1)-1;
                    while(n2==n1){
                        n2 = Math.floor(Math.random() * bad_domains_to_pick.length + 1)-1;
                    }
                    this.saveBadScreenshot2(staticUrl+"/backend/resources/crawler/crawler_result/"+bad_domains_to_pick[n2]+"/screenshot.png");
                }

                let cons_info = []
                let good_domains_to_pick = Object.keys(this.state.good_domains);
                cons_info.push({"type":"高危诈骗网站", "number":bad_domains_to_pick.length})
                cons_info.push({"type":"低风险网站", "number":good_domains_to_pick.length})
                this.saveInfo(cons_info)
            }
        )

    }
    handleChange = event => {
        this.setState({ url: event.target.value });
    }
    //提交功能
    //查找功能的脚本 
    search_new_finding_data = (e)=>{
        // 此处传入的E是什么？

        this.setState({
            flagLoading: "1",
            flagLoading1: "1",
            flagLoading2: "1",
            flagLoading3: "1",
            flagLoading4: "1",
        });
        e.preventDefault();
        console.log("!!!in");
        let input_url = this.state.url;
        if(input_url===""){
            input_url="hjc965.com";
        }
        // this.saveScreenshot("")

        // this.saveDomains_from_boom("")
        // this.saveDomains_from_cert("")
        // this.saveDomains_from_dns("")
        // this.saveDomains_from_subnet("")
        // alert(pjsonUrl+'findSitesByUrl?url='+input_url)
        // axios.get(pjsonUrl+'/findSitesByUrl?url='+input_url).then(
        //     response => {
        //         if(response.data.screenshot==='none'){
        //             alert("该网站不存在,请重新输入！");
        //             return;
        //         }
        //         // 此处是用来存放四个格子的借口
        //         // 这里为什么有这么多层嵌套？
        //         // 这里方法是接通的， 但是为什么响应这么慢？
        //         let this_domains_from_boom = response.data.domains_from_boom.concat(this.state.domains_from_boom);
        //         let this_domains_from_cert = response.data.domains_from_cert.concat(this.state.domains_from_cert);
        //         let this_domains_from_dns = response.data.domains_from_dns.concat(this.state.domains_from_dns);
        //         let this_domains_from_subnet = response.data.domains_from_subnet.concat(this.state.domains_from_subnet);


        //         this.saveDomains_from_boom(this_domains_from_boom)
        //         this.saveDomains_from_cert(this_domains_from_cert)
        //         this.saveDomains_from_dns(this_domains_from_dns)
        //         this.saveDomains_from_subnet(this_domains_from_subnet)
        //         // 打印的是http://10.177.35.156:80/backend/resources/crawler/crawler_result/hjc965.com/screenshot.png
        //         // 修改成80端口
        //         this.saveScreenshot(response.data.screenshot)
        //         console.log(response.data)
        //         my_body.style = "";
        //         my_body2.style = "";
        //         // 这里是旋转等待按钮
        //         loading_block.style.display = "none";        

        //         // axios.get(pjsonUrl+'/crawler?url='+input_url).then(
        //         //     response => {
        //         //         axios.get(pjsonUrl+'/judge?url='+input_url).then(
        //         //             response => {
        //         //                 this.saveGood_domains(response.data.good_domains)
        //         //                 this.saveBad_domains(response.data.bad_domains)
        //         //                 this.saveUncertain_domains(response.data.uncertain_domains)
        //         //                 let bad_domains_to_pick = Object.keys(this.state.bad_domains);
        //         //                 let n1 = Math.floor(Math.random() * bad_domains_to_pick.length + 1)-1;
        //         //                 this.saveBadScreenshot1(staticUrl+"/backend/resources/crawler/crawler_result/"+bad_domains_to_pick[n1]+"/screenshot.png");
        //         //                 if(bad_domains_to_pick.length>1){
        //         //                     let n2 = Math.floor(Math.random() * bad_domains_to_pick.length + 1)-1;
        //         //                     while(n2==n1){
        //         //                         n2 = Math.floor(Math.random() * bad_domains_to_pick.length + 1)-1;
        //         //                     }
        //         //                     this.saveBadScreenshot2(staticUrl+"/backend/resources/crawler/crawler_result/"+bad_domains_to_pick[n2]+"/screenshot.png");
        //         //                 }

        //         //                 let cons_info = []
        //         //                 let good_domains_to_pick = Object.keys(this.state.good_domains);
        //         //                 cons_info.push({"type":"高危诈骗网站", "number":bad_domains_to_pick.length})
        //         //                 cons_info.push({"type":"低风险网站", "number":good_domains_to_pick.length})
        //         //                 this.saveInfo(cons_info)
        //         //                 // 这里是幕布
        //         //                 // my_body.style = "";
        //         //                 my_body2.style = "";
        //         //                 // 这里是旋转等待按钮
        //         //                 loading_block.style.display = "none";

        //         //             }
        //         //         )
        //         //     }
        //         // )
        //     }
        // )
        // let my_body1 = document.getElementsByClassName("top_box")[0];
        // my_body1.style = "filter:blur(0.0544rem);";
        // let my_body2 = document.getElementById("my_body");
        // my_body2.style = "filter:blur(0.0544rem);";
        // let loading_block1 = document.getElementById("ajaxloader3");
        // loading_block1.style.display = "block";         
        axios.get(pjsonUrl+'/findSitesCrawler?url='+input_url).then(
            response => {
                if(response.data.screenshot==='none'){
                    alert("该网站不存在,请重新输入！");
                    return;
                }

                var a = 0
                console.log(response.data.screenshot)
                this.saveScreenshot(response.data.screenshot)
                this.saveFlag ("0")
                // let this_domains_from_boom = response.data.domains_from_boom.concat(this.state.domains_from_boom);
                // let this_domains_from_cert = response.data.domains_from_cert.concat(this.state.domains_from_cert);
                // let this_domains_from_dns = response.data.domains_from_dns.concat(this.state.domains_from_dns);
                // let this_domains_from_subnet = response.data.domains_from_subnet.concat(this.state.domains_from_subnet);

                axios.get(pjsonUrl+'/findSitesByUrlFromDns?url='+input_url).then(
                    response => {

                        this.saveDomains_from_dns(response.data.domains_from_dns)
                        this.saveFlag1("0")
                        this.saveResultData(response.data.totalNum,response.data.reaultNum,1)
                        console.log(this.state.possible)
                        console.log(this.state.port80)
                        a = a +1
                        if(a == 4){
                            this.actCrawler(input_url)
                        }
                    }
                )
                axios.get(pjsonUrl+'/findSitesByUrlFromCert?url='+input_url).then(
                    response => {
                        this.saveDomains_from_cert(response.data.domains_from_cert)
                        this.saveFlag2("0")
                        this.saveResultData(response.data.totalNum,response.data.reaultNum,2)
                        console.log(this.state.possible)
                        console.log(this.state.port80)
                        a = a +1
                        if(a == 4){
                            this.actCrawler(input_url)
                        }
                    }
                )
                axios.get(pjsonUrl+'/findSitesByUrlFromSubnet?url='+input_url).then(
                    response => {
                        this.saveDomains_from_subnet(response.data.domains_from_subnet)
                        this.saveFlag3("0")
                        this.saveResultData(response.data.totalNum,response.data.reaultNum,3)
                        console.log(this.state.possible)
                        console.log(this.state.port80)
                        a = a +1
                        if(a == 4){
                            this.actCrawler(input_url)
                        }
                    }
                )
                axios.get(pjsonUrl+'/findSitesByUrlFromBoom?url='+input_url).then(
                    response => {

                        this.saveDomains_from_boom(response.data.domains_from_boom)
                        this.saveFlag4("0")
                        this.saveResultData(response.data.totalNum,response.data.reaultNum,4)
                        console.log(this.state.possible)
                        console.log(this.state.port80)
                        a = a +1
                        if(a == 4){
                            this.actCrawler(input_url)
                        }

                    }
                )

            }
        )        
    }

    constructor(props) {
        super(props);
        this.state = {
            flagLoading:"0",
            flagLoading1:"0",
            flagLoading2:"0",
            flagLoading3:"0",
            flagLoading4:"0",
            findingmapData: this.props.findingmapData,
            display1: "block",
            display2: "none",
            arrow_dis1: "none",
            arrow_dis2: "none",
            arrow_dis3: "none",
            arrow_dis4: "none",
            opacity1: 0,
            opacity2: 0,
            opacity3: 0,
            opacity4: 0,
            opacity5: 0,
            // find按钮的button传入的url
            // 这个方法是有返回的
            // 是固定的只能查看这一个URL么？
            // get这个请求后是可以得到后台JSON的， 前台要怎么收到
            url: "hjc965.com",
            screenshot: "",

            bandwidth: this.props.findServer.bandwidth,
            txrate: this.props.findServer.tx,
            rxrate: this.props.findServer.rx,
            request: this.props.findServer.request,
            cpuprop: this.props.cpu.cpuProp,
            memory: this.props.memory.memProp,
            diskprop: this.props.disk.diskProp,
            live: this.props.cpuStatus.live,
            memuse: this.props.memStatus.use,
            diskspeed: this.props.disk.diskSpeed,
            // 这个列表是足迹发现中域名生成模块 全部晴空
            // 域名生成
            // 逗号分割
            domains_from_boom:[
              ],
              //证书共同主体
            domains_from_cert:[],
            // dns记录
            domains_from_dns:[],
            // 共有子网
            // 输入一个会显示三行
            domains_from_subnet:[],
            good_domains:[],
            bad_domains:[],
            uncertain_domains:[],
            
            bad_screenshot1: "",
            bad_screenshot2: "",

            info:[],
            possible:[1,2,3,4],
            port80:[1,2,3,4]
        }
    }

    count = () => {
        let band = Math.floor(Math.random() * 50) + 50;
        let txr = Math.random() * 4 + 1;
        let rxr = Math.random() * 25 + 15;
        let req = Math.floor(Math.random() * 1000) + 1000;
        let cp = Math.random() * 0.2 + 0.5;
        let me = Math.random() * 0.1 + 0.6;
        let diskpr = Math.random() * 0.2 + 0.5;
        let li = Math.floor(Math.random() * 2.5) + 2;
        let memu = Math.random() * 12.8 + 76.8;
        let disksp = Math.random() * 4 + 1;

        this.setState({
            bandwidth: band,
            txrate: txr,
            rxrate: rxr,
            request: req,
            cpuprop: cp,
            memory: me,
            diskprop: diskpr,
            live: li,
            memuse: memu,
            diskspeed: disksp,
        });
    }

    render() {
        
        return (
            //加载页面时文字等待
            (this.state.findingmapData === '')
                ? <div style={{ color: "#ECE8EF" }}><h2>loading...</h2></div>
                :
                <Box sx={{ flexGrow: 1 }} style={{width :"96%",marginLeft:"2%"}}>
                    <Grid container spacing={6} id="my_body">
                        {/* <Navigation nav_number="p3" /> */}
                        <Grid item xs={4}>
                        <div 
                            style={{
                                height: '16rem',
                                display: "flex", flexDirection: "column"
                              }}>
                                    <div  style={{
                                height: '10%',
                              }}>
                                    <Frame heightZZ = "100">
                                    <FrameTitle value={"放入种子"} />
                                        {/* 实现查找功能的脚本 */}
                                        <form style={{height:"100%"}} onSubmit={this.search_new_finding_data} >
                                            < div className="seed3" style={{textAlign:"center"}}>
                                                <div className="seed1">域名</div>
                                                {/* 这里有个url输入没展开到页面中 */}
                                                <input className='seed2' type="text" name="url" placeholder="hjc965.com"  onChange={this.handleChange}/>
                                            </div>
                                            {/* <div className="seed3">
                                                <div className="seed1">IP</div>
                                                <div className="seed2">112.121.175.38</div>
                                            </div> */}
                                            
                                            <div className="se" style={{textAlign:"center",overflow:"hidden"}} >
                                                <button type='submit' style={{backgroundColor:"#2274A5",height:"100%",width:"30%",color: "white"}}>点击放入种子</button>
                                            </div>
                                        </form>
                                    </Frame>
                                    </div>
                                    
                                    <div  style={{
                                height: '1.5%',
                              }}/>

                              
                                <div style={{textAlign:"center",height: '61.5%',}}>
                                <Frame heightZZ = "100">
           
                                        <FrameTitle value={"种子网站截图"}/>
                                        {(this.state.flagLoading === "1")?
                                        <Loading  /> :
                                            <img src={this.state.screenshot} style={{height: "90%", marginTop :"2%"}}/>
                                        }
                                </Frame>
                                    </div>
                                </div>
                        </Grid>




                        <Grid item xs={4} >
                        <div 
                            style={{
                                height: '16rem',
                                display: "flex", flexDirection: "column"
                              }}>
                          <div  style={{
                                height: '30%',
                              }}>
                        
                        <FindData props={this.state}/>
                        </div>
                        
                        <div  style={{
                                height: '1.5%',
                              }}/>
                        
                        <div  style={{
                                height: '41.5%',
                              }}>
                        <PredData props={this.state}/>
                        </div>
                        </div>
                        </Grid>

                        <Grid item xs={4} >
                        <div 
                            style={{
                                height: '16rem',
                                display: "flex", flexDirection: "column"
                              }}>
                            <div style={{textAlign:"center"}} style={{height:"30%"}}>
                                <Frame heightZZ = "100">
                                <FrameTitle value={"结果分析"}/> 
                                {/* <div id={'pie chart5'}  style={{height:"80%"}}/>
                                <StatisticsPieChart data={this.state.info} pieId={"pie chart5"}/> */}
                                <ResultCategory possible={this.state.possible} port80 = {this.state.port80}/>
                                </Frame>
                                </div>

                                <div  style={{
                                height: '1.5%',
                              }}/>


                                <div style={{textAlign:"center"}} style={{height:"41.5%"}}>
                                <Frame heightZZ = "100">
                                <FrameTitle value={"结果分析"}/> 
                                {/* <div id={'pie chart5'}  style={{height:"80%"}}/>
                                <StatisticsPieChart data={this.state.info} pieId={"pie chart5"}/> */}
                                <ResultCategory2 possible={this.state.possible} port80 = {this.state.port80}/>
                                </Frame>
                                </div>
             
                            
                            {/* <Grid container>
                                <Grid item xs={5} style={{marginLeft: "3%" }}>
                                    <div style={{textAlign:"center"}}>
                                        <div id="frame" style={{minHeight:"5.5488rem"}}>
                                        <FrameTitle value={"识别结果截图"}/>
                                        <img src={this.state.bad_screenshot1} style={{maxWidth: "2.04rem", marginTop: "0.272rem"}}/>
                                            
                                        </div>
                                    </div>
                                </Grid>
                                <Grid item xs={5} style={{marginLeft: "10%" }}>
                                    <div style={{textAlign:"center"}}>
                                        <div id="frame" style={{minHeight:"5.5488rem"}}>
                                        <FrameTitle value={"识别结果截图"}/>
                                        <img src={this.state.bad_screenshot2} style={{maxWidth: "2.04rem", marginTop: "0.272rem"}}/>
                                        </div>
                                    </div>
                                </Grid>
                            </Grid> */}
                        </div>
                        </Grid>
                    </Grid>
                    </Box>
        );
    }
}
