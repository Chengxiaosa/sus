import React, {Component} from 'react';
import $ from "jquery";
import * as echarts from "echarts";
import world from "../world.json"
class findingmap extends Component {

    constructor (props) {
        super(props);

        this.state = {
            findingmapData: this.props.findingmapData,
            len: 1,
            flag: false,
            length: this.props.findingmapData.length,
        }
    }
    convertdata(data){
        let res = [];
        let len1 = this.state.len;
        let len2 = this.state.length;
        for(var i = 0;i < len1; i++){
            res.push({
                name:data[i].cityName,
                value:data[i].long<340?[data[i].long,data[i].lat]:[data[i].long-360,data[i].lat]
            })
        }
        if(len1 < len2){
            this.setState({
                len: len1+1
            });
        }else{
            clearInterval(this.timer);
        }
        return res;
    }
    build(){
        let Area='world';
        //判断dom容器是否加载完成，防止页面崩溃
        // 找到他卡顿的的原因了
        let mapDom=document.getElementById('map');
        if(!mapDom) return;

        let map = echarts.init(document.getElementById('map'));
        echarts.registerMap('world', world);
        let option={
            legend:{
                left: '10%',bottom:'0%',orient:'vertical',
                textStyle:{
                    color: '#fff',
                    borderColor: '#008B8B'
                }
            },
            geo: {
                map: Area,
                itemStyle:{
                    normal:{areaColor:'#323c48',borderColor:'#111'},
                    emphasis:{areaColor:'#FED766'}
                }
            },
            color:['#6997AF', '#91cc75', '#fac858','#ee6666', '#73c0de', '#3ba272','#fc8452', '#9a60b4', '#ea7ccc'],
            series: [
                {
                    type: 'map', mapType: Area,
                    itemStyle:{areaColor: '#0ba7bd',color:"#FED766"},
                    emphasis: {
                        itemStyle: {
                            shadowBlur: 10,
                            shadowOffsetX: 5,
                            shadowOffsetY: 5,
                            shadowColor: '#FED766',
                        },
                        label: {
                            show: true
                        },
                        // color:"black"
                    },
                },
                {
                    name:'当日发现诈骗IP所属城市',type:'scatter',coordinateSystem: 'geo',
                    label: { show: true, align: 'left',color: "#FED766", formatter:'{b}'},
                    itemStyle:{color:"rgba(244,96,108,1)"},
                    symbol: 'circle', symbolSize: 20, 
                }
            ] 
        }
        map.setOption(option,true,true);
        var obj = this;
        this.timer = setInterval(function() {
            console.log(obj.state.flag)
            if(obj.state.flag === true){
                var newOption= map.getOption();
                obj.updateData(newOption);
                map.setOption(newOption,true); 
                if(obj.state.len === obj.state.length){
                    console.log(987);          
                    clearInterval(this.timer);  
                }
            }
        }, 1500);  
    }
    changeflag = () =>{
        this.setState({
            flag: true
        });
    }
    updateData = (newOption) =>{
        newOption.series[1].data = this.convertdata(this.state.findingmapData)
        console.log(9876);
    } 
    componentDidMount() {
        this.props.onRef(this)
        this.build()
    }
    componentWillUnmount(){
        clearInterval(this.timer)
    }
    render() {
        return (
            (this.state.findingmapData === '')
            ? <div style={{color:"white"}}><h2>loading...</h2></div>
            :
            <div id='map' style={{height: '100%', width: '118%'}}></div>
        );
    }
}

export default findingmap;
