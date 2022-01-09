import React, { Component } from 'react';
import * as echarts from "echarts";

class DailyFindingPieChart extends Component {
    PieChartFunction() {
        if (this.props.pieId === "daily pie1") {
            (function (Data) {
                Data.toFixed(1);
                let option = {
                    tooltip: {
                        trigger: 'item'
                    },
                    series: [
                        {
                            color: ['#8cabb5', '#728082'],
                            left: '5%',
                            name: 'CPU占用',
                            type: 'pie',
                            radius: ['75%', '95%'],
                            avoidLabelOverlap: false,
                            itemStyle: {
                                borderColor: 'white',
                                borderWidth: 2
                            },
                            label: {
                                formatter: '{d}%',
                                show: true,
                                position: 'center',
                                color: 'white',
                                fontSize: '13',
                            },
                            labelLine: {
                                show: false,
                            },
                            data: [{
                                value: Data,
                                name: '已使用',
                                label: {
                                    show: true,
                                },
                            },
                            {
                                value: 1 - Data, name: '未使用',
                                label: {
                                    show: false,
                                },
                            },
                            ]
                        }
                    ]
                };
                let myChart = echarts.init(document.getElementById('daily pie1'));
                myChart.setOption(option, true);
                //图表自适应屏幕
                window.addEventListener("resize", function () {
                    myChart.resize();
                });
            })(this.props.data);
        }
        else if (this.props.pieId === "daily pie2") {
            (function (Data) {
                Data.toFixed(1);
                let option = {
                    tooltip: {
                        trigger: 'item'
                    },
                    series: [
                        {
                            color: ['#8cabb5', '#728082'],
                            left: '5%',
                            name: 'CPU占用',
                            type: 'pie',
                            radius: ['75%', '95%'],
                            avoidLabelOverlap: false,
                            itemStyle: {
                                borderColor: 'white',
                                borderWidth: 2
                            },
                            label: {
                                formatter: '{d}%',
                                show: true,
                                position: 'center',
                                color: 'white',
                                fontSize: '13',
                            },
                            labelLine: {
                                show: false,
                            },
                            data: [{
                                value: Data,
                                name: '已使用',
                                label: {
                                    show: true,
                                },
                            },
                            {
                                value: 1 - Data, name: '未使用',
                                label: {
                                    show: false,
                                },
                            },
                            ]
                        }
                    ]
                };
                let myChart = echarts.init(document.getElementById('daily pie2'));
                myChart.setOption(option, true);
                //图表自适应屏幕
                window.addEventListener("resize", function () {
                    myChart.resize();
                });
            })(this.props.data);
        }
        else if (this.props.pieId === "daily pie3") {
            (function (Data) {
                Data.toFixed(1);
                let option = {
                    tooltip: {
                        trigger: 'item'
                    },
                    series: [
                        {
                            color: ['#8cabb5', '#728082'],
                            left: '5%',
                            name: 'CPU占用',
                            type: 'pie',
                            radius: ['75%', '95%'],
                            avoidLabelOverlap: false,
                            itemStyle: {
                                borderColor: 'white',
                                borderWidth: 2
                            },
                            label: {
                                formatter: '{d}%',
                                show: true,
                                position: 'center',
                                color: 'white',
                                fontSize: '13',
                            },
                            labelLine: {
                                show: false,
                            },
                            data: [{
                                value: Data,
                                name: '已使用',
                                label: {
                                    show: true,
                                },
                            },
                            {
                                value: 1 - Data, name: '未使用',
                                label: {
                                    show: false,
                                },
                            },
                            ]
                        }
                    ]
                };
                let myChart = echarts.init(document.getElementById('daily pie3'));
                myChart.setOption(option, true);
                //图表自适应屏幕
                window.addEventListener("resize", function () {
                    myChart.resize();
                });
            })(this.props.data);
        }
    }


    componentDidMount() {
        this.PieChartFunction();
    }
    componentDidUpdate() {
        this.PieChartFunction();
    }

    render() {
        return (
            <div />
        );
    }
}

export default DailyFindingPieChart;