import React, {Component} from 'react';
import * as echarts from 'echarts';

export default class HomeLineChart extends Component {
    homelinechart(){
        if(this.props.barId==="home4"){
            (function (Data) {
                //图表展示的相应数据
                let hostProNum=Data.map((item)=>{
                    return item.number;
                })

                let Provider=[];
                for(let i in Data){
                    Provider.push({
                        value:Data[i].provider,
                        textStyle: {
                            fontSize: 14,
                            fontWeight:'lighter',
                        }
                    })
                }

                //初始化echarts实例对象
                let myChart=echarts.init(document.getElementById('home4'));
                //指定配置项和数据(option)

                let option = {
                    color:['#5470c6', '#91cc75', '#fac858',
                            '#ee6666', '#73c0de', '#3ba272',
                            '#fc8452', '#9a60b4', '#ea7ccc'],
                    tooltip: {
                        trigger: 'axis',
                        axisPointer: {
                            type: 'shadow'
                        },
                    },
                    grid: {
                        left: '8%',
                        right: '10%',
                        top:  '15%',
                        bottom:'0%',
                        containLabel:true
                    },
                    xAxis: {
                        type: 'category',
                        data: Provider,
                        axisLabel:{
                            interval:0,
                            rotate:30,
                        },
                        axisLine: {
                            lineStyle: {
                                color:'white',
                            }
                        },
                    },
                    yAxis: {
                        type:'value',
                        axisLabel: {        
                            show: true,
                            textStyle: {
                                color: 'white',
                                fontSize:'12',
                                fontWeight:'lighter',
                            }
                        },
                        axisLine: {
                            lineStyle: {
                                color:'white',
                            }
                        },
                    },
                    series: [{
                        data: hostProNum,
                        type: 'line',
                        color:'#6997AF',
                        label:{
                                show:true,
                                position:'top',
                                distance:5,
                                color:'white',
                        }
                    }]
                };
                myChart.setOption(option,true);

                //图表自适应屏幕
                window.addEventListener("resize", function() {
                    myChart.resize();
                });
            })(this.props.data);
        }
    }

    componentDidMount() {
        this.homelinechart();
    }


    componentDidUpdate() {
        this.homelinechart();
    }

    render() {
        return (
            <div/>
        );
    }
}