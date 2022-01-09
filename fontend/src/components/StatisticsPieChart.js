import React, { Component } from 'react';
import * as echarts from "echarts";


class StatisticsPieChart extends Component {
    piechartsfunction() {
        if (this.props.pieId === 'pie chart1') {
            (function (asIndustry) {
                let data = [];
                for (let i in asIndustry) {
                    data.push({
                        value: asIndustry[i].number,
                        name: asIndustry[i].industry
                    })
                }
                let option = {
                    color: ['#5470c6', '#91cc75', '#fac858',
                        '#ee6666', '#73c0de', '#3ba272',
                        '#fc8452', '#9a60b4', '#ea7ccc'],
                    tooltip: {
                        trigger: 'item'
                    },
                    legend: {
                        color: ['#5470c6', '#91cc75', '#fac858'],
                        top: '30%',
                        left: '8%',
                        orient: 'vertical',
                        textStyle: {
                            color: '#8ef0f8',
                            fontSize: '12'
                        },
                    },
                    series: [
                        {
                            left: '10%',
                            name: '自治系统涉及的行业类型',
                            type: 'pie',
                            radius: ['30%', '50%'],
                            itemStyle: {
                                borderColor: '#fff',
                                borderWidth: 2
                            },
                            label: {
                                formatter: '{d}%',
                                show: true,
                                position: 'outside',
                                fontSize: '14',
                                color: '#8ef0f8'
                            },
                            emphasis: {
                                label: {
                                    show: true,
                                    fontSize: '16',
                                    fontWeight: 'bold',
                                }
                            },
                            labelLine: {
                                show: true,
                                length: '5',
                                length2: '3',
                                color: '#8ef0f8'
                            },
                            data: data,

                        }
                    ]
                };
                let myChart = echarts.init(document.getElementById('pie chart1'));
                myChart.setOption(option, true);
                //图表自适应屏幕
                window.addEventListener("resize", function () {
                    myChart.resize();
                });
            })(this.props.data);

        }
        else if (this.props.pieId === "pie chart2") {
            (function (domainAtRegistrars) {
                let data = [];
                for (let i in domainAtRegistrars) {
                    let registrar = domainAtRegistrars[i].registrar.length > 10 ? 
                    domainAtRegistrars[i].registrar.substr(0, 10) : domainAtRegistrars[i].registrar;
                    data.push({
                        value: domainAtRegistrars[i].number,
                        name: registrar
                    })
                };
                let option = {
                    color: ['#5470c6', '#91cc75', '#fac858',
                        '#ee6666', '#73c0de', '#3ba272',
                        '#fc8452', '#9a60b4', '#ea7ccc'],
                    tooltip: {
                        trigger: 'item'
                    },
                    series: [
                        {
                            name: '注册商涉及的域名数',
                            type: 'pie',
                            radius: '65%',
                            data: data,
                            avoidLabelOverlap:true,
                            label: {
                                show: true,
                                position: 'outside',
                                formatter: '{b}\n{d}%',
                                color: '#8ef0f8',
                                overflow: 'break',
                                fontSize: '14'
                            },
                            labelLine: {
                                length: '8',
                                length2: '4'
                            },
                            emphasis: {
                                itemStyle: {
                                    shadowBlur: 10,
                                    shadowOffsetX: 0,
                                    shadowColor: 'rgba(0, 0, 0, 0.5)'
                                }
                            },
                            top: '15%',
                            left: '0%',

                        }
                    ]
                };

                let myChart = echarts.init(document.getElementById('pie chart2'));
                myChart.setOption(option, true);
                //图表自适应屏幕
                window.addEventListener("resize", function () {
                    myChart.resize();
                });
            })(this.props.data);
        }
        else if (this.props.pieId === 'pie chart3') {
            (function (asIndustry) {
                let data = [];
                for (let i in asIndustry) {
                    data.push({
                        value: asIndustry[i].number,
                        name: asIndustry[i].industry
                    })
                }
                let option = {
                    color: ['#5470c6', '#91cc75', '#fac858',
                        '#ee6666', '#73c0de', '#3ba272',
                        '#fc8452', '#9a60b4', '#ea7ccc'],
                    tooltip: {
                        trigger: 'item'
                    },
                    legend: {
                        color: ['#5470c6', '#91cc75', '#fac858'],
                        top: '30%',
                        left: '8%',
                        orient: 'vertical',
                        textStyle: {
                            color: '#8ef0f8',
                            fontSize: '12'
                        },
                    },
                    series: [
                        {
                            left: '10%',
                            name: '自治系统涉及的行业类型',
                            type: 'pie',
                            radius: ['30%', '50%'],
                            avoidLabelOverlap: false,
                            itemStyle: {
                                borderColor: '#fff',
                                borderWidth: 2
                            },
                            label: {
                                formatter: '{c}, {d}%',
                                show: true,
                                position: 'outside',
                                fontSize: '14',
                                color: '#8ef0f8'
                            },
                            emphasis: {
                                label: {
                                    show: true,
                                    fontSize: '16',
                                    fontWeight: 'bold',
                                }
                            },
                            labelLine: {
                                show: true,
                                length: '5',
                                length2: '3',
                                color: '#8ef0f8'
                            },
                            data: data
                        }
                    ]
                };
                let myChart = echarts.init(document.getElementById('pie chart3'));
                myChart.setOption(option, true);
                //图表自适应屏幕
                window.addEventListener("resize", function () {
                    myChart.resize();
                });
            })(this.props.data);

        }
        else if (this.props.pieId === "pie chart4") {
            (function (domainAtRegistrars) {
                let data = [];
                for (let i in domainAtRegistrars) {
                    data.push({
                        value: domainAtRegistrars[i].number,
                        name: domainAtRegistrars[i].registrar
                    })
                };
                let option = {
                    color: ['#5470c6', '#91cc75', '#fac858',
                        '#ee6666', '#73c0de', '#3ba272',
                        '#fc8452', '#9a60b4', '#ea7ccc'],
                    tooltip: {
                        trigger: 'item'
                    },
                    series: [
                        {
                            name: '注册商涉及的域名数',
                            type: 'pie',
                            radius: '65%',
                            data: data,
                            label: {
                                show: true,
                                position: 'outside',
                                formatter: '{b}\n{c},{d}%',
                                color: '#8ef0f8',
                                overflow: 'break',
                                fontSize: '15'
                            },
                            labelLine: {
                                length: '10',
                                length2: '6'
                            },
                            emphasis: {
                                itemStyle: {
                                    shadowBlur: 10,
                                    shadowOffsetX: 0,
                                    shadowColor: 'rgba(0, 0, 0, 0.5)'
                                }
                            },
                            left: '0%',
                            top: '15%'
                        }
                    ]
                };

                let myChart = echarts.init(document.getElementById('pie chart4'));
                myChart.setOption(option, true);
                //图表自适应屏幕
                window.addEventListener("resize", function () {
                    myChart.resize();
                });
            })(this.props.data);
        }
        else if (this.props.pieId === 'pie chart5') {
            (function (info) {
                let data = [];
                for (let i in info) {
                    data.push({
                        value: info[i].number,
                        name: info[i].type
                    })
                }
                let option = {
                    color: ['#5470c6', '#91cc75', '#fac858',
                        '#ee6666', '#73c0de', '#3ba272',
                        '#fc8452', '#9a60b4', '#ea7ccc'],
                    tooltip: {
                        trigger: 'item'
                    },
                    legend: {
                        color: ['#5470c6', '#91cc75', '#fac858'],
                        top: '90%',
                        left: '8%',
                        orient: 'vertical',
                        textStyle: {
                            color: '#8ef0f8',
                            fontSize: '12'
                        },
                    },
                    series: [
                        {
                            left: '10%',
                            name: '筛选所得结果',
                            type: 'pie',
                            radius: ['30%', '50%'],
                            itemStyle: {
                                borderColor: '#fff',
                                borderWidth: 2
                            },
                            label: {
                                formatter: '{c}, {d}%',
                                show: true,
                                position: 'outside',
                                fontSize: '14',
                                color: '#8ef0f8'
                            },
                            emphasis: {
                                label: {
                                    show: true,
                                    fontSize: '16',
                                    fontWeight: 'bold',
                                }
                            },
                            labelLine: {
                                show: true,
                                length: '5',
                                length2: '3',
                                color: '#8ef0f8'
                            },
                            data: data,

                        }
                    ]
                };
                let myChart = echarts.init(document.getElementById('pie chart5'));
                myChart.setOption(option, true);
                //图表自适应屏幕
                window.addEventListener("resize", function () {
                    myChart.resize();
                });
            })(this.props.data);
        }
    }

    componentDidMount() {
        this.piechartsfunction();
    }
    componentDidUpdate() {
        this.piechartsfunction();
    }


    render() {
        return <div style={{ marginTop: "0px" }} />
    }
}

export default StatisticsPieChart;