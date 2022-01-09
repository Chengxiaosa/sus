import React, {Component} from 'react';
import Frame from "../Frame";
import FrameTitle from "../FrameTitle";

import Grid from '@material-ui/core/Grid';
import HomePieChart from "./HomePieChart"

      
export default class Server extends Component {
    constructor (props) {
        super(props);
        this.state = {
            bandwidth: this.props.Servers.bandwidth,
            diskRate: this.props.Servers.diskRate,
            request: this.props.Servers.request,
            cpu:this.props.Servers.cpu,
            memory:this.props.Servers.memory,
        }
    }
    
    count = () => {
        let band = Math.floor(Math.random()*500)+100;
        let disk = Math.floor(Math.random()*40)+10;
        let re = Math.floor(Math.random()*1000)+1000;
        let cp = Math.random()*0.2+0.5;
        let me = Math.random()*0.1+0.6;

        
        this.setState({
            bandwidth: band,
            diskRate: disk,
            request: re,
            cpu:cp,
            memory:me,
        });
    }

    componentDidMount() {
        this.id = setInterval(this.count,1800);
    }

    render(){
        return(
            (this.state.bandwidth === 0 || this.state.diskRate === 0 || this.state.request === 0)
            ?
            <Frame>
                <FrameTitle value="服务器使用情况"/>
                <div>
                    <Grid container spacing={0}>
                        <Grid item xs={3}>
                            <div className="paper" elevation={0}>
                                <p className="ltitle" style={{marginBottom:"20px"}}>CPU占用</p>
                                    <HomePieChart cpu={this.props.Servers.cpu} pieId={"home5"}/>
                               
                            </div>
                        </Grid>
                        <Grid item xs={3}>
                            <div className="paper" elevation={0}>
                                <p className="ltitle" style={{marginBottom:"20px"}}>内存占用</p>
                                <HomePieChart data={this.props.Servers.memory} pieId={"home6"}/>
                                
                            </div>
                        </Grid>
                        <Grid item xs={3}>
                            <div className="paper" elevation={0}>
                                <p className="ltitle">带宽</p>
                                <p className="ltitle">磁盘速率</p>
                                <p className="ltitle">请求数</p>
                                
                            </div>
                        </Grid>
                        <Grid item xs={3}>
                            <div className="paper" elevation={0}>
                                <p style={{marginBottom:"37.5px"}}>100Mbps</p>
                                <p style={{marginBottom:"37.5px"}}>3MB/s</p>
                                <p style={{marginBottom:"37.5px"}}>1812</p>
                            </div>
                        </Grid>
                    </Grid>
                
                </div>
                
            </Frame>
            :
            <Frame>
                <FrameTitle value="服务器使用情况"/>
                <div>
                    <Grid container spacing={0}>
                        <Grid item xs={3}>
                            <div className="paper" elevation={0}>
                                <p className="ltitle" style={{marginBottom:"20px"}}>CPU占用</p>
                                    <HomePieChart cpu={this.state.cpu} pieId={"home5"}/>
                               
                            </div>
                        </Grid>
                        <Grid item xs={3}>
                            <div className="paper" elevation={0}>
                                <p className="ltitle" style={{marginBottom:"20px"}}>内存占用</p>
                                <HomePieChart data={this.state.memory} pieId={"home6"}/>
                                
                            </div>
                        </Grid>
                        <Grid item xs={3}>
                            <div className="paper" elevation={0}>
                                <p className="ltitle">带宽</p>
                                <p className="ltitle">磁盘速率</p>
                                <p className="ltitle">请求数</p>
                                
                            </div>
                        </Grid>
                        <Grid item xs={3}>
                            <div className="paper" elevation={0}>
                                <p style={{marginBottom:"37.5px"}}>{this.state.bandwidth}Mbps</p>
                                <p style={{marginBottom:"37.5px"}}>{this.state.diskRate}MB/s</p>
                                <p style={{marginBottom:"37.5px"}}>{this.state.request}</p>
                            </div>
                        </Grid>
                    </Grid>
                
                </div>
                
            </Frame>
        );
    }
}