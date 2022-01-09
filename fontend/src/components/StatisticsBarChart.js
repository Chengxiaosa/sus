import React, { Component } from 'react';
import * as echarts from 'echarts';
import { withTheme } from '@material-ui/core';
class StatisticsBarChart extends Component {
    Barchartsfunction() {
        if (this.props.ExecuteId === "bar1") {
            (function (Data) {
                //图表展示的相应数据
                let IP = [];
                let AS = [];
                for (let i in Data) {
                    let asName = Data[i].asName.length > 10 ?
                        Data[i].asName.substr(0, 10) : Data[i].asName;
                    AS.push({
                        value: asName,
                        textStyle: {
                            fontSize: 13,
                            color: 'white',
                            align: 'center'
                        }
                    });
                    IP.push(Data[i].ipNum);
                }
                console.log("dataAs")
                console.log(AS)
                //指定配置项和数据(option)
                let option = {
                    title: {
                        subtext: "AS",
                        left: "35%",
                        top: '2%',
                        subtextStyle: {
                            fontSize: 16,
                            color: 'white',
                            fontStyle: 'normal'
                        },
                    },
                    color: ['#6997AF', '#91cc75', '#fac858',
                        '#ee6666', '#73c0de', '#3ba272',
                        '#fc8452', '#9a60b4', '#ea7ccc'],
// 提示框
                    tooltip: {
                        // 坐标轴触发
                        trigger: 'axis',
                        axisPointer: {
                            type: 'shadow'
                        },
                    },
                    grid: {
                        left: '40%',
                        right: '0%',
                        top: '15%',
                        bottom: '-9%',
                        containLabel: true
                    },
                    xAxis: {
                        show: false,
                    },
                    yAxis:[{
                        type: 'category',
                        name: 'IP数',
                        nameLocation: 'start',
                        nameTextStyle: {
                            color: 'white',
                            fontSize: 16,
                            align: 'left',
                        },
                        data: AS,
                        axisLine: {
                            show: false
                        },
                        axisTick: {
                            show: false
                        },
                        axisLabel: {
                            show: true,
                        },
                        inverse: true,
                        offset: '70',
    

                    },
                    {
                        type:"category",
                        name:'排名',
                        show:'true',
                        data: [{"value":"1"},{"value":"2"}],
                        position:"left",
                        nameTextStyle: {
                            color: 'white',
                            fontSize: 16,
                            align: 'left',
                        },
                        offset:"120",
                        nameLocation:"end"
                    }],
                   
                    series: [
                        {
                            name: 'IP',
                            type: 'bar',
                            data: IP,
                            barWidth: 10,
                            barCategoryGap: '10%',
                            label: {
                                show: true,
                                position: 'inside'
                            },
                        }

                    ],

                };

                // document.getElementById('bar1').removeAttribute('_echarts_instance_');
                //初始化echarts实例对象
                let myChart = echarts.init(document.getElementById('bar1'));
                // document.getElementById('bar1').setAttribute('_echarts_instance_','');
                // console.log(myChart1)

                myChart.setOption(option, true);
                //图表自适应屏幕
                window.addEventListener("resize", function () {
                    myChart.resize();
                });
            })(this.props.data);
        }
        else if (this.props.ExecuteId === "bar2") {
            (function (Data) {
                let Domain = Data.map((item) => {
                    return item.domainNum;
                })
                let option = {
                    title: {
                        subtext: "域名数",
                        left: "35%",
                        top: '2%',
                        subtextStyle: {
                            fontSize: 16,
                            color: 'white',
                            fontStyle: 'normal'
                        },
                    },
                    color: ['#6997AF', '#91cc75', '#fac858',
                        '#ee6666', '#73c0de', '#3ba272',
                        '#fc8452', '#9a60b4', '#ea7ccc'],
                    tooltip: {
                        trigger: 'axis',
                        axisPointer: {
                            type: 'shadow'
                        },
                    },
                    grid: {
                        left: '30%',
                        right: '0%',
                        top: '15%',
                        bottom: '-9%',
                        containLabel: true
                    },
                    xAxis: {
                        show: false
                    },
                    yAxis: {
                        type: 'category',
                        offset: '10',
                        axisLine: {
                            show: false
                        },
                        axisTick: {
                            show: false
                        },
                        label: {
                            show: true,
                        },
                        inverse: true,
                    },
                    series: [
                        {
                            name: 'Domain',
                            type: 'bar',
                            data: Domain,
                            barWidth: 10,
                            barCategoryGap: '10%',
                            label: {
                                show: true,
                                position: 'inside'
                            }
                        }

                    ]
                };

                document.getElementById('bar2').removeAttribute('_echarts_instance_');
                let myChart = echarts.init(document.getElementById('bar2'));
                myChart.setOption(option, true);
                window.addEventListener("resize", function () {
                    myChart.resize();
                });
            })(this.props.data);
        }
        else if (this.props.ExecuteId === "bar3") {
            (function (Data) {
                let CityIP = Data.map((item) => {
                    return item.ipNum;
                })

                let City = [];
                for (let i in Data) {
                    if(Data[i].city==="台湾台北"){
                        Data[i].city = "中国台湾台北";
                    }
                    if(Data[i].city==="广东深圳"){
                        Data[i].city = "中国广东深圳";
                    }
                    City.push({
                        value: Data[i].city,
                        textStyle: {
                            fontSize: 15,
                            color: 'white',
                            align: 'center'
                        }
                    })
                }

                let option = {
                    title: {
                        subtext: "城市",
                        left: "22%",
                        top: '2%',
                        subtextStyle: {
                            fontSize: 16,
                            color: 'white',
                            fontStyle: 'normal'
                        },
                    },
                    color: ['#6997AF', '#91cc75', '#fac858',
                        '#ee6666', '#73c0de', '#3ba272',
                        '#fc8452', '#9a60b4', '#ea7ccc'],
                    tooltip: {
                        trigger: 'axis',
                        axisPointer: {
                            type: 'shadow'
                        },
                    },
                    grid: {
                        left: '25%',
                        right: '0%',
                        top: '14.5%',
                        bottom: '-8%',
                        containLabel: true
                    },
                    xAxis: {
                        show: false
                    },
                    yAxis: {
                        offset: '70',
                        type: 'category',
                        name: 'IP数',
                        nameLocation: 'start',
                        nameTextStyle: {
                            color: 'white',
                            fontSize: 16,
                            align: 'left',
                        },
                        data: City,
                        axisLine: {
                            show: false
                        },
                        axisTick: {
                            show: false
                        },
                        label: {
                            show: true,
                        },
                        inverse: true,
                    },
                    series: [
                        {
                            name: 'CityIP',
                            type: 'bar',
                            data: CityIP,
                            barWidth: 10,
                            barCategoryGap: '9%',
                            label: {
                                show: true,
                                position: 'inside'
                            }
                        }

                    ]
                };
                // document.getElementById('bar3').removeAttribute('_echarts_instance_');
                let myChart = echarts.init(document.getElementById('bar3'));
                myChart.setOption(option, true);
                window.addEventListener("resize", function () {
                    myChart.resize();
                });
            })(this.props.data);
        }
        else if (this.props.ExecuteId === "bar4") {
            (function (Data) {
                //图表展示的相应数据
                let IP = [];
                let AS = [];

                for (let i in Data) {
                    AS.push({
                        value: Data[i].asName,
                        textStyle: {
                            fontSize: 13,
                            color: 'white',
                            align: 'center'
                        }
                    });
                    IP.push(Data[i].ipNum);
                }

                //指定配置项和数据(option)
                let option = {
                    title: {
                        subtext: "AS",
                        left: "35%",
                        top: '2%',
                        subtextStyle: {
                            fontSize: 16,
                            color: 'white',
                            fontStyle: 'normal'
                        },
                    },
                    color: ['#6997AF', '#91cc75', '#fac858',
                        '#ee6666', '#73c0de', '#3ba272',
                        '#fc8452', '#9a60b4', '#ea7ccc'],

                    tooltip: {
                        trigger: 'axis',
                        axisPointer: {
                            type: 'shadow'
                        },
                    },
                    grid: {
                        left: '40%',
                        right: '0%',
                        top: '15%',
                        bottom: '-9%',
                        containLabel: true
                    },
                    xAxis: {
                        show: false,
                    },
                    yAxis: {
                        type: 'category',
                        name: 'IP数',
                        nameLocation: 'start',
                        nameTextStyle: {
                            color: 'white',
                            fontSize: 16,
                            align: 'left',
                        },
                        data: AS,
                        axisLine: {
                            show: false
                        },
                        axisTick: {
                            show: false
                        },
                        axisLabel: {
                            show: true,
                        },
                        inverse: true,
                        offset: '70',

                    },
                    series: [
                        {
                            name: 'IP',
                            type: 'bar',
                            data: IP,
                            barWidth: 10,
                            barCategoryGap: '10%',
                            label: {
                                show: true,
                                position: 'inside'
                            },
                        }

                    ],

                };


                let myChart = echarts.init(document.getElementById('bar4'));
                myChart.setOption(option, true);
                //图表自适应屏幕
                window.addEventListener("resize", function () {
                    myChart.resize();
                });
            })(this.props.data);
        }
        else if (this.props.ExecuteId === "bar5") {
            (function (Data) {
                let Domain = Data.map((item) => {
                    return item.domainNum;
                })
                let option = {
                    title: {
                        subtext: "域名数",
                        left: "35%",
                        top: '2%',
                        subtextStyle: {
                            fontSize: 16,
                            color: 'white',
                            fontStyle: 'normal'
                        },
                    },
                    color: ['#6997AF', '#91cc75', '#fac858',
                        '#ee6666', '#73c0de', '#3ba272',
                        '#fc8452', '#9a60b4', '#ea7ccc'],
                    tooltip: {
                        trigger: 'axis',
                        axisPointer: {
                            type: 'shadow'
                        },
                    },
                    grid: {
                        left: '30%',
                        right: '0%',
                        top: '15%',
                        bottom: '-9%',
                        containLabel: true
                    },
                    xAxis: {
                        show: false
                    },
                    yAxis: {
                        type: 'category',
                        offset: '10',
                        axisLine: {
                            show: false
                        },
                        axisTick: {
                            show: false
                        },
                        label: {
                            show: true,
                        },
                        inverse: true,
                    },
                    series: [
                        {
                            name: 'Domain',
                            type: 'bar',
                            data: Domain,
                            barWidth: 10,
                            barCategoryGap: '10%',
                            label: {
                                show: true,
                                position: 'inside'
                            }
                        }

                    ]
                };

                document.getElementById('bar5').removeAttribute('_echarts_instance_');
                let myChart = echarts.init(document.getElementById('bar5'));
                myChart.setOption(option, true);
                window.addEventListener("resize", function () {
                    myChart.resize();
                });
            })(this.props.data);
        }
        else if (this.props.ExecuteId === "bar6") {
            (function (Data) {
                let CityIP = Data.map((item) => {
                    return item.ipNum;
                })
                let City = [];
                for (let i in Data) {
                    City.push({
                        value: Data[i].city,
                        textStyle: {
                            fontSize: 15,
                            color: 'white',
                            align: 'center'
                        }
                    })
                }

                let option = {
                    title: {
                        subtext: "城市",
                        left: "22%",
                        top: '2%',
                        subtextStyle: {
                            fontSize: 16,
                            color: 'white',
                            fontStyle: 'normal'
                        },
                    },
                    color: ['#6997AF', '#91cc75', '#fac858',
                        '#ee6666', '#73c0de', '#3ba272',
                        '#fc8452', '#9a60b4', '#ea7ccc'],
                    tooltip: {
                        trigger: 'axis',
                        axisPointer: {
                            type: 'shadow'
                        },
                    },
                    grid: {
                        left: '35%',
                        right: '10%',
                        top: '14.5%',
                        bottom: '-8%',
                        containLabel: true
                    },
                    xAxis: {
                        show: false
                    },
                    yAxis: {
                        offset: '70',
                        type: 'category',
                        name: 'IP数',
                        nameLocation: 'start',
                        nameTextStyle: {
                            color: 'white',
                            fontSize: 16,
                            align: 'left',
                        },
                        data: City,
                        axisLine: {
                            show: false
                        },
                        axisTick: {
                            show: false
                        },
                        label: {
                            show: true,
                        },
                        inverse: true,
                    },
                    series: [
                        {
                            name: 'CityIP',
                            type: 'bar',
                            data: CityIP,
                            barWidth: 10,
                            barCategoryGap: '10%',
                            label: {
                                show: true,
                                position: 'inside'
                            }
                        }

                    ]
                };
                let myChart = echarts.init(document.getElementById('bar6'));
                myChart.setOption(option, true);
                window.addEventListener("resize", function () {
                    myChart.resize();
                });
            })(this.props.data);
        }
    }



    componentDidMount() {
        this.Barchartsfunction();
    }
    componentDidUpdate() {
        this.Barchartsfunction();
    }

    render() {
        return (
            <div />
        );
    }
}

export default StatisticsBarChart;