import React, {Component} from 'react';
import Header from "../components/Header";
import axios from "../Utils/axios"
import ClusterInfo from '../components/ClusterInfo';
import TopPage from '../components/top';
import { IndexPageStyle, IndexPageContent } from './style/style';
// import '../Utils/flexible';
var pjson = require('../../package.json')
var pjsonUrl = pjson.config.url

class ClusterPage extends Component {
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

            oh_my_domains:[],
            dns_ip_cluster:[],
            site_main_info:"",
            ip_cluster:"",
            seed_domain_type:0,
            cluster_main_screenshot:""
        }
    }

    handleRegOnclick(number){
        this.setState({
            reg_number:number,
        })
    }

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

    searchStatistics1 = ()=>{

        axios.get(pjsonUrl+'/findClusterByid?clusterId=1').then(
            response => {
                this.saveIpCities1(response.data.rankIpCity)
                this.saveAsAtIps1(response.data.rankAsAtIp)
                this.saveseedNum1(response.data.seedNum)
                this.saveavgSeedNum1(response.data.avgSeedNum)
                this.savefoundSites1(response.data.foundSites)
                this.savefoundApps1(response.data.foundApps)
                this.saveasIndustries1(response.data.asIndustry)
                this.savedomainAtRegistrars1(response.data.domainAtRegistrar)
                this.savetldDistributions1(response.data.tldDistribution)
                
                this.saveOh_my_domains(response.data.oh_my_domains)
                this.saveDns_ip_cluster(response.data.dns_ip_cluster)
                this.saveSite_main_info(response.data.site_main_info)
                this.saveIp_cluster(response.data.ip_cluster)
                this.saveSeed_domain_type(response.data.domain_type)
                this.saveCluster_main_screenshot(response.data.cluster_main_screenshot)
            },
        )
    }
    //生命周期组件
    componentDidMount(){
        this.searchStatistics1()
    }
    render() {
        document.body.style.overflow = 'hidden'
        return (<div id="wrapper">
                {/* <Header nav_number="p5"/> */}
                <IndexPageStyle>
                <TopPage  topFlag = "1" nav_number="p5"/>
                <div>
                    <ClusterInfo
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

                        oh_my_domains={this.state.oh_my_domains}
                        dns_ip_cluster={this.state.dns_ip_cluster}
                        site_main_info={this.state.site_main_info}
                        ip_cluster={this.state.ip_cluster}
                        seed_domain_type={this.state.seed_domain_type}
                        cluster_main_screenshot={this.state.cluster_main_screenshot}
            
                    />   
                </div>
                </IndexPageStyle>
            </div>);
    }
}

export default ClusterPage;