import React, { Component } from 'react';
import $ from "jquery";
import * as echarts from "echarts";
class StatisticsMap extends Component {
    mapfunction() {
        console.log("mapId")
        console.log(this.props.mapId)
        if (this.props.mapId === "area1") {
            $(function (Data, Data2) {
                (function (Data, Data2) {
                    let ShowData = [];
                    console.log(Data);
                    for (let i in Data) {
                        if(Data[i].cityName==="广东深圳"){
                            Data[i].cityName="中国广东深圳";
                        }else if(Data[i].cityName==="台湾台北"){
                            Data[i].cityName="中国台湾台北";
                        }
                        ShowData.push({
                            name: Data[i].cityName,
                            value: Data[i].long < 340 ? [Data[i].long, Data[i].lat, Data[i].number, Data[i].cityName] : [Data[i].long - 360, Data[i].lat, Data[i].number, Data[i].cityName]
                        })
                    }

                    let CountryData = [];
                    for (let i in Data2) {
                        CountryData.push({
                            name: Data2[i].countryName,
                            value: Data2[i].number
                        })
                    }
                    // console.log(CountryData);
                    let Area = 'world';

                    var geoCoordMap = {
                        '美国': [264.287, 37.09],
                        '中国': [113.8953, 31.901],
                        '印度': [78.963, 20.594],
                        //todo: 目前用的是城市坐标（伦敦/里巴加湾）
                        '英国': [359.872-360, 51.507],
                        '文莱': [114.94, 4.903],
                        '新加坡': [103.51, 1.18]
                    };

                    var AMData = [
                        [{name:'美国'}, {name:'中国',value:95}]
                    ];

                    var YDData = [
                        [{name:'印度'}, {name:'中国',value:95}]
                    ];

                    var BRData = [
                        [{name:'英国'}, {name:'中国',value:95}]
                    ];

                    var SINData = [
                        [{name:'新加坡'}, {name:'中国',value:95}]
                    ];

                    var WLData = [
                        [{name:'文莱'}, {name:'中国',value:95}]
                    ];

                    var planePath = 'path://M1705.06,1318.313v-89.254l-319.9-221.799l0.073-208.063c0.521-84.662-26.629-121.796-63.961-121.491c-37.332-0.305-64.482,36.829-63.961,121.491l0.073,208.063l-319.9,221.799v89.254l330.343-157.288l12.238,241.308l-134.449,92.931l0.531,42.034l175.125-42.917l175.125,42.917l0.531-42.034l-134.449-92.931l12.238-241.308L1705.06,1318.313z';
                    // var planePath = 'path://M512 16C238 16 16 238 16 512s222 496 496 496 496-222 496-496S786 16 512 16z';
                    var convertData = function (data) {
                        var res = [];
                        for (var i = 0; i < data.length; i++) {
                            var dataItem = data[i];
                            var fromCoord = geoCoordMap[dataItem[0].name];
                            var toCoord = geoCoordMap[dataItem[1].name];
                            if (fromCoord && toCoord) {
                                res.push({
                                    fromName: dataItem[0].name,
                                    toName: dataItem[1].name,
                                    coords: [fromCoord, toCoord]
                                });
                            }
                        }
                        return res;
                    };

                    var color = ['#a6c84c', '#ffa022', '#46bee9'];
                    var series = [];
                    series.push(
                        {
                            name: '历史诈骗IP所属国家或地区',
                            type: 'map',
                            selectedMode: 'multiple',
                            aspectScale: 0.75,
                            left: '0%',
                            right: '-1%',
                            top: '15%',
                            bottom: '6%',
                            mapType: Area,
                            itemStyle: {
                                //地图默认显示颜色
                                areaColor: '#0ba7bd',
                                color: "#FED766"
                            },
                            label: {
                                show: false,
                                color: 'red'
                            },
                            tooltip: {
                                formatter: function (params) {
                                    // ip数排名
                                    if(params.name==="中国"){
                                        params.name="中国大陆";
                                    }
                                    console.log(Number.isNaN(params.value));
                                    if (Number.isNaN(params.value)) return "";
                                    let rank = params.dataIndex + 1;
                                    return params.name + " : " + params.value + " (第" + rank + "名)";
                                }
                            },
                            emphasis: {
                                itemStyle: {
                                    shadowBlur: 10,
                                    shadowOffsetX: 5,
                                    shadowOffsetY: 5,
                                    shadowColor: '#FED766',
                                },
                                label: {
                                    show: false
                                },
                                // color:"black"
                            },
                            data: CountryData,

                        },
                        {
                            name: '历史发现诈骗IP所属城市',
                            type: 'scatter',
                            coordinateSystem: 'geo',
                            label: {
                                show: true,
                                align: 'right',
                                shadowColor: 'transparent',
                                color: "#FED766",
                                formatter: '{b}',
                                backgroundColor: 'rgba(128,128,128,0.7)',
                                offset: [12, -5],
                                fontSize: 15
                            },
                            labelLayout: {
                                moveOverlap: true
                            },
                            tooltip: {
                                formatter: function (params) {
                                    return params.value[3] + ' : ' + params.value[2];
                                }
                            },
                            labelline: {
                                show: true,
                                showAbove: true
                            },
                            itemStyle: {
                                //散点图对应颜色
                                color: 'rgba(214,186,183,1)'
                            },
                            symbol: 'circle',
                            symbolSize: 16,
                            data: ShowData,
                        }
                    );

                    [['美国', AMData], ['印度', YDData], ['文莱', WLData], ['英国', BRData]].forEach(function (item, i) {
                        series.push({
                            name: item[0],
                            type: 'lines',
                            zlevel: 1,
                            silent: true,
                            effect: {
                                show: true,
                                period: 5,
                                trailLength: 0.7,
                                color: '#fff',
                                symbolSize: 6
                            },
                            lineStyle: {
                                normal: {
                                    color: color[i],
                                    width: 0,
                                    curveness: 0.2
                                }
                            },
                            data: convertData(item[1])
                        },
                            {
                                name: item[0],
                                type: 'lines',
                                zlevel: 2,
                                silent: true,
                                effect: {
                                },
                                lineStyle: {
                                    normal: {
                                        color: color[i],
                                        width: 3,
                                        opacity: 0.4,
                                        curveness: 0.2
                                    }
                                },
                                data: convertData(item[1])
                            },
                            {
                                name: item[0],
                                type: 'effectScatter',
                                coordinateSystem: 'geo',
                                zlevel: 2,
                                silent: true,
                                rippleEffect: {
                                    brushType: 'stroke'
                                },
                                label: {
                                    normal: {
                                        show: true,
                                        position: 'right',
                                        formatter: '{b}'
                                    }
                                },
                                symbolSize: function (val) {
                                    return val[2] / 8;
                                },
                                itemStyle: {
                                    normal: {
                                        color: color[i]
                                    }
                                },
                                data: item[1].map(function (dataItem) {
                                    return {
                                        name: "中国大陆",
                                        value: geoCoordMap[dataItem[1].name].concat([dataItem[1].value])
                                    };
                                })
                            });
                    });

                    $.get('./maps/' + Area + '.json', function (geoJson) {
                        //解决刷新时可能存在崩溃的问题
                        let mapDom = document.getElementById('area1');
                        if (!mapDom) return;
                        let map = echarts.init(document.getElementById('area1'));
                        echarts.registerMap('world', geoJson);
                        let option = {
                            color: ['#D4B40C', '#91cc75', '#fac858',
                                '#ee6666', '#73c0de', '#3ba272',
                                '#fc8452', '#9a60b4', '#ea7ccc'],
                            legend: {
                                left: '0%',
                                // top:'0%',
                                bottom: '0%',
                                orient: 'vertical',
                                textStyle: {
                                    color: '#fff',
                                    borderColor: '#008B8B'
                                },
                                data: ['历史诈骗IP所属国家或地区', '历史发现诈骗IP所属城市']
                            },

                            geo: {
                                map: Area,
                                aspectScale: 0.75,
                                left: '0%',
                                right: '-1%',
                                top: '15%',
                                bottom: '6%',
                                itemStyle: {
                                    normal: {
                                        areaColor: '#323c48',
                                        borderColor: '#111'
                                    },
                                    emphasis: {
                                        areaColor: '#2a333d'
                                    }
                                }
                            },
                            tooltip: {
                                trigger: "item",
                                z: 60,
                                zlevel: 0,
                                hideDelay: 100,
                                transitionDuration: 0.4,
                                backgroundColor: "#fff",
                                shadowColor: "rgba(0, 0, 0, .2)",
                                shadowOffsetX: 1,
                                shadowOffsetY: 2,
                                borderRadius: 4,
                                borderWidth: 1,
                                textStyle: {
                                    color: "#666",
                                    fontSize: 14
                                }
                            },
                            series: series
                        };

                        // map.setOption(option, true, true);

                        let app = {}
                        app.currentIndex = -1;

                        this.timerID =  setInterval(function () {
                            var dataLen = option.series[0].data.length;

                            // 取消之前高亮的图形
                            map.dispatchAction({
                                type: 'downplay',
                                seriesIndex: 0,
                                dataIndex: app.currentIndex
                            });
                            app.currentIndex = (app.currentIndex + 1) % dataLen;
                            // 高亮当前图形
                            map.dispatchAction({
                                type: 'highlight',
                                seriesIndex: 0,
                                dataIndex: app.currentIndex
                            });

                            // 显示 tooltip
                            map.dispatchAction({
                                type: 'showTip',
                                seriesIndex: 0,
                                dataIndex: app.currentIndex
                            });

                        }, 5000);
                        map.setOption(option, true, true);
                        window.addEventListener("resize", function () {
                            map.resize();
                        });
                    })
                })(Data, Data2);
            }(this.props.cityData, this.props.countryData));
        }
        else if (this.props.mapId === 'area2') {
            $(document).ready(function (Data, Data2) {
                (function (Data, Data2) {
                    let ShowData = [];
                    for (let i in Data) {
                        ShowData.push({
                            name: Data[i].cityName,
                            value: [Data[i].long, Data[i].lat, Data[i].number, Data[i].cityName]
                        })
                    }
                    let CountryData = [];
                    for (let i in Data2) {
                        CountryData.push({
                            name: Data2[i].countryName,
                            value: Data2[i].number
                        })
                    }
                    let area = 'china';
                    $.get('./maps/' + area + '.json', function (geoJson) {
                        let mapDom = document.getElementById('area2');
                        if (!mapDom) return;
                        let map = echarts.init(document.getElementById('area2'));
                        echarts.registerMap('china', geoJson);
                        let option = {
                            color: ['#5470c6', '#91cc75', '#fac858',
                                '#ee6666', '#73c0de', '#3ba272',
                                '#fc8452', '#9a60b4', '#ea7ccc'],
                            legend: {
                                left: 'left',
                                bottom: '0%',
                                orient: 'vertical',
                                textStyle: {
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
                                    dataView: { readOnly: false },
                                    restore: {},
                                    saveAsImage: {}
                                }
                            },
                            visualMap: {
                                min: 100,
                                max: 1000,
                                text: ['High', 'Low'],
                                realtime: false,
                                calculable: true,
                                inRange: {
                                    color: ['lightskyblue', 'yellow', 'orangered']
                                },
                                // bottom: '20%'
                                bottom: '5%',
                                left: '-2%'
                            },
                            geo: {
                                map: area,
                                itemStyle: {
                                    normal: {
                                        areaColor: '#323c48',
                                        borderColor: '#111'
                                    },
                                    emphasis: {
                                        areaColor: '#2a333d'
                                    }
                                }
                            },
                            tooltip: {
                                trigger: "item",
                                z: 60,
                                zlevel: 0,
                                hideDelay: 100,
                                transitionDuration: 0.4,
                                backgroundColor: "#fff",
                                shadowColor: "rgba(0, 0, 0, .2)",
                                shadowOffsetX: 1,
                                shadowOffsetY: 2,
                                borderRadius: 4,
                                borderWidth: 1,
                                textStyle: {
                                    color: "#666",
                                    fontSize: 14
                                }
                            },
                            series: [
                                {
                                    name: '历史诈骗IP所属省份',
                                    type: 'map',
                                    mapType: area,
                                    itemStyle: {
                                        areaColor: '#0ba7bd'
                                    },
                                    label: {
                                        show: false
                                    },
                                    tooltip: {
                                        formatter: function (params) {
                                            // ip数排名
                                            console.log(Number.isNaN(params.value));
                                            if (Number.isNaN(params.value)) return "";
                                            let rank = params.dataIndex + 1;
                                            return params.name + " : " + params.value;
                                        }
                                    },
                                    emphasis: {
                                        itemStyle: {
                                            shadowBlur: 10,
                                            shadowOffsetX: 5,
                                            shadowOffsetY: 5,
                                            shadowColor: 'rgba(0, 0, 0, 0.5)'
                                        },
                                        label: {
                                            show: false
                                        }
                                    },
                                    data: CountryData,
                                },
                                {
                                    name: '历史发现诈骗IP所属城市',
                                    type: 'scatter',
                                    coordinateSystem: 'geo',

                                    labelline: {
                                        show: true,
                                        showAbove: true
                                    },
                                    tooltip: {
                                        formatter: function (params) {
                                            return params.value[3] + ' : ' + params.value[2];
                                        }
                                    },
                                    itemStyle: {
                                        color: 'rgba(214,186,183,1)'
                                    },
                                    symbol: 'circle',
                                    symbolSize: 13,
                                    data: ShowData
                                }
                            ]
                        };
                        map.setOption(option, true, true);
                        window.addEventListener("resize", function () {
                            map.resize();
                        });
                    })
                })(Data, Data2);
            }(this.props.cityData, this.props.countryData));
        }
        else if (this.props.mapId === "area3") {
            // Data是历史发现诈骗IP所属城市
            // Data2是国家/地区
            // Data3是当日发现诈骗IP所属城市
            $(document).ready(function (Data, Data2, Data3) {
                (function (Data, Data2, Data3) {
                    let DailyCityData = [];
                    for (let i in Data3) {
                        if(Data3[i].cityName==="台湾台北"){
                            Data3[i].cityName="中国台湾台北";
                        }
                        DailyCityData.push({
                            name: Data3[i].cityName,
                            value: Data3[i].long < 340 ? [Data3[i].long, Data3[i].lat, Data3[i].number, Data3[i].cityName] : [Data3[i].long - 360, Data3[i].lat, Data3[i].number, Data3[i].cityName],
                        })
                    }
                    //判断当日与历史是否重复，重复则只显示当日
                    function isDuplicated(element, arr) {
                        // if(!arr.length||!element.length)    //空则不执行
                        //     return true;
                        for (let i in arr) {
                            if (element.cityName === arr[i].cityName)
                                return true;
                        }
                        return false;
                    }

                    let CityData = [];
                    for (let i in Data) {
                        if(Data[i].cityName==="台湾台北"){
                            Data[i].cityName="中国台湾台北";
                        }
                        if(Data[i].cityName==="广东深圳"){
                            Data[i].cityName="中国广东深圳";
                        }
                        // 城市不重叠的临时解决方案....
                        // 其他思路：通过经纬度判断城市之间的距离，若距离小于一定值，修改其position为left/right
                        if (!isDuplicated(Data[i], Data3) && (Data[i].cityName != '香港中西区') && (Data[i].cityName != '香港柴湾') && (Data[i].cityName != '香港长沙湾')) {
                            CityData.push({
                                name: Data[i].cityName,
                                value: Data[i].long < 340 ? [Data[i].long, Data[i].lat, Data[i].number, Data[i].cityName] : [Data[i].long - 360, Data[i].lat, Data[i].number, Data[i].cityName],
                            })
                        }
                    }

                    let CountryData = [];
                    for (let i in Data2) {
                        CountryData.push({
                            name: Data2[i].countryName,
                            value: Data2[i].number
                        })
                    }
                    let Area = 'world';


                    var geoCoordMap = {
                        '美国': [264.287, 37.09],
                        '中国': [113.8953, 31.901],
                        '印度': [78.963, 20.594],
                        //todo: 目前用的是城市坐标（伦敦/里巴加湾）
                        '英国': [359.872 - 360, 51.507],
                        '文莱': [114.94, 4.903],
                        '新加坡': [103.51, 1.18]
                    };

                    var AMData = [
                        [{ name: '美国' }, { name: '中国', value: 95 }]
                    ];

                    var YDData = [
                        [{ name: '印度' }, { name: '中国', value: 95 }]
                    ];

                    var BRData = [
                        [{ name: '英国' }, { name: '中国', value: 95 }]
                    ];

                    var SINData = [
                        [{ name: '新加坡' }, { name: '中国', value: 95 }]
                    ];

                    var WLData = [
                        [{ name: '文莱' }, { name: '中国', value: 95 }]
                    ];

                    var planePath = 'path://M1705.06,1318.313v-89.254l-319.9-221.799l0.073-208.063c0.521-84.662-26.629-121.796-63.961-121.491c-37.332-0.305-64.482,36.829-63.961,121.491l0.073,208.063l-319.9,221.799v89.254l330.343-157.288l12.238,241.308l-134.449,92.931l0.531,42.034l175.125-42.917l175.125,42.917l0.531-42.034l-134.449-92.931l12.238-241.308L1705.06,1318.313z';
                    // var planePath = 'path://M512 16C238 16 16 238 16 512s222 496 496 496 496-222 496-496S786 16 512 16z';
                    var convertData = function (data) {
                        var res = [];
                        for (var i = 0; i < data.length; i++) {
                            var dataItem = data[i];
                            var fromCoord = geoCoordMap[dataItem[0].name];
                            var toCoord = geoCoordMap[dataItem[1].name];
                            if (fromCoord && toCoord) {
                                res.push({
                                    fromName: dataItem[0].name,
                                    toName: dataItem[1].name,
                                    coords: [fromCoord, toCoord]
                                });
                            }
                        }
                        return res;
                    };

                    var color = ['#a6c84c', '#ffa022', '#46bee9'];
                    var series = [];

                    series.push({
                        name: '历史诈骗IP所属国家或地区',
                        type: 'map',
                        mapType: Area,
                        layoutCenter:['45%','55%'],
                        layoutSize:'180%',
                        hoverAnimation: true,
                        itemStyle: {
                            areaColor: '#0ba7bd',
                            color: '#FED766'
                        },
                        label: {
                            show: false
                        },
                        tooltip: {
                            formatter: function (params) {
                                // ip数排名
                                // console.log(Number.isNaN(params.value));
                                if(params.name==="中国"){
                                    params.name="中国大陆";
                                }
                                if (Number.isNaN(params.value)) return "";
                                let rank = params.dataIndex + 1;
                                return params.name + " : " + params.value + " (第" + rank + "名)";
                            }
                        },
                        selectMode: 'multiple',
                        emphasis: {
                            scale: true,
                            itemStyle: {
                                shadowBlur: 50,
                                shadowOffsetX: 0,
                                shadowOffsetY: 0,
                                shadowColor: '#FED766',
                                borderWidth: 2,
                                borderColor: '#FED766',
                                borderRadius: 5
                            },
                            label: {
                                show: false
                            }
                        },
                        data: CountryData,
                    },

                        {
                            name: '历史发现诈骗IP所属城市',
                            type: 'scatter',
                            coordinateSystem: 'geo',
                            label: {
                                show: true,
                                align: 'right',
                                shadowColor: 'transparent',
                                color: "#FED766",
                                formatter: '{b}',
                                backgroundColor: 'rgba(128,128,128,0.7)',
                                offset: [5, -5],
                                fontSize: 15
                            },
                            labelLayout: {
                                moveOverlap: true
                            },
                            tooltip: {
                                formatter: function (params) {
                                    return params.value[3] + ' : ' + params.value[2];
                                }
                            },
                            labelline: {
                                show: true,
                                showAbove: true
                            },
                            itemStyle: {
                                color: 'rgba(214,186,183,1)'
                            },
                            symbol: 'circle',
                            symbolSize: 16,
                            data: CityData,
                        },

                        {
                            name: '当日发现诈骗IP所属城市',
                            type: 'scatter',
                            coordinateSystem: 'geo',
                            label: {
                                show: true,
                                align: 'left',
                                color: "#FE4A49",
                                formatter: '{b}',
                                offset: [5, -5],
                                fontSize: 15
                            },
                            tooltip: {
                                formatter: function (params) {
                                    return params.value[3] + ' : ' + params.value[2];
                                }
                            },
                            itemStyle: {
                                color: '#FE4A49'
                            },
                            symbol: 'circle',
                            symbolSize: 16,
                            data: DailyCityData,
                        });


                    [['美国', AMData], ['印度', YDData], ['文莱', WLData], ['英国', BRData]].forEach(function (item, i) {
                        series.push({
                            name: item[0],
                            type: 'lines',
                            zlevel: 1,
                            silent: true,
                            effect: {
                                show: true,
                                period: 5,
                                trailLength: 0.7,
                                color: '#fff',
                                symbolSize: 6
                            },
                            lineStyle: {
                                normal: {
                                    color: color[i],
                                    width: 0,
                                    curveness: 0.2
                                }
                            },
                            data: convertData(item[1])
                        },
                            {
                                name: item[0],
                                type: 'lines',
                                zlevel: 2,
                                silent: true,
                                effect: {
                                },
                                lineStyle: {
                                    normal: {
                                        color: color[i],
                                        width: 3,
                                        opacity: 0.4,
                                        curveness: 0.2
                                    }
                                },
                                data: convertData(item[1])
                            },
                            {
                                name: item[0],
                                type: 'effectScatter',
                                coordinateSystem: 'geo',
                                zlevel: 2,
                                silent: true,
                                rippleEffect: {
                                    brushType: 'stroke'
                                },
                                label: {
                                    normal: {
                                        show: true,
                                        position: 'right',
                                        formatter: '{b}',
                                        fontSize:15,
                                        color:'#FED766'
                                    },
                                },
                                symbolSize: function (val) {
                                    return val[2] / 8;
                                },
                                itemStyle: {
                                    normal: {
                                        color: color[i]
                                    }
                                },
                                data: item[1].map(function (dataItem) {
                                    return {
                                        name: "中国大陆",
                                        value: geoCoordMap[dataItem[1].name].concat([dataItem[1].value])
                                    };
                                }),
                                
                            });
                    });


                    // 发送了一个get请求
                    $.get('./maps/' + Area + '.json', function (geoJson) {
                        let mapDom = document.getElementById('area3');
                        if (!mapDom) return;
                        let map = echarts.init(document.getElementById('area3'));
                        echarts.registerMap('world', geoJson);
                        let option = {
                            color: ['#D4B40C', '#91cc75', '#fac858',
                                '#ee6666', '#73c0de', '#3ba272',
                                '#fc8452', '#9a60b4', '#ea7ccc'],
                            legend: {
                                left: '80%',
                                bottom: '10%',
                                orient: 'vertical',
                                textStyle: {
                                    color: '#fff',
                                    borderColor: '#008B8B'
                                },
                                data: ['历史诈骗IP所属国家或地区', '历史发现诈骗IP所属城市', '当日发现诈骗IP所属城市']
                            },

                            tooltip: {
                                trigger: "item",
                                z: 60,
                                zlevel: 0,
                                hideDelay: 100,
                                transitionDuration: 0.4,
                                backgroundColor: "#fff",
                                shadowColor: "rgba(0, 0, 0, .2)",
                                shadowOffsetX: 1,
                                shadowOffsetY: 2,
                                borderRadius: 4,
                                borderWidth: 1,
                                textStyle: {
                                    color: "#666",
                                    fontSize: 14
                                }
                            },
                            // 这里面的GEO参数完全没用
                            geo: {
                                map: Area,
                                layoutCenter:['45%','55%'],
                                layoutSize:'180%',
                                itemStyle: {
                                    normal: {
                                        areaColor: '#323c48',
                                        borderColor: '#111'
                                    },
                                    emphasis: {
                                        areaColor: '#2a333d',
                                    }
                                }
                            },
                            series: series
                        };
                        let app = {}
                        app.currentIndex = -1;

                        this.timerID = setInterval(function () {
                            // console.log("wo bulijie")
                            var dataLen = option.series[0].data.length;
                            // console.log(dataLen);
                            // console.log(option.series[0].data);
                            // 取消之前高亮的图形
                            map.dispatchAction({
                                type: 'downplay',
                                seriesIndex: 0,
                                dataIndex: app.currentIndex
                            });
                            app.currentIndex = (app.currentIndex + 1) % dataLen;
                            // 高亮当前图形
                            map.dispatchAction({
                                type: 'highlight',
                                seriesIndex: 0,
                                dataIndex: app.currentIndex
                            });
                            // 显示 tooltip
                            map.dispatchAction({
                                type: 'showTip',
                                seriesIndex: 0,
                                dataIndex: app.currentIndex
                            });
                        }, 5000);
                        // 参数是秒
                        map.setOption(option, true, true);
                        window.addEventListener("resize", function () {
                            // map.resize();
                        });
                    })
                })(Data, Data2, Data3);
            }(this.props.cityData, this.props.countryData, this.props.dailyCityData));
        }
        else if (this.props.mapId === "area4") {
            $(document).ready(function (Data) {
                (function (Data) {
                    let DailyCityData = [];
                    for (let i in Data) {
                        DailyCityData.push({
                            name: Data[i].cityName,
                            value: Data[i].long < 340 ? [Data[i].long, Data[i].lat] : [Data[i].long - 360, Data[i].lat]
                        })
                    }
                    let Area = 'world';
                    $.get('./maps/' + Area + '.json', function (geoJson) {
                        let mapDom = document.getElementById('area4');
                        if (!mapDom) return;
                        let map = echarts.init(document.getElementById('area4'));
                        echarts.registerMap('world', geoJson);
                        let option = {
                            legend: {
                                left: 'left',
                                bottom: '10%',
                                orient: 'vertical',
                                textStyle: {
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
                                    dataView: { readOnly: false },
                                    restore: {},
                                    saveAsImage: {}
                                }
                            },
                            geo: {
                                map: Area,
                                itemStyle: {
                                    normal: {
                                        areaColor: '#323c48',
                                        borderColor: '#111'
                                    },
                                    emphasis: {
                                        areaColor: '#2a333d'
                                    }
                                }
                            },
                            color: ['#6997AF', '#91cc75', '#fac858',
                                '#ee6666', '#73c0de', '#3ba272',
                                '#fc8452', '#9a60b4', '#ea7ccc'],
                            series: [
                                {
                                    type: 'map',
                                    mapType: Area,
                                    itemStyle: {
                                        areaColor: '#0ba7bd'
                                    }
                                },
                                {
                                    name: '当日发现诈骗IP所属城市',
                                    type: 'scatter',
                                    coordinateSystem: 'geo',
                                    label: {
                                        show: true,
                                        align: 'left',
                                        color: "red",
                                        formatter: '{b}'
                                    },
                                    symbol: 'triangle',
                                    symbolSize: 13,
                                    data: DailyCityData,
                                }
                            ]
                        };
                        map.setOption(option, true, true);
                        window.addEventListener("resize", function () {
                            map.resize();
                        });
                    })
                })(Data);
            }(this.props.dailyCityData));
        }
        else if (this.props.mapId === "area5") {
            $(function (Data, Data2) {
                (function (Data, Data2) {
                    console.log("==========================in5")
                    let ShowData = [];
                    let count = 0;
                    for (let i in Data) {
                        count = count + 1;
                        if(count>=2){
                            break;
                        }
                        if(Data[i].cityName==="广东深圳"){
                            Data[i].cityName="中国广东深圳";
                        }
                        if(Data[i].cityName==="台湾台北"){
                            Data[i].cityName="中国台湾台北";
                        }
                        ShowData.push({
                            name: Data[i].cityName,
                            value: Data[i].long < 340 ? [Data[i].long, Data[i].lat, Data[i].number, Data[i].cityName] : [Data[i].long - 360, Data[i].lat, Data[i].number, Data[i].cityName]
                        })
                    }

                    let CountryData = [];
                    for (let i in Data2) {
                        CountryData.push({
                            name: Data2[i].countryName,
                            value: Data2[i].number
                        })
                    }
                    // console.log(CountryData);
                    let Area = 'world';

                    var geoCoordMap = {
                        '美国': [264.287, 37.09],
                        '中国': [113.8953, 31.901],
                        '印度': [78.963, 20.594],
                        //todo: 目前用的是城市坐标（伦敦/里巴加湾）
                        '英国': [359.872-360, 51.507],
                        '文莱': [114.94, 4.903],
                        '新加坡': [103.51, 1.18]
                    };

                    var AMData = [
                        [{name:'美国'}, {name:'中国',value:95}]
                    ];

                    var YDData = [
                        [{name:'印度'}, {name:'中国',value:95}]
                    ];

                    var BRData = [
                        [{name:'英国'}, {name:'中国',value:95}]
                    ];

                    var SINData = [
                        [{name:'新加坡'}, {name:'中国',value:95}]
                    ];

                    var WLData = [
                        [{name:'文莱'}, {name:'中国',value:95}]
                    ];

                    var planePath = 'path://M1705.06,1318.313v-89.254l-319.9-221.799l0.073-208.063c0.521-84.662-26.629-121.796-63.961-121.491c-37.332-0.305-64.482,36.829-63.961,121.491l0.073,208.063l-319.9,221.799v89.254l330.343-157.288l12.238,241.308l-134.449,92.931l0.531,42.034l175.125-42.917l175.125,42.917l0.531-42.034l-134.449-92.931l12.238-241.308L1705.06,1318.313z';
                    // var planePath = 'path://M512 16C238 16 16 238 16 512s222 496 496 496 496-222 496-496S786 16 512 16z';
                    var convertData = function (data) {
                        var res = [];
                        for (var i = 0; i < data.length; i++) {
                            var dataItem = data[i];
                            var fromCoord = geoCoordMap[dataItem[0].name];
                            var toCoord = geoCoordMap[dataItem[1].name];
                            if (fromCoord && toCoord) {
                                res.push({
                                    fromName: dataItem[0].name,
                                    toName: dataItem[1].name,
                                    coords: [fromCoord, toCoord]
                                });
                            }
                        }
                        return res;
                    };

                    var color = ['#a6c84c', '#ffa022', '#46bee9'];
                    var series = [];
                    series.push(
                        {
                            name: '历史诈骗IP所属国家或地区',
                            type: 'map',
                            selectedMode: 'multiple',
                            aspectScale: 0.75,
                            left: '0%',
                            right: '-1%',
                            top: '15%',
                            bottom: '6%',
                            mapType: Area,
                            itemStyle: {
                                //地图默认显示颜色
                                areaColor: '#0ba7bd',
                                color: "#FED766"
                            },
                            label: {
                                show: false,
                                color: 'red'
                            },
                            tooltip: {
                                formatter: function (params) {
                                    return "";
                                    // ip数排名
                                    // console.log(Number.isNaN(params.value));
                                    // if (Number.isNaN(params.value)) return "";
                                    // let rank = params.dataIndex + 1;
                                    // return params.name + " : " + params.value + " (第" + rank + "名)";
                                }
                            },
                            emphasis: {
                                itemStyle: {
                                    shadowBlur: 10,
                                    shadowOffsetX: 5,
                                    shadowOffsetY: 5,
                                    shadowColor: '#FED766',
                                },
                                label: {
                                    show: false
                                },
                                // color:"black"
                            },
                            data: [],

                        },
                        {
                            name: '历史发现诈骗IP所属城市',
                            type: 'scatter',
                            coordinateSystem: 'geo',
                            label: {
                                show: true,
                                align: 'right',
                                shadowColor: 'transparent',
                                color: "#FED766",
                                formatter: '{b}',
                                backgroundColor: 'rgba(128,128,128,0.7)',
                                offset: [12, -5],
                                fontSize: 15
                            },
                            labelLayout: {
                                moveOverlap: true
                            },
                            tooltip: {
                                formatter: function (params) {
                                    return params.value[3] + ' : ' + params.value[2];
                                }
                            },
                            labelline: {
                                show: true,
                                showAbove: true
                            },
                            itemStyle: {
                                //散点图对应颜色
                                color: 'rgba(214,186,183,1)'
                            },
                            symbol: 'circle',
                            symbolSize: 16,
                            data: ShowData,
                        }
                    );

      

                    $.get('./maps/' + Area + '.json', function (geoJson) {
                        //解决刷新时可能存在崩溃的问题
                        let mapDom = document.getElementById('area5');
                        if (!mapDom) return;
                        let map = echarts.init(document.getElementById('area5'));
                        echarts.registerMap('world', geoJson);
                        let option = {
                            color: ['#D4B40C', '#91cc75', '#fac858',
                                '#ee6666', '#73c0de', '#3ba272',
                                '#fc8452', '#9a60b4', '#ea7ccc'],
                            legend: {
                                left: '0%',
                                // top:'0%',
                                bottom: '0%',
                                orient: 'vertical',
                                textStyle: {
                                    color: '#fff',
                                    borderColor: '#008B8B'
                                },
                                data: ['历史发现诈骗IP所属城市']
                            },

                            geo: {
                                map: Area,
                                aspectScale: 0.75,
                                left: '0%',
                                right: '-1%',
                                top: '15%',
                                bottom: '6%',
                                itemStyle: {
                                    normal: {
                                        areaColor: '#323c48',
                                        borderColor: '#111'
                                    },
                                    emphasis: {
                                        areaColor: '#2a333d'
                                    }
                                }
                            },
                            tooltip: {
                                trigger: "item",
                                z: 60,
                                zlevel: 0,
                                hideDelay: 100,
                                transitionDuration: 0.4,
                                backgroundColor: "#fff",
                                shadowColor: "rgba(0, 0, 0, .2)",
                                shadowOffsetX: 1,
                                shadowOffsetY: 2,
                                borderRadius: 4,
                                borderWidth: 1,
                                textStyle: {
                                    color: "#666",
                                    fontSize: 14
                                }
                            },
                            series: series
                        };

                        // map.setOption(option, true, true);

                        let app = {}
                        app.currentIndex = -1;

                        map.setOption(option, true, true);
                        window.addEventListener("resize", function () {
                            map.resize();
                        });
                    })
                })(Data, Data2);
            }(this.props.cityData, this.props.countryData));


        }


        else if (this.props.mapId === "area6") {
            $(function (Data, Data2) {
                (function (Data, Data2) {
                    let ShowData = [];
                    let count = 0;
                    for (let i in Data) {
                        count = count + 1;
                        if(count<2||count>4){
                            continue;
                        }
                        if(Data[i].cityName==="广东深圳"){
                            Data[i].cityName="中国广东深圳";
                        }
                        if(Data[i].cityName==="台湾台北"){
                            Data[i].cityName="中国台湾台北";
                        }
                        ShowData.push({
                            name: Data[i].cityName,
                            value: Data[i].long < 340 ? [Data[i].long, Data[i].lat, Data[i].number, Data[i].cityName] : [Data[i].long - 360, Data[i].lat, Data[i].number, Data[i].cityName]
                        })
                    }

                    let CountryData = [];
                    for (let i in Data2) {
                        CountryData.push({
                            name: Data2[i].countryName,
                            value: Data2[i].number
                        })
                    }
                    // console.log(CountryData);
                    let Area = 'world';

                    var geoCoordMap = {
                        '美国': [264.287, 37.09],
                        '中国': [113.8953, 31.901],
                        '印度': [78.963, 20.594],
                        //todo: 目前用的是城市坐标（伦敦/里巴加湾）
                        '英国': [359.872-360, 51.507],
                        '文莱': [114.94, 4.903],
                        '新加坡': [103.51, 1.18]
                    };

                    var AMData = [
                        [{name:'美国'}, {name:'中国',value:95}]
                    ];

                    var YDData = [
                        [{name:'印度'}, {name:'中国',value:95}]
                    ];

                    var BRData = [
                        [{name:'英国'}, {name:'中国',value:95}]
                    ];

                    var SINData = [
                        [{name:'新加坡'}, {name:'中国',value:95}]
                    ];

                    var WLData = [
                        [{name:'文莱'}, {name:'中国',value:95}]
                    ];

                    var planePath = 'path://M1705.06,1318.313v-89.254l-319.9-221.799l0.073-208.063c0.521-84.662-26.629-121.796-63.961-121.491c-37.332-0.305-64.482,36.829-63.961,121.491l0.073,208.063l-319.9,221.799v89.254l330.343-157.288l12.238,241.308l-134.449,92.931l0.531,42.034l175.125-42.917l175.125,42.917l0.531-42.034l-134.449-92.931l12.238-241.308L1705.06,1318.313z';
                    // var planePath = 'path://M512 16C238 16 16 238 16 512s222 496 496 496 496-222 496-496S786 16 512 16z';
                    var convertData = function (data) {
                        var res = [];
                        for (var i = 0; i < data.length; i++) {
                            var dataItem = data[i];
                            var fromCoord = geoCoordMap[dataItem[0].name];
                            var toCoord = geoCoordMap[dataItem[1].name];
                            if (fromCoord && toCoord) {
                                res.push({
                                    fromName: dataItem[0].name,
                                    toName: dataItem[1].name,
                                    coords: [fromCoord, toCoord]
                                });
                            }
                        }
                        return res;
                    };

                    var color = ['#a6c84c', '#ffa022', '#46bee9'];
                    var series = [];
                    series.push(
                        {
                            name: '历史诈骗IP所属国家或地区',
                            type: 'map',
                            selectedMode: 'multiple',
                            aspectScale: 0.75,
                            left: '0%',
                            right: '-1%',
                            top: '15%',
                            bottom: '6%',
                            mapType: Area,
                            itemStyle: {
                                //地图默认显示颜色
                                areaColor: '#0ba7bd',
                                color: "#FED766"
                            },
                            label: {
                                show: false,
                                color: 'red'
                            },
                            tooltip: {
                                formatter: function (params) {
                                    return "";
                                    // ip数排名
                                    // console.log(Number.isNaN(params.value));
                                    // if (Number.isNaN(params.value)) return "";
                                    // let rank = params.dataIndex + 1;
                                    // return params.name + " : " + params.value + " (第" + rank + "名)";
                                }
                            },
                            emphasis: {
                                itemStyle: {
                                    shadowBlur: 10,
                                    shadowOffsetX: 5,
                                    shadowOffsetY: 5,
                                    shadowColor: '#FED766',
                                },
                                label: {
                                    show: false
                                },
                                // color:"black"
                            },
                            data: [],

                        },
                        {
                            name: '历史发现诈骗IP所属城市',
                            type: 'scatter',
                            coordinateSystem: 'geo',
                            label: {
                                show: true,
                                align: 'right',
                                shadowColor: 'transparent',
                                color: "#FED766",
                                formatter: '{b}',
                                backgroundColor: 'rgba(128,128,128,0.7)',
                                offset: [12, -5],
                                fontSize: 15
                            },
                            labelLayout: {
                                moveOverlap: true
                            },
                            tooltip: {
                                formatter: function (params) {
                                    return params.value[3] + ' : ' + params.value[2];
                                }
                            },
                            labelline: {
                                show: true,
                                showAbove: true
                            },
                            itemStyle: {
                                //散点图对应颜色
                                color: 'rgba(214,186,183,1)'
                            },
                            symbol: 'circle',
                            symbolSize: 16,
                            data: ShowData,
                        }
                    );

      

                    $.get('./maps/' + Area + '.json', function (geoJson) {
                        //解决刷新时可能存在崩溃的问题
                        let mapDom = document.getElementById('area6');
                        if (!mapDom) return;
                        let map = echarts.init(document.getElementById('area6'));
                        echarts.registerMap('world', geoJson);
                        let option = {
                            color: ['#D4B40C', '#91cc75', '#fac858',
                                '#ee6666', '#73c0de', '#3ba272',
                                '#fc8452', '#9a60b4', '#ea7ccc'],
                            legend: {
                                left: '0%',
                                // top:'0%',
                                bottom: '0%',
                                orient: 'vertical',
                                textStyle: {
                                    color: '#fff',
                                    borderColor: '#008B8B'
                                },
                                data: ['历史发现诈骗IP所属城市']
                            },

                            geo: {
                                map: Area,
                                aspectScale: 0.75,
                                left: '0%',
                                right: '-1%',
                                top: '15%',
                                bottom: '6%',
                                itemStyle: {
                                    normal: {
                                        areaColor: '#323c48',
                                        borderColor: '#111'
                                    },
                                    emphasis: {
                                        areaColor: '#2a333d'
                                    }
                                }
                            },
                            tooltip: {
                                trigger: "item",
                                z: 60,
                                zlevel: 0,
                                hideDelay: 100,
                                transitionDuration: 0.4,
                                backgroundColor: "#fff",
                                shadowColor: "rgba(0, 0, 0, .2)",
                                shadowOffsetX: 1,
                                shadowOffsetY: 2,
                                borderRadius: 4,
                                borderWidth: 1,
                                textStyle: {
                                    color: "#666",
                                    fontSize: 14
                                }
                            },
                            series: series
                        };

                        // map.setOption(option, true, true);

                        let app = {}
                        app.currentIndex = -1;

                        map.setOption(option, true, true);
                        window.addEventListener("resize", function () {
                            map.resize();
                        });
                    })
                })(Data, Data2);
            }(this.props.cityData, this.props.countryData));


        }

        else if (this.props.mapId === "area7") {
            $(function (Data, Data2) {
                (function (Data, Data2) {
                    let ShowData = [];
                    let count = 0;
                    for (let i in Data) {
                        count = count + 1;
                        if(count<=4||count>=8){
                            continue;
                        }
                        if(Data[i].cityName==="广东深圳"){
                            Data[i].cityName="中国广东深圳";
                        }
                        if(Data[i].cityName==="台湾台北"){
                            Data[i].cityName="中国台湾台北";
                        }
                        ShowData.push({
                            name: Data[i].cityName,
                            value: Data[i].long < 340 ? [Data[i].long, Data[i].lat, Data[i].number, Data[i].cityName] : [Data[i].long - 360, Data[i].lat, Data[i].number, Data[i].cityName]
                        })
                    }

                    let CountryData = [];
                    for (let i in Data2) {
                        CountryData.push({
                            name: Data2[i].countryName,
                            value: Data2[i].number
                        })
                    }
                    // console.log(CountryData);
                    let Area = 'world';

                    var geoCoordMap = {
                        '美国': [264.287, 37.09],
                        '中国': [113.8953, 31.901],
                        '印度': [78.963, 20.594],
                        //todo: 目前用的是城市坐标（伦敦/里巴加湾）
                        '英国': [359.872-360, 51.507],
                        '文莱': [114.94, 4.903],
                        '新加坡': [103.51, 1.18]
                    };

                    var AMData = [
                        [{name:'美国'}, {name:'中国',value:95}]
                    ];

                    var YDData = [
                        [{name:'印度'}, {name:'中国',value:95}]
                    ];

                    var BRData = [
                        [{name:'英国'}, {name:'中国',value:95}]
                    ];

                    var SINData = [
                        [{name:'新加坡'}, {name:'中国',value:95}]
                    ];

                    var WLData = [
                        [{name:'文莱'}, {name:'中国',value:95}]
                    ];

                    var planePath = 'path://M1705.06,1318.313v-89.254l-319.9-221.799l0.073-208.063c0.521-84.662-26.629-121.796-63.961-121.491c-37.332-0.305-64.482,36.829-63.961,121.491l0.073,208.063l-319.9,221.799v89.254l330.343-157.288l12.238,241.308l-134.449,92.931l0.531,42.034l175.125-42.917l175.125,42.917l0.531-42.034l-134.449-92.931l12.238-241.308L1705.06,1318.313z';
                    // var planePath = 'path://M512 16C238 16 16 238 16 512s222 496 496 496 496-222 496-496S786 16 512 16z';
                    var convertData = function (data) {
                        var res = [];
                        for (var i = 0; i < data.length; i++) {
                            var dataItem = data[i];
                            var fromCoord = geoCoordMap[dataItem[0].name];
                            var toCoord = geoCoordMap[dataItem[1].name];
                            if (fromCoord && toCoord) {
                                res.push({
                                    fromName: dataItem[0].name,
                                    toName: dataItem[1].name,
                                    coords: [fromCoord, toCoord]
                                });
                            }
                        }
                        return res;
                    };

                    var color = ['#a6c84c', '#ffa022', '#46bee9'];
                    var series = [];
                    series.push(
                        {
                            name: '历史诈骗IP所属国家或地区',
                            type: 'map',
                            selectedMode: 'multiple',
                            aspectScale: 0.75,
                            left: '0%',
                            right: '-1%',
                            top: '15%',
                            bottom: '6%',
                            mapType: Area,
                            itemStyle: {
                                //地图默认显示颜色
                                areaColor: '#0ba7bd',
                                color: "#FED766"
                            },
                            label: {
                                show: false,
                                color: 'red'
                            },
                            tooltip: {
                                formatter: function (params) {
                                    return "";
                                    // ip数排名
                                    // console.log(Number.isNaN(params.value));
                                    // if (Number.isNaN(params.value)) return "";
                                    // let rank = params.dataIndex + 1;
                                    // return params.name + " : " + params.value + " (第" + rank + "名)";
                                }
                            },
                            emphasis: {
                                itemStyle: {
                                    shadowBlur: 10,
                                    shadowOffsetX: 5,
                                    shadowOffsetY: 5,
                                    shadowColor: '#FED766',
                                },
                                label: {
                                    show: false
                                },
                                // color:"black"
                            },
                            data: [],

                        },
                        {
                            name: '历史发现诈骗IP所属城市',
                            type: 'scatter',
                            coordinateSystem: 'geo',
                            label: {
                                show: true,
                                align: 'right',
                                shadowColor: 'transparent',
                                color: "#FED766",
                                formatter: '{b}',
                                backgroundColor: 'rgba(128,128,128,0.7)',
                                offset: [12, -5],
                                fontSize: 15
                            },
                            labelLayout: {
                                moveOverlap: true
                            },
                            tooltip: {
                                formatter: function (params) {
                                    return params.value[3] + ' : ' + params.value[2];
                                }
                            },
                            labelline: {
                                show: true,
                                showAbove: true
                            },
                            itemStyle: {
                                //散点图对应颜色
                                color: 'rgba(214,186,183,1)'
                            },
                            symbol: 'circle',
                            symbolSize: 16,
                            data: ShowData,
                        }
                    );

      

                    $.get('./maps/' + Area + '.json', function (geoJson) {
                        //解决刷新时可能存在崩溃的问题
                        let mapDom = document.getElementById('area7');
                        if (!mapDom) return;
                        let map = echarts.init(document.getElementById('area7'));
                        echarts.registerMap('world', geoJson);
                        let option = {
                            color: ['#D4B40C', '#91cc75', '#fac858',
                                '#ee6666', '#73c0de', '#3ba272',
                                '#fc8452', '#9a60b4', '#ea7ccc'],
                            legend: {
                                left: '0%',
                                // top:'0%',
                                bottom: '0%',
                                orient: 'vertical',
                                textStyle: {
                                    color: '#fff',
                                    borderColor: '#008B8B'
                                },
                                data: ['历史发现诈骗IP所属城市']
                            },

                            geo: {
                                map: Area,
                                aspectScale: 0.75,
                                left: '0%',
                                right: '-1%',
                                top: '15%',
                                bottom: '6%',
                                itemStyle: {
                                    normal: {
                                        areaColor: '#323c48',
                                        borderColor: '#111'
                                    },
                                    emphasis: {
                                        areaColor: '#2a333d'
                                    }
                                }
                            },
                            tooltip: {
                                trigger: "item",
                                z: 60,
                                zlevel: 0,
                                hideDelay: 100,
                                transitionDuration: 0.4,
                                backgroundColor: "#fff",
                                shadowColor: "rgba(0, 0, 0, .2)",
                                shadowOffsetX: 1,
                                shadowOffsetY: 2,
                                borderRadius: 4,
                                borderWidth: 1,
                                textStyle: {
                                    color: "#666",
                                    fontSize: 14
                                }
                            },
                            series: series
                        };

                        // map.setOption(option, true, true);

                        let app = {}
                        app.currentIndex = -1;

                        map.setOption(option, true, true);
                        window.addEventListener("resize", function () {
                            map.resize();
                        });
                    })
                })(Data, Data2);
            }(this.props.cityData, this.props.countryData));


        }


    }
    unMapfunction(){
        console.log("即将卸载地图")
        clearInterval(this.timerID)
        if (this.props.mapId === "area3") {
            console.log("即将卸载area3")
            clearInterval(this.timerID)
            // 清除定时器
        }
    }

    componentDidMount() {
        this.mapfunction();
    }

    componentDidUpdate() {
        this.mapfunction();
    }
    componentWillUnmount(){
        this.unMapfunction();
    }


    render() {
        return (
            <div />
        );
    }
}

export default StatisticsMap;
