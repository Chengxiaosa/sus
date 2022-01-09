import React, { Component } from 'react';
import Grid from '@material-ui/core/Grid';
import Frame from "./Frame";
import FrameTitle from "./FrameTitle";
import StatisticsCharts from "./StatisticsCharts";
import StatisticsMapData from "./StatisticsMapData";
import axios from "../Utils/axios"
import Moment from './Moment';
import { Box } from '@material-ui/core';
var pjson = require('../../package.json')
var pjsonUrl = pjson.config.url

class ClusterInfo extends Component {
    saveOh_my_domains = (oh_my_domains)=>{
        this.setState({oh_my_domains:oh_my_domains})
    }
    saveDns_ip_cluster = (dns_ip_cluster)=>{
        let newData = [];
        let tmp = [];
        let count = 0;
        for(let i in dns_ip_cluster){
            tmp.push(dns_ip_cluster[i]);
            count = count + 1;
            if(count>=3){
                newData.push(tmp);
                tmp = [];
                count = 0;
            }
        }
        console.log(newData);
        this.setState({dns_ip_cluster:newData})
    }
    saveSite_main_info = (site_main_info)=>{
        this.setState({site_main_info:site_main_info})
    }
    saveIp_cluster = (ip_cluster)=>{
        this.setState({ip_cluster:ip_cluster})
    }
    saveSeed_domain_type = (seed_domain_type)=>{
        this.setState({seed_domain_type:seed_domain_type})
    }
    saveCluster_main_screenshot = (cluster_main_screenshot)=>{
        this.setState({cluster_main_screenshot:cluster_main_screenshot})
    }
    saveArea = (area)=>{
        this.setState({area:area})
    }
    constructor (props) {    
        super(props);

        this.my_time_1=["2021-04-30", "2021-05-01", "2021-05-03", "2021-05-06",
        "2021-05-09", "2021-05-10", "2021-05-11", "2021-05-12",
        "2021-05-15", "2021-05-18", "2021-05-20", "2021-05-21",
        "2021-05-22", "2021-05-22", "2021-05-23", "2021-05-25",
        "2021-05-26", "2021-05-27", "2021-05-27", "2021-05-28",
        "2021-05-30", "2021-05-30", "2021-06-02", "2021-06-05",
        "2021-06-10", "2021-06-12", "2021-06-13", "2021-06-15",
        "2021-06-16", "2021-06-18", "2021-06-20", "2021-06-21",
        "2021-06-23", "2021-06-25", "2021-06-28", "2021-07-02",
        "2021-07-06", "2021-07-10", "2021-07-12", "2021-07-15",
        "2021-07-16", "2021-07-18", "2021-07-19", "2021-07-20"];
        this.my_action_1=["定位可疑集群", "新增域名", "新增域名", "域名失效",
        "新增域名", "发现注册行为", "新增域名", "新增域名",
        "新增域名", "新增域名", "发现注册行为", "新增域名",
        "新增域名", "网站状态异常", "新增域名", "新增域名",
        "新增域名", "新增域名", "域名失效", "新增域名",
        "新增域名", "发现注册行为", "网站状态异常", "新增域名",
        "域名失效", "新增域名", "新增域名", "新增域名",
        "新增域名", "新增域名", "发现注册行为", "新增域名",
        "新增域名", "新增域名", "新增域名", "新增域名",
        "新增域名", "网站状态异常", "新增域名", "新增域名",
        "发现注册行为", "网站状态异常", "域名失效", "新增域名"];
    
        this.my_time_2=["2021-05-30", "2021-06-01", "2021-06-03", "2021-06-06",
        "2021-06-09", "2021-06-10", "2021-06-11", "2021-06-12",
        "2021-06-15", "2021-06-18", "2021-06-20", "2021-06-21",
        "2021-06-22", "2021-06-22", "2021-06-23", "2021-06-25",
        "2021-06-26", "2021-06-27", "2021-06-27", "2021-06-28",
        "2021-06-30", "2021-06-30", "2021-07-02", "2021-07-05",
        "2021-07-10", "2021-07-12", "2021-07-13", "2021-07-15",
        "2021-07-16", "2021-07-18", "2021-07-20", "2021-07-21",
        "2021-07-23", "2021-07-25", "2021-07-28", "2021-07-28",
        "2021-07-28", "2021-07-28", "2021-07-29", "2021-07-30"];
        this.my_action_2=["定位可疑集群", "新增域名", "新增域名", "域名失效",
        "新增域名", "发现注册行为", "新增域名", "新增域名",
        "发现注册行为", "新增域名", "新增域名", "新增域名",
        "域名失效", "网站状态异常", "新增域名", "新增域名",
        "新增域名", "新增域名", "新增域名", "新增域名",
        "新增域名", "发现注册行为", "域名失效", "新增域名",
        "域名失效", "新增域名", "新增域名", "新增域名",
        "网站状态异常", "新增域名", "发现注册行为", "新增域名",
        "新增域名", "新增域名", "新增域名", "新增域名",
        "发现注册行为", "网站状态异常", "新增域名", "新增域名"];
    
        this.my_time_3=["2021-03-30", "2021-04-01", "2021-04-03", "2021-04-06",
        "2021-04-09", "2021-04-10", "2021-04-11", "2021-04-12",
        "2021-04-15", "2021-04-18", "2021-04-20", "2021-04-21",
        "2021-04-22", "2021-04-22", "2021-04-23", "2021-04-25",
        "2021-04-26", "2021-04-27", "2021-04-27", "2021-04-28",
        "2021-04-30", "2021-04-30", "2021-05-02", "2021-05-05",
        "2021-05-10", "2021-05-12", "2021-05-13", "2021-05-15",
        "2021-05-16", "2021-05-18", "2021-05-20", "2021-05-21",
        "2021-05-23", "2021-05-25", "2021-05-28", "2021-06-02",
        "2021-06-06", "2021-06-10", "2021-06-12", "2021-06-15"];
        this.my_action_3=["定位可疑集群", "新增域名", "新增域名", "域名失效",
        "新增域名", "发现注册行为", "新增域名", "新增域名",
        "新增域名", "新增域名", "发现注册行为", "新增域名",
        "新增域名", "网站状态异常", "新增域名", "新增域名",
        "新增域名", "新增域名", "域名失效", "新增域名",
        "新增域名", "发现注册行为", "网站状态异常", "新增域名",
        "域名失效", "新增域名", "新增域名", "新增域名",
        "新增域名", "新增域名", "发现注册行为", "新增域名",
        "新增域名", "网站状态异常", "新增域名", "新增域名",
        "发现注册行为", "网站状态异常", "域名失效", "新增域名"];
    

        this.state = {
            clusterValue:1,

            oh_my_domains:[],
            dns_ip_cluster:[],
            site_main_info:"",
            ip_cluster:"",
            seed_domain_type:0,
            cluster_main_screenshot:"",
            
            my_time:this.my_time_1,
            my_action:this.my_action_1,

            area: "area5"
        }
    }
    handleChange = event => {
        this.setState({ clusterValue: event.target.value });
    }

    componentDidMount(){
        axios.get(pjsonUrl+'/findClusterByid?clusterId=1').then(
            response => {
                this.saveOh_my_domains(response.data.oh_my_domains)
                this.saveDns_ip_cluster(response.data.dns_ip_cluster)
                this.saveSite_main_info(response.data.site_main_info)
                this.saveIp_cluster(response.data.ip_cluster)
                this.saveSeed_domain_type(response.data.domain_type)
                this.saveCluster_main_screenshot(response.data.cluster_main_screenshot)
                this.saveArea("area5")


            },
        )
    }

    search_new_finding_data = (e)=>{
        e.preventDefault();
        let clusterValue = this.state.clusterValue
        axios.get(pjsonUrl+'/findClusterByid?clusterId='+clusterValue).then(
            response => {
                console.log(clusterValue)
                this.saveOh_my_domains(response.data.oh_my_domains)
                this.saveDns_ip_cluster(response.data.dns_ip_cluster)
                this.saveSite_main_info(response.data.site_main_info)
                this.saveIp_cluster(response.data.ip_cluster)
                this.saveSeed_domain_type(response.data.domain_type)
                this.saveCluster_main_screenshot(response.data.cluster_main_screenshot)
                if(clusterValue==="1"){
                    this.setState({my_action:this.my_action_1})
                    this.setState({my_time:this.my_time_1})
                    this.saveArea("area5")


                }
                else if(clusterValue==="2"){
                    this.setState({my_action:this.my_action_2})
                    this.setState({my_time:this.my_time_2})
                    this.saveArea("area6")

                }
                else if(clusterValue==="3"){
                    this.setState({my_action:this.my_action_3})
                    this.setState({my_time:this.my_time_3})
                    this.saveArea("aree7")


                }
            },
        )
    }

    render() {
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
                                <div style={{textAlign:"center",
                                    height: '10%',
                                }}>
                                    <Frame heightZZ = "100">
                                            <FrameTitle value={"选择集群"} />
                                                <form className="seed" onSubmit={this.search_new_finding_data}>
                                                    <div className="seed3">
                                                        <div className="seed1" style={{textAlign:"center"}}>集群</div>
                                                        <select value={this.state.clusterValue} onChange={this.handleChange} style={{width:"100%"}}>
                                                            <option value="1">dfcp30.com</option>
                                                            <option value="2">phlotplay.com</option>
                                                            <option value="3">05854.cc</option>
                                                            <option value="1">www.7115882.vip</option>
                                                            <option value="2">www.ya500.vip</option>
                                                            <option value="3">438973.com</option>
                                                            <option value="1">www.3.tt</option>
                                                            <option value="2">178452.com</option>
                                                            <option value="3">www.6615ff.com</option>
                                                            <option value="1">070353.com</option>
                                                            <option value="2">5500.com</option>
                                                            <option value="3">hdgsjgjsfd.525888yhcp.com</option>
                                                            <option value="1">55669006.com</option>
                                                        </select>
                                                    </div>     
                                                    <div className="se" style={{textAlign:"center"}}>
                                                        <button type='submit' style={{backgroundColor:"#2274A5", padding:"5px 50px", color:"white"}}>点击选择集群</button>
                                                    </div>
                                                </form>
                                        </Frame>
                                    </div>
                                        <div style={{
                                    height: '1.5%',
                                }}/>
                                <div style={{
                                    height: '30%',
                                    textAlign:"center"
                                }}>
                                    <Frame heightZZ = "100">
                                        <FrameTitle value={"网站截图"}/>
                                            
                                            <img src={this.state.cluster_main_screenshot} style = {{height:"85%",marginTop:"2%"}}/>
                                    </Frame>
                                </div>
                                <div style={{
                                    height: '1.5%',
                                }}/>
                                        {/* 集群动态 */}
                                        <div style={{
                                    height: '30%',
                                    textAlign:"center"
                                }}>
                                    <Frame heightZZ = "100">


                                            <Moment my_time={this.state.my_time} my_action={this.state.my_action}/>
                                            
                                    </Frame>
                                    </div>
                                        

                                    </div>
    
                    </Grid>
                    <Grid item xs={6}>
                            {/* <div style={{ display: "flex", flexDirection: "column", justifyContent: "space-between" }}> */}
                            <div 
                            style={{
                                height: '16rem',
                                display: "flex", flexDirection: "column"
                              }}>
                                <div style={{textAlign:"center",
                                    height: '45%',
                                }}>
                                {/* <HorizontalNav grandfatherChange={props.fatherChange} active={props.reg_number}/> */}
                                <div  id="mapmap1"style={{height:"100%"}}>
                                    <div id={this.state.area} style={{ height: "100%"}} />
                                    <StatisticsMapData area={'world'} mapID={this.state.area}/>
                                </div>
                            </div>
                            <div style={{
                                    height: '8%',
                                }}/>
                                <div style={{textAlign:"center",
                                    height: '20%',
                                }}>
                                        <Frame heightZZ = "100">
                                        <FrameTitle value={"集群信息"} />
                                        <Grid container>
                                            <Grid item xs={3}>
                                                <div className="paper">
                                                    <p>ip地址</p>
                                                    <p>网站主体信息</p>
                                                    <p>网站类型</p>
                                                    <p>后台服务器地址</p>
                                                </div>
                                            </Grid>
                                            <Grid item xs={9}>
                                                <div className="paper">
                                                    <p>{this.state.ip_cluster}</p>
                                                    <p>{this.state.site_main_info}</p>
                                                    <p>{this.state.seed_domain_type}</p>
                                                    {this.state.dns_ip_cluster.map((item, index) => {
                                                        return (
                                                        <div key={index} className="row" style={{display: "inline-flex"}}>
                                                            {item.map((subItem) => {
                                                            return (
                                                                <p style={{marginLeft:"15px", marginTop:"0px"}}>
                                                                    {subItem}
                                                                </p>
                                                            );
                                                            })}
                                                        </div>
                                                        );
                                                    })}
                                                </div>
                                            </Grid>
                                        </Grid>
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
                                    <div style={{height: "73%" }}>
                                    <Frame heightZZ = "100">
                                            <FrameTitle value={"域名分布"} />
                                            <div className="paper">
                                                <div style={{ fontSize: "22px", listStyleType: "none" }}>
                                                {
                                                    this.state.oh_my_domains.map((value, key) => {
                                                        return (
                                                            <li style={{marginTop:"18px", marginBottom:"18px", fontSize:"22px"}}>
                                                                {value}
                                                            </li>
                                                        )
                                                    })
                                                }
                                                </div>
                                            </div>
                                        </Frame>
                                    </div>
                                </div>
                    </Grid>
                </Grid>
                </Box>
        );
    }



}
export default ClusterInfo;