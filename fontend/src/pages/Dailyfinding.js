import React, {Component} from 'react';
import Header from "../components/Header";
import axios from "../Utils/axios"
import DailyFindingChild from "../components/DailyFindingChild";
import TopPage from '../components/top';
import { IndexPageStyle, IndexPageContent } from './style/style';
// import '../Utils/flexible';
var pjson = require('../../package.json')
var pjsonUrl = pjson.config.url
React.axios = axios
class Findingpage extends Component {
    constructor(props) {
        super(props);
        this.state={
            button_number:0,
            availableDomain:[],
            dailyFindData:{},
            findingmapData:'',
            findServer: {
                bandwidth:100,
                cpu:{cpuProp:0.15,cpuStatus:{live:4,total:5}},
                disk:{diskProp:0.5,diskSpeed:4},
                memory:{memProp:0.3,memStatus:{total:128,use:10}},
                request:1900,rx:1,tx:3
            },
            sitesByDomain:[],
            sitesByCert:[],
            sitesByIp:[],
            cpu:{
                cpuProp:0,
                cpuStatus:{
                    live:1,
                    total:1
                }
            },
            disk:{
                diskProp:0,
                diskSpeed:0
            },
            memory:{
                memProp:0,
                memStatus:{
                    total:128,
                    use:10
                }
            },
            cpuStatus:{
                live:1,
                total:1
            },
            memStatus:{
                total:128,
                use:10
            },
            domains_from_boom:[],
            domains_from_cert:[],
            domains_from_dns:[],
            domains_from_subnet:[],
            screenshot: ''
        }
    }
    savedailyFindData=(dailyFindData)=>{
        this.setState({
            dailyFindData:dailyFindData
        })
    }
    savecpu=(cpu)=>{
        this.setState({
            cpu:cpu
        })
    }
    savedisk=(disk)=>{
        this.setState({
            disk:disk
        })
    }
    savecpuStatus=(cpuStatus)=>{
        this.setState({
            cpuStatus:cpuStatus
        })
    }
    savememory=(memory)=>{
        this.setState({
            memory:memory
        })
    }
    savememStatus=(memStatus)=>{
        this.setState({
            memStatus:memStatus
        })
    }
    saveAvailableDomain=(availableDomain)=>{
        this.setState({
            availableDomain:availableDomain
        })
    }


    saveSitesByDomain=(sitesByDomain)=>{
        this.setState({
            sitesByDomain:sitesByDomain
        })
    }
    saveSitesByCert=(sitesByCert )=>{
        this.setState({
            sitesByCert :sitesByCert
        })
    }
    saveSitesByIp=(sitesByIp )=>{
        this.setState({
            sitesByIp :sitesByIp
        })
    }
    savefindServer=(findServer )=>{
        this.setState({
            findServer :findServer
        })
    }
    savefindingmapData=(findingdata)=>{
        this.setState({
            findingmapData :findingdata
        })
    }

    saveScreenshot=(screenshot)=>{
        this.setState({
            screenshot: screenshot
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


    searchDailyfinding = ()=>{
        axios.get(pjsonUrl+'/dailyfinding').then(
            response => {
                this.saveAvailableDomain(response.data.availableDomain)
                this.savedailyFindData(response.data.dailyData)
                this.saveSitesByDomain(response.data.sitesByDomain)
                this.saveSitesByCert(response.data.sitesByDomain)
                this.saveSitesByIp(response.data.sitesByIpAndCert)
                this.savefindServer(response.data.server)
                this.savecpu(response.data.server.cpu)
                this.savedisk(response.data.server.disk)
                this.savememory(response.data.server.memory)
                this.savememStatus(response.data.server.memory.memStatus)
                this.savecpuStatus(response.data.server.cpu.cpuStatus)
            },
        )
    }
    searchfindingdata = ()=>{
        axios.get(pjsonUrl+'/map').then(
            response => {
                this.savefindingmapData(response.data.daliyCityData)
            }
        )
    }
    search_new_finding_data = ()=>{
        console.log("!!!in")
        axios.get(pjsonUrl+'/findSitesByUrl?url=https://www.556bl.com').then(
        // 这里不应该写死
        // axios.get(pjsonUrl+'/findSitesByUrl?url=https://www').then(
            response => {
                this.saveDomains_from_boom(response.data.domains_from_boom)
                this.saveDomains_from_cert(response.data.domains_from_cert)
                this.saveDomains_from_dns(response.data.domains_from_dns)
                this.saveDomains_from_subnet(response.data.domains_from_subnet)
                this.saveScreenshot(response.data.screenshot)
                console.log(response.data)
            }
        )
    }
    handleButton(number){
        this.setState({
            button_number:number
        })
    }
    componentDidMount() {
        this.searchfindingdata()
        this.searchDailyfinding()
    }
    render() {
        
        document.body.style.overflow = 'hidden'
        return (
            (this.state.findingmapData == '' || this.state.sitesByIp == undefined)
            ? <div style={{color:"white"}}><h2>loading...</h2></div>
            :
            <div id="wrapper">
                {/* <Header nav_number="p3"/> */}
                <IndexPageStyle>
                    {/* 头部 */}
                <TopPage nav_number="p3"/>
                <DailyFindingChild
                    cpu={this.state.cpu}
                    cpuStatus={this.state.cpuStatus}
                    memory={this.state.memory}
                    memStatus={this.state.memStatus}
                    disk={this.state.disk}
                    findServer={this.state.findServer}
                    dailyFindData={this.state.dailyFindData}
                    sitesByCert={this.state.sitesByCert}
                    findingmapData={this.state.findingmapData}
                    availableDomain={this.state.availableDomain}
                    sitesByDomain={this.state.sitesByDomain}
                    sitesByIp={this.state.sitesByIp}

                    domains_from_boom={this.state.domains_from_boom}
                    domains_from_cert={this.state.domains_from_cert}
                    domains_from_dns={this.state.domains_from_dns}
                    domains_from_subnet={this.state.domains_from_subnet}
                    screenshot={this.state.screenshot}
                />
                    <div id="ajaxloader3" style={{position:"absolute", top:"50%", left:"50%", display:"none"}}>
                        <div class="outer"></div>
                        <div class="inner"></div>
                    </div>
                    </IndexPageStyle>
            </div>
        );
    }
}

export default Findingpage;
