import React, {Component} from 'react';
import Header from "../components/Header";
import axios from "../Utils/axios"
import StatisticsChina from "../components/StatisticsChina";
import StatisticsWorld from "../components/StatisticsWorld";
import TopPage from '../components/top';
import { IndexPageStyle, IndexPageContent } from './style/style';
// import '../Utils/flexible';
var pjson = require('../../package.json')
var pjsonUrl = pjson.config.url

class WorldDataPage extends Component {
    constructor(props) {
        super(props);
        this.state={
            reg_number:1,
            IpCities1:[],
            AsAtIps1:[],
            seedNum1:0,
            avgSeedNum1:0,
            foundSites1:0,
            foundApps1:0,
            asIndustries1:[],
            domainAtRegistrars1:[],
            tldDistributions1:[],
            IpCities2:[],
            AsAtIps2:[],
            seedNum2:0,
            avgSeedNum2:0,
            foundSites2:0,
            foundApps2:0,
            asIndustries2:[],
            domainAtRegistrars2:[],
            tldDistributions2:[],
        }
    }

    handleRegOnclick(number){
        this.setState({
            reg_number:number,
        })
    }

//statistics综合数据
    //全球
    saveIpCities1 = (IpCities1)=>{
        this.setState({IpCities1:IpCities1})
    }

    saveAsAtIps1 = (AsAtIps1) =>{
        this.setState({AsAtIps1:AsAtIps1})
    }

    saveseedNum1 = (seedNum1) =>{
        this.setState({seedNum1:seedNum1})
    }

    saveavgSeedNum1 = (avgSeedNum1) =>{
        this.setState({avgSeedNum1:avgSeedNum1})
    }

    savefoundSites1 = (foundSites1) =>{
        this.setState({foundSites1:foundSites1})
    }

    savefoundApps1 = (foundApps1) =>{
        this.setState({foundApps1:foundApps1})
    }

    saveasIndustries1 = (asIndustries1) =>{
        this.setState({asIndustries1:asIndustries1})
    }

    savedomainAtRegistrars1 = (domainAtRegistrars1) =>{
        this.setState({domainAtRegistrars1:domainAtRegistrars1})
    }

    savetldDistributions1 = (tldDistributions1) =>{
        this.setState({tldDistributions1:tldDistributions1})
    }

    

    //境内
    saveIpCities2 = (IpCities2)=>{
        this.setState({IpCities2:IpCities2})
    }

    saveAsAtIps2 = (AsAtIps2) =>{
        this.setState({AsAtIps2:AsAtIps2})
    }

    saveseedNum2 = (seedNum2) =>{
        this.setState({seedNum2:seedNum2})
    }

    saveavgSeedNum2 = (avgSeedNum2) =>{
        this.setState({avgSeedNum2:avgSeedNum2})
    }

    savefoundSites2 = (foundSites2) =>{
        this.setState({foundSites2:foundSites2})
    }

    savefoundApps2 = (foundApps2) =>{
        this.setState({foundApps2:foundApps2})
    }

    saveasIndustries2 = (asIndustries2) =>{
        this.setState({asIndustries2:asIndustries2})
    }

    savedomainAtRegistrars2 = (domainAtRegistrars2) =>{
        this.setState({domainAtRegistrars2:domainAtRegistrars2})
    }

    savetldDistributions2 = (tldDistributions2) =>{
        this.setState({tldDistributions2:tldDistributions2})
    }
    searchStatistics1 = ()=>{

        //as
        axios.get(pjsonUrl+'/network/AS').then(
            response => {
                this.saveAsAtIps1(response.data.AS)
            },
        )
        axios.get(pjsonUrl+'/network/industry').then(
            response => {
                this.saveasIndustries1(response.data.industry)
            },
        )
        //顶级域名分布
        axios.get(pjsonUrl+'/network/tld').then(
            response => {
                 this.savetldDistributions1(response.data.tld)

            },
        )
        //注册上设计的域名数
        axios.get(pjsonUrl+'/network/registrar').then(
            response => {
                this.savedomainAtRegistrars1(response.data.registrar)
            },
        )
        //获得城市信息//只用到了名字和IP数量
        axios.get(pjsonUrl+'/network/city').then(
            response => {
                this.saveIpCities1(response.data.city)
                // console.log(response.data.city)
            },
        )
        //全体信息
        axios.get(pjsonUrl+'/total').then(
            response => {
                this.saveseedNum1(response.data.totalSeed)
                // this.saveavgSeedNum1(response.data.avgSeedNum)
                this.savefoundSites1(response.data.totalSite)
                this.savefoundApps1(response.data.totalApp)
            },
        )
        
    }
    searchStatistics2 = ()=>{
        axios.get(pjsonUrl+'/statistics?area=2').then(
            response => {
                this.saveIpCities2(response.data.rankIpCity)
                this.saveAsAtIps2(response.data.rankAsAtIp)
                this.saveseedNum2(response.data.seedNum)
                this.saveavgSeedNum2(response.data.avgSeedNum)
                this.savefoundSites2(response.data.foundSites)
                this.savefoundApps2(response.data.foundApps)
                this.saveasIndustries2(response.data.asIndustry)
                this.savedomainAtRegistrars2(response.data.domainAtRegistrar)
                this.savetldDistributions2(response.data.tldDistribution)
            },
        )
    }
    //生命周期组件
    componentDidMount(){
        this.searchStatistics1()
        // this.searchStatistics2()
    }
    render() {
        document.body.style.overflow = 'hidden'
        return this.state.reg_number===1?
                    (<div id="wrapper">
                <IndexPageStyle>
                <TopPage  topFlag = "1" nav_number="p2"/>
                <div>
                    <StatisticsWorld
                        reg_number={this.state.reg_number}
                        AsAtIps1={this.state.AsAtIps1}
                        asIndustries1={this.state.asIndustries1}
                        tldDistributions1={this.state.tldDistributions1}
                        seedNum1={this.state.seedNum1}
                        avgSeedNum1={this.state.avgSeedNum1}
                        foundSites1={this.state.foundSites1}
                        foundApps1={this.state.foundApps1}
                        IpCities1={this.state.IpCities1}
                        domainAtRegistrars1={this.state.domainAtRegistrars1}
                        fatherChange={this.handleRegOnclick.bind(this)}
                    />   
                </div>
                </IndexPageStyle>
            </div>):
                        (<div id="wrapper">
                            <Header/>
                            <div>
                        <StatisticsChina
                            reg_number={this.state.reg_number}
                            AsAtIps2={this.state.AsAtIps2}
                            asIndustries2={this.state.asIndustries2}
                            tldDistributions2={this.state.tldDistributions2}
                            seedNum2={this.state.seedNum2}
                            avgSeedNum2={this.state.avgSeedNum2}
                            foundSites2={this.state.foundSites2}
                            foundApps2={this.state.foundApps2}
                            IpCities2={this.state.IpCities2}
                            domainAtRegistrars2={this.state.domainAtRegistrars2}
                            fatherChange={this.handleRegOnclick.bind(this)}
                        />
                    </div>
                        </div>);
    }
}

export default WorldDataPage;