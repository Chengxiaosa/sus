import React, { Component } from 'react';
import StatisticsBarChart from "./StatisticsBarChart";

class RightBarChart extends Component {
    render() {
        return this.props.area === 'world' ?
            (<div style={{ width: "100%", textAlign: "center", color: "white" }}>
                <div >
                    <div id={"bar3"} style={{ width: "100%", height: "350px" }} />
                    <StatisticsBarChart data={this.props.data} ExecuteId={"bar3"} />
                </div>
            </div>) :
            (<div style={{ width: "100%", textAlign: "center", color: "white" }}>
                <div >
                    <div id={"bar6"} style={{ width: "100%", height: "350px" }} />
                    <StatisticsBarChart data={this.props.data} ExecuteId={"bar6"} />
                </div>
            </div>);
    }
}

export default RightBarChart;