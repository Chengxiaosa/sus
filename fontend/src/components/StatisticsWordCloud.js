import React, {Component} from 'react';
import * as echarts from 'echarts';
import 'echarts-wordcloud'


class StatisticsWordCloud extends Component {
    echartsfunction(){
        if(this.props.id==="wordCloud1"){
            (function (Data){
                let showData= [];
                for(let i in Data){
                    showData.push({
                        name:Data[i].tld,
                        value: Data[i].number
                    })
                };
                let option={
                    series: [{
                        type: 'wordCloud',
                        data: showData,
                        gridSize: 8,
                        sizeRange: [15, 60],
                        rotationRange: [0,0],
                        textStyle: {
                            normal: {
                                color : function() {
                                    return 'rgb('
                                        + [ Math.round(Math.random() * 160),
                                            Math.round(Math.random() * 160),
                                            Math.round(Math.random() * 160) ]
                                            .join(',') + ')';
                                }
                            },
                            emphasis: {
                                shadowBlur: 10,
                                shadowColor: '#bfbfbf'
                            }
                        },
                        drawOutOfBound: false,
                        width: '85%',
                    }]
                };
                let myChart=echarts.init(document.getElementById('wordCloud1'));
                myChart.setOption(option,true,true);
                window.addEventListener("resize", function () {
                    myChart.resize();
                });
            })(this.props.data);
        }
        else if(this.props.id==="wordCloud2"){
            (function (Data){
                let showData= [];
                for(let i in Data){
                    showData.push({
                        name:Data[i].tld,
                        value: Data[i].number
                    })
                };
                let option={
                    series: [{
                        type: 'wordCloud',
                        data: showData,
                        gridSize: 6,
                        sizeRange: [12, 50],
                        rotationRange: [0,0],
                        textStyle: {
                            normal: {
                                color : function() {
                                    return 'rgb('
                                        + [ Math.round(Math.random() * 160),
                                            Math.round(Math.random() * 160),
                                            Math.round(Math.random() * 160) ]
                                            .join(',') + ')';
                                }
                            },
                            emphasis: {
                                shadowBlur: 10,
                                shadowColor: '#bfbfbf'
                            }
                        },
                        drawOutOfBound: false,
                        top: '5%',
                        bottom:"5%",
                        width: '85%',
                    }]
                };
                let myChart=echarts.init(document.getElementById('wordCloud2'));
                myChart.setOption(option,true,true);
                window.addEventListener("resize", function () {
                    myChart.resize();
                });
            })(this.props.data);
        }
    }

    componentDidMount() {
      this.echartsfunction();

    }
    componentDidUpdate() {
        this.echartsfunction();
    }

    render() {
        return (
            <div/>
        );
    }
}

export default StatisticsWordCloud;