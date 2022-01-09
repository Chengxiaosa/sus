import React, {Component} from 'react';
import Header from "../components/Header";
import axios from "../Utils/axios";
import HomeBody from "../components/homecomponenets/homebody"
import FullWidthGrid from"../components/test"
import '../Utils/flexible';
import TopPage from '../components/top';
import { IndexPageStyle, IndexPageContent } from './style/style';
var pjson = require('../../package.json')
var pjsonUrl = pjson.config.url

class Homepage extends Component {
    constructor(props) {
        super(props);
        this.state={
            AppNum:0,
            SiteNum:0,
            dailySiteNum:0,
            dailyAppNum:0,
            IPs:[],
            TLDs:[],
            PaymentChannels:[],
            Banks:[],
            // 类名字Homepage  这个里面得到
            dailyDatas:[],
            Servers:{
                bandwidth:0,
                cpu:0,
                diskRate:0,
                memory:0,
                request:0,
            },
            hostProviders:[],
            AsAtIps:[],
        }
    }
    
     //获取数据
    //head首页

    saveAsAtIps = (AsAtIps) =>{
        this.setState({AsAtIps:AsAtIps})
    }

    saveIPs = (IPs)=>{
        this.setState({IPs:IPs})
    }
  
    saveTLDs = (TLDs)=>{
        this.setState({TLDs:TLDs})
    }
  
    savePaymentChannels = (PaymentChannels)=>{
        this.setState({PaymentChannels:PaymentChannels})
    }
  
    saveBanks = (Banks)=>{
        this.setState({Banks:Banks})
    }
  
    saveAppNum = (AppNum)=>{
        this.setState({AppNum:AppNum})
    }
  
    saveSiteNum = (SiteNum)=>{
        this.setState({SiteNum:SiteNum})
    }

    savedailySiteNum = (dailySiteNum)=>{
        this.setState({dailySiteNum:dailySiteNum})
    }

    savedailyAppNum = (dailyAppNum)=>{
        this.setState({dailyAppNum:dailyAppNum})
    }
  
    savedailyDatas = (dailyDatas)=>{
        this.setState({dailyDatas:dailyDatas})
    }
  
    saveServers = (Servers)=>{
        this.setState({Servers:Servers})
    }

    savehostProviders = (hostProviders)=>{
        this.setState({hostProviders:hostProviders})
    }

    searchHead = ()=>{
        axios.get(pjsonUrl+'/daily').then(
        response => {
            this.savedailyDatas(response.data.dailySites)
            this.savedailySiteNum(response.data.dailySiteNum)
            this.savedailyAppNum(response.data.dailyScanSite)
            },
        )
        axios.get(pjsonUrl+'/total').then(
        response => {
            this.saveAppNum(response.data.totalApp)
            this.saveSiteNum(response.data.totalSite)
            },
        )
    axios.get(pjsonUrl+'/server').then(
        response => {
            this.saveServers(response.data.server)
            },
        )
    }

    //生命周期组件 创造的时候就运行
    componentDidMount(){
        // 这里就用一个方法也行, 需要请求total daily server city country
        this.searchHead()
    }

    render() {
        console.log("多次执行Homepage")
        document.body.style.overflow = 'hidden'
        return (
            <div>
                <IndexPageStyle>
                <TopPage  topFlag = "1" nav_number="p1"/>
                 <HomeBody
                    AsAtIps={this.state.AsAtIps}
                    AppNum={this.state.AppNum}
                    SiteNum={this.state.SiteNum}
                    dailySiteNum={this.state.dailySiteNum}
                    dailyAppNum={this.state.dailyAppNum}
                    IPs={this.state.IPs}
                    TLDs={this.state.TLDs}
                    PaymentChannels={this.state.PaymentChannels}
                    Banks={this.state.Banks}
                    dailyDatas={this.state.dailyDatas}
                    Servers={this.state.Servers}
                    hostProviders={this.state.hostProviders}/>  

                {/* <FullWidthGrid/>  */}
                </IndexPageStyle>

    
                    
            </div>
        );
    }
}

export default Homepage;