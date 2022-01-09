import React, { Component } from 'react';
import * as echarts from "echarts";
import LeftBarChart from "./LeftBarChart";
import RightBarChart from "./RightBarChart";


class StatisticsCharts extends Component {
    constructor(props) {
        super(props);
        this.state = {
            data: []
        }

    }

    Compare(item1, item2) {
        return item1 > item2;
    }

//像是一个冒泡
    BubbleSort(data) {
        // console.log("BubbleSort")
        // console.log(data.length)
        let length = data.length;
        let isChange = 1; //判断是否继续比较
        for (let i = 0; i < length; ++i) {
            if (!isChange) break;         //上一轮循环没有交换则结束循环
            isChange = 0;
            for (let j = 0; j < length - i - 1; ++j) {
                if (this.Compare((data[j].ipNum), (data[j + 1].ipNum))) continue;
                //如果相邻数据IPNum逆序则交换
                else {
                    let t = data[j];
                    data[j] = data[j + 1];
                    data[j + 1] = t;
                    isChange = 1;         //交换则记录
                }
            }
        }
        return data
    }


    render() {
        let newData = this.BubbleSort(this.props.data)
        // console.log(...newData)
        // barPosition 这一变量是什么
        return this.props.barPosition == "left" ? (
            <div style={{ display: "flex" }}>
                <div style={{ width: "10%", textAlign: "right", color: "white", left: '5%', position: "relative" }}>
                    <div style={{ marginTop:"0.238rem", position: "relative",fontSize:"16px"}}>
                        <span >排名</span>
                        <div style={{ display: "flex", flexDirection: "column", textAlign: "center", height: "4.45rem", paddingTop: "0.3rem" }}>{
                            newData.map((value, key) => {
                                if(key == 0){
                                    return (
                                        <div style={{width:"70%",marginLeft:"30%"}}>
                                                            <div key={key} style={{ marginBottom: "0.13rem", border: "2px solid #6997AF", fontSize: "12px" }}>
                                            {key + 1}</div>
                                                </div>
                                    )
                                }else{
                                    return (
                                        <div style={{width:"70%",marginLeft:"30%",marginTop:"0.0445rem"}}>
                                                            <div key={key} style={{ marginBottom: "0.13rem", border: "2px solid #6997AF", fontSize: "12px" }}>
                                            {key + 1}</div>
                                                </div>
                                    )
                                }
                            })
                        }
                        </div>
                    </div>
                </div>
                <div style={{ width: "80%", textAlign: "center", color: "white" ,}}>
                    <LeftBarChart data={newData} barPosition={this.props.barPosition} area={this.props.area} />
                </div>
            </div>
        ) : <div style={{ display: "flex" }}>
            <div style={{ width: "10%", textAlign: "right", color: "white", left: '5%', position: "relative" }}>
                <div style={{ top: '4%', position: "relative" }}>
                    <span>排名</span>
                    <div style={{ display: "flex", flexDirection: "column", textAlign: "center", height: "350px", paddingTop: "22px" }}>{
                        newData.map((value, key) => {
                            return (
                                <div style={{width:"70%",marginLeft:"30%"}}>
                                                    <div key={key} style={{ marginBottom: "10px", border: "2px solid #6997AF", fontSize: "12px" }}>
                                    {key + 1}</div>
                                        </div>
                            )
                        })
                    }
                    </div>
                </div>
            </div>
            <div style={{ width: "80%", textAlign: "center", color: "white" }}>
                <RightBarChart data={newData} barPosition={this.props.barPosition} area={this.props.area} />
            </div>
        </div>;
    }
}

export default StatisticsCharts;