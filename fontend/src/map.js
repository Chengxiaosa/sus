import React, { Component } from 'react';
import * as echarts from 'echarts';
import $ from 'jquery';

class Map extends Component {
    constructor(props) {
        super(props);
        this.state = {
            mapId:this.props.mapId
        }
    }
    componentDidMount() {
        if (this.props.mapId === "map1"){
            var map1 = echarts.init(document.getElementById("map1"));
            var area = this.props.area;
            $.get('./maps/'+this.props.area+'.json', function (geoJson) {
                echarts.registerMap(area, geoJson);
                var option = {
                    legend:{
                        left: 'left',
                        bottom:'0%',
                        orient:'vertical',
                        textStyle:{
                            color: '#fff',
                            borderColor: '#008B8B'
                        }
                    },
                    visualMap: {
                        min: 0,
                        max: 30000,
                        text: ['High', 'Low'],
                        realtime: false,
                        calculable: true,
                        inRange: {
                            color: ['lightskyblue', 'yellow', 'orangered']
                        },
                        bottom: '20%',
                        seriesIndex: 0
                    },
                    grid:{
                        left: 0,
                        right: 0,
                        top:0,
                        bottom:0
                    },
                    geo: {
                        map: area
                    },
                    series: [
                        {
                            name: '历史诈骗IP所属国家',
                            type: 'map',
                            mapType: area,
                            itemStyle:{
                                areaColor: '#0ba7bd'
                            },
                            label:{
                                show: false
                            },
                            data: [
                                {name: '美国',value:25034},
                                {name: '中国', value: 23489},
                                {name: '俄罗斯', value: 21345},
                                {name: '埃及', value: 12453},
                                {name: '加拿大', value: 12664},
                                {name: '巴西', value: 24573},
                                {name: '韩国', value: 9531}
                            ],
                            nameMap: {
                                'United States': '美国',
                                'China': '中国',
                                'Russia': '俄罗斯',
                                'Egypt': '埃及',
                                'Canada': '加拿大',
                                'Brazil': '巴西',
                                'Korea': '韩国'
                            }
                        },
                        {
                            name:'当日发现诈骗IP所属城市',
                            type:'scatter',
                            coordinateSystem: 'geo',
                            label: {
                                show: true,
                                align: 'left',
                                color: "#fff",
                                formatter:'{b}'
                            },
                            symbol: 'triangle',
                            symbolSize: 13,
                            data:[
                                {name: '北京', value:[116.405285, 39.904989]},
                                {name: '香港', value:[114.173355, 22.320048]},
                                {name: '开罗', value:[34.2453125, 31.208300]},
                                {name: '台湾', value:[121.509062, 25.044332]},
                                {name: '伦敦', value:[-2.5830348,54.4598409]},
                                {name: '哥本哈根', value:[10.276833,56.177388]}
                            ]
                        },
                        {
                            name:'历史发现诈骗IP所属城市',
                            type:'scatter',
                            coordinateSystem: 'geo',
                            label: {
                                show: true,
                                align: 'left',
                                shadowColor: 'transparent',
                                color: "#fff",
                                formatter:'{b}',
                                backgroundColor: 'rgba(128,128,128,0.7)',
                                offset: [10,-10],
                                fontSize: 15
                            },
                            labelline:{
                                show: true,
                                showAbove: true
                            },
                            itemStyle:{
                                color: 'rgba(128,128,0,0.7)'
                            },
                            symbol: 'circle',
                            symbolSize: 10,
                            data:[
                                {name: '上海', value:[121.472644, 31.231706]},
                                {name: '吉林', value:[125.3245, 43.886841]},
                                {name: '拉斯维加斯', value:[-115.3150834,36.1249185]},
                                {name: '西雅图', value:[-120.0211242,36.4862967]},
                                {name: '苏克雷', value:[-129.3351581,52.0310173]},
                                {name: '卡罗维发利', value:[12.7942751,50.2168744]},
                                {name: '帕鲁', value:[124.4373893,-14.67068]},
                                {name: '印度尼西亚雅加达', value:[108.8470056,-2.4152965]},
                                {name: '香港', value:[114.173355, 22.320048]},
                                {name: '哈萨克斯坦', value:[63.5622732,48.0000571]}
                            ]
                        }
                    ]
                };
                map1.setOption(option);
            });
        }
        else if (this.props.mapId === "map4"){
            var area = this.props.area;
            $.get('./maps/'+this.props.area+'.json', function (geoJson) {
                var map4 = echarts.init(document.getElementById('map4'));
                echarts.registerMap('world', geoJson);
                var option = {
                    legend:{
                        left: 'left',
                        bottom:'10%',
                        orient:'vertical',
                        textStyle:{
                            color: '#fff',
                            borderColor: '#008B8B'
                        }
                    },
                    toolbox: {
                        show: true,
                        orient: 'vertical',
                        left: 'right',
                        top: 'center',
                        feature: {
                            dataView: {readOnly: false},
                            restore: {},
                            saveAsImage: {}
                        }
                    },
                    geo: {
                        map: area,
                        itemStyle:{ 
                            normal:{ 
                                areaColor:'#323c48',
                                borderColor:'#111'
                            },
                            emphasis:{ 
                                areaColor:'#2a333d' 
                            }
                        }
                    },
                    series: [
                        {
                            type: 'map',
                            mapType: area,
                            itemStyle:{
                                areaColor: '#0ba7bd'
                            }
                        },
                        {
                            name:'历史发现诈骗IP所属城市',
                            type:'scatter',
                            coordinateSystem: 'geo',
                            label: {
                                show: true,
                                align: 'left',
                                color: "#fff",
                                formatter:'{b}'
                            },
                            symbol: 'triangle',
                            symbolSize: 13,
                            data:[
                                {name: '北京', value:[116.405285, 39.904989]},
                                {name: '香港', value:[114.173355, 22.320048]},
                                {name: '开罗', value:[34.2453125, 31.208300]},
                                {name: '台湾', value:[121.509062, 25.044332]},
                                {name: '伦敦', value:[-2.5830348,54.4598409]},
                                {name: '哥本哈根', value:[10.276833,56.177388]}
                            ]
                        }
                    ]
                };
                map4.setOption(option);
            });
        }
    }
    render() {
        return (
            <div id={this.props.mapId} style={{ width: this.props.width, height: this.props.height }}></div>
        );
    }
}

export default Map;