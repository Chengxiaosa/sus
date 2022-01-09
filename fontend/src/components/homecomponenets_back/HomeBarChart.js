import React, {Component} from 'react';
import * as echarts from 'echarts';

export default class HomeBarChart extends Component {
    homebarchart(){
        //顶级域名分布
        if(this.props.barId==="home1"){
            (function (Data) {

                //图表展示的相应数据
                let TLDNum=Data.map((item)=>{
                    return item.domainNum;
                })

                let TLD=[];
                for(let i in Data){
                    TLD.push({
                        value:Data[i].domain,
                        textStyle: {
                            fontSize: 13,
                            color: 'white',
                            align:'center',
                        }
                    })
                }

                //初始化echarts实例对象
                let myChart=echarts.init(document.getElementById('home1'));
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
                        left: '35%',
                        right: '5%',
                        top:  '0%',
                        bottom:'0%',
                        containLabel:true
                    },
                    xAxis: {
                        show:false
                    },
                    yAxis: {
                        type: 'category',
                        data:TLD,
                        axisLine:{
                            show:false
                        },
                        axisTick:{
                            show:false
                        },
                        label:{
                            show:true,
                        },
                        inverse:true,
                        offset:85,
                        // name:"顶级域名",
                        // nameLocation:'start',
                        // nameTextStyle:{
                        //     color:'white',
                        // }
                    },
                    series: [
                        {
                            name: 'TLDNum',
                            type: 'bar',
                            data: TLDNum,
                            barWidth:10,
                            color:'#6997AF',
                            label:{
                                show:true,
                                position:'inside'
                            }
                        }
                    ]
                };
                myChart.setOption(option,true);

                //图表自适应屏幕
                window.addEventListener("resize", function() {
                    myChart.resize();
                });
                })(this.props.data);
            }

        //IP所在城市
        else if(this.props.barId==="home2"){
            (function (Data) {
                //图表展示的相应数据
                let IPNum=Data.map((item)=>{
                    return item.ipNum;
                })

                let City=[];
                for(let i in Data){
                    City.push({
                        value:Data[i].city,
                        textStyle: {
                            fontSize: 13,
                            color: 'white',
                            align:'center',
                        }
                    })
                }

                
                //初始化echarts实例对象
                let myChart=echarts.init(document.getElementById('home2'));
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
                        left: '20%',
                        right: '5%',
                        top:  '0%',
                        bottom:'0%',
                        containLabel:true
                    },
                    xAxis: {
                        show:false
                    },
                    yAxis: {
                        type: 'category',
                        data:City,
                        axisLine:{
                            show:false
                        },
                        axisTick:{
                            show:false
                        },
                        label:{
                            show:true,
                        },
                        inverse:true,
                        offset:65,
                    },
                    series: [
                        {
                            name: 'IPNum',
                            type: 'bar',
                            data: IPNum,
                            barWidth:10,
                            color:'#6997AF',
                            label:{
                                show:true,
                                position:'inside'
                            }
                        }
                    ]
                };
                myChart.setOption(option,true);

                //图表自适应屏幕
                window.addEventListener("resize", function() {
                    myChart.resize();
                });
            })(this.props.data);
        }

        //支付渠道
        else if(this.props.barId==="home3"){
            (function (Data) {
                //图表展示的相应数据
                let PayNum=Data.map((item)=>{
                    return item.number;
                })

                let PayChannel=[];
                for(let i in Data){
                    PayChannel.push({
                        value:Data[i].channel,
                        textStyle: {
                            fontSize: 13,
                            fontWeight:'lighter',
                        }
                    })
                }

                // let PayChannel=Data.map((item)=>{
                //     return item.channel;
                // })
                //初始化echarts实例对象
                let myChart=echarts.init(document.getElementById('home3'));
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
                        left: '10%',
                        right: '10%',
                        top:  '15%',
                        bottom:'0%',
                        containLabel:true
                    },
                    xAxis: {
                        data:PayChannel,
                        type:'category',
                        axisLabel:{interval:0,rotate:40},
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
                    series: [
                        {
                            name: 'PayNum',
                            type: 'bar',
                            data: PayNum,
                            barWidth:10,
                            color:'#6997AF',
                            label:{
                                show:true,
                                position:'inside'
                            }
                        }
                    ]
                };
                myChart.setOption(option,true);

                //图表自适应屏幕
                window.addEventListener("resize", function() {
                    myChart.resize();
                });
            })(this.props.data);
        }

        else if(this.props.barId==="home_as"){
            (function (Data) {

                //图表展示的相应数据
                let ASNum = [];
                let AS=[];
                for(let i=0; i<5; i++){
                    AS.push({
                        value:Data[i].asName,
                        textStyle: {
                            fontSize: 13,
                            color: 'white',
                            align:'center',
                        }
                    });
                    ASNum.push(Data[i].domainNum);
                }

                //初始化echarts实例对象
                let myChart=echarts.init(document.getElementById('home_as'));
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
                        left: '15%',
                        right: '5%',
                        top:  '0%',
                        bottom:'0%',
                        containLabel:true
                    },
                    xAxis: {
                        show:false
                    },
                    yAxis: {
                        type: 'category',
                        data:AS,
                        axisLine:{
                            show:false
                        },
                        axisTick:{
                            show:false
                        },
                        label:{
                            show:true,
                        },
                        inverse:true,
                        offset:70,
                    },
                    series: [
                        {
                            name: 'ASNum',
                            type: 'bar',
                            data: ASNum,
                            barWidth:10,
                            color:'#6997AF',
                            label:{
                                show:true,
                                position:'inside'
                            }
                        }
                    ]
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
        this.homebarchart();
    }

    componentWillReceiveProps() {
        this.homebarchart();
    }

    render() {
        return (
            <div/>
        );
    }
}
        