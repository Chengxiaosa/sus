import React, { Component } from 'react';
import StatisticsBarChart from "./StatisticsBarChart";

class LeftBarChart extends Component {
    render() {
        // console.log("LeftBarChart")
        // console.log(this.props.data)
        return this.props.area === 'world' ?
            // (<div style={{ width: "100%", display: "flex" }}>
            //     <div style={{ width: "65%", textAlign: "center", color: "white" }}>
            //         <div >

            //             <div id={"bar1"} style={{ width: "100%", height: "4.54rem" }} />
            //             <StatisticsBarChart data={this.props.data} ExecuteId={"bar1"} />
            //         </div>
            //     </div>
            //     <div style={{ width: "35%", textAlign: "center", color: "white" }}>
            //         <div>
            //             <div id={"bar2"} style={{ width: "100%", height: "4.54rem" }} />
            //             <StatisticsBarChart data={this.props.data} ExecuteId={"bar2"} />
            //         </div>
            //     </div>
            // </div>) :
            (<div style={{ width: "100%", display: "flex" }}>
            <div style={{ width: "65%", textAlign: "center", color: "white" }}>
                <div >

                    <div id={"bar1"} style={{ width: "100%", height: "4.54rem" }} />
                    <StatisticsBarChart data={this.props.data} ExecuteId={"bar1"} />
                </div>
            </div>
            <div style={{ width: "35%", textAlign: "center", color: "white" }}>
                <div>
                    <div id={"bar2"} style={{ width: "100%", height: "4.54rem" }} />
                    <StatisticsBarChart data={this.props.data} ExecuteId={"bar2"} />
                </div>
            </div>
        </div>) :             
            (<div style={{ width: "100%", display: "flex" }}>
                <div style={{ width: "65%", textAlign: "center", color: "white" }}>
                    <div >

                        <div id={"bar4"} style={{ width: "100%", height: "350px" }} />
                        <StatisticsBarChart data={this.props.data} ExecuteId={"bar4"} />
                    </div>
                </div>
                <div style={{ width: "35%", textAlign: "center", color: "white" }}>
                    <div>
                        <div id={"bar5"} style={{ width: "100%", height: "350px" }} />
                        <StatisticsBarChart data={this.props.data} ExecuteId={"bar5"} />
                    </div>
                </div>
            </div>);
    }
}

export default LeftBarChart;