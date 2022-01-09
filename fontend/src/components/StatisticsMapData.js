import React, {Component, PureComponent} from 'react';
import axios from "../Utils/axios";
import StatisticsMap from "./StatisticsMap";
var pjson = require('../../package.json')
var pjsonUrl = pjson.config.url

class StatisticsMapData extends PureComponent {
    constructor(props) {
        super(props);
        this.state={
            //世界地图数据
            cityData1:[],
            countryData1:[],
            dailyCityData:[],  //后端有差异

            //中国地图数据
            cityData2:[],
            countryData2:[],
        }
    }

    savecityData1=(cityData1)=>{
        this.setState({cityData1:cityData1})
    }
    savecountryData1=( countryData1)=>{
        this.setState({ countryData1: countryData1})
    }
    savedailyCityData=(dailyCityData)=>{
        this.setState({dailyCityData:dailyCityData})
    }
    savecityData2=(cityData2)=>{
        this.setState({cityData2:cityData2})
    }
    savecountryData2=( countryData2)=>{
        this.setState({ countryData2: countryData2})
    }

    searchStatisticsMap1 = ()=>{
        axios.get(pjsonUrl+'/map?area=1').then(
            response => {
                this.savecityData1(response.data.cityData)
                this.savecountryData1(response.data.countryData)
                this.savedailyCityData(response.data.daliyCityData)
            },
        )
    }

    searchStatisticsMap2 = ()=>{
        axios.get(pjsonUrl+'/map?area=2').then(
            response => {
                this.savecityData2(response.data.cityData)
                this.savecountryData2(response.data.countryData)
            },
        )
    }

    componentDidMount() {
        this.searchStatisticsMap1()
        this.searchStatisticsMap2() 
    }


// 为什么这里被执行了多次
// 为什么被执行了14次？
    render() 
    {   
        console.log("进入地图!!!!!!!!!!!!!!!!!!!!!!")
        console.log(this.props.mapID)
        console.log(this.state.cityData1)
        // 传入3
        // return <div/>
        return (this.props.area==='world'?(
            this.props.mapID==='area1'?
                (<StatisticsMap mapId={"area1"} area={"world"} cityData={this.state.cityData1} countryData={this.state.countryData1}/>):
                ((this.props.mapID==='area3')?
                (<StatisticsMap mapId={"area3"} area={"world"} cityData={this.state.cityData1} countryData={this.state.countryData1} dailyCityData={this.state.dailyCityData}/>):
                ((this.props.mapID==='area4')?
                (<StatisticsMap mapId={"area4"} area={"world"} dailyCityData={this.state.dailyCityData} />):
                ((this.props.mapID==='area5')?
                (<StatisticsMap mapId={"area5"} area={"world"} cityData={this.state.cityData1} countryData={this.state.countryData1}/>):
                ((this.props.mapID==='area6')?
                (<StatisticsMap mapId={"area6"} area={"world"} cityData={this.state.cityData1} countryData={this.state.countryData1}/>):
                (<StatisticsMap mapId={"area7"} area={"world"} cityData={this.state.cityData1} countryData={this.state.countryData1}/>)
                ))))):
            <StatisticsMap mapId={"area2"} area={"china"} cityData={this.state.cityData2} countryData={this.state.countryData2}/>);
}
}

export default StatisticsMapData;