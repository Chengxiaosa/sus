import React, {Component,PureComponent} from 'react';
import * as echarts from "echarts";


export default class HomePieChart extends PureComponent {

    initPieEcharts = () => {
        if(this.props.pieId==='home5'){
            (function (Data){
                // Data=Data.toFixed(1);
                let myChart=echarts.init(document.getElementById('home5'));
                let option={
                    
                    tooltip: {
                        trigger: 'item'
                    },
                    series: [
                        {
                            color: ['#728082','#8cabb5'],
                            left:'5%',
                            name: 'CPU占用',
                            type: 'pie',
                            radius: ['70%', '90%'],
                            avoidLabelOverlap: false,
                            itemStyle: {
                                borderColor: 'white',
                                borderWidth: 2
                            },
                            label: {
                                formatter: '{d}%',
                                show: true,
                                position: 'center',
                                fontSize:'14',
                                color:'white'
                            },
                            labelLine: {
                                show: false,
                            },
                            data: [{
                                value:Data, 
                                name: '已使用',
                                label: {
                                    show: true,
                                },
                            },
                            {   
                                value:1-Data, 
                                name: '未使用',
                                label: {
                                    show: false,
                                },
                            },
                        ]
                        }
                    ]
                };
                
                myChart.setOption(option,true);
                //图表自适应屏幕
                window.addEventListener("resize", function() {
                    console.log("图片自适应")
                    myChart.resize();
                });
            })(this.props.cpu);
        }

        else if(this.props.pieId==='home6'){
            (function (Data){
                // Data.toFixed(1);
                let myChart=echarts.init(document.getElementById('home6'));
                let option={
                    tooltip: {
                        trigger: 'item'
                    },
                    series: [
                        {
                            color: ['#728082','#8cabb5'],
                            left:'5%',
                            name: '内存占用',
                            type: 'pie',
                            radius: ['70%', '90%'],
                            avoidLabelOverlap: false,
                            itemStyle: {
                                borderColor: 'white',
                                borderWidth: 2
                            },
                            label: {
                                formatter: '{d}%',
                                show: true,
                                position: 'center',
                                fontSize:'14',
                                color:'white'
                            },
                            labelLine: {
                                show: false,
                            },
                            data: [{
                                value:Data, 
                                name: '已使用',
                                label: {
                                    show: true,
                                },
                            },
                            {   
                                value:1-Data, 
                                name: '未使用',
                                label: {
                                    show: false,
                                },
                            },
                        ]
                        }
                    ]
                };
                
                myChart.setOption(option,true);
                //图表自适应屏幕
                window.addEventListener("resize", function() {
                    console.log("图片自适应")
                    myChart.resize();
                });
            })(this.props.data);

        }
    }

    componentDidMount() {
        this.initPieEcharts();
    }
    // componentWillUnmount(){
    //     // 去除eventlistener

    //     window.removeEventListener("resize", function() {
    //         console.log("图片自适应")
    //         myChart.resize();
    //     })
    //     console.log("卸载图表")
    // }

    render() {
        return (
            <div id={this.props.pieId} style={{height:"110px",width:"100%"}}></div>
        ); 
    }
    componentDidUpdate(){
        this.initPieEcharts();
    }
}