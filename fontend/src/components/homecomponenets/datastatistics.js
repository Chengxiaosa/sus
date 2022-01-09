import React, { Component } from 'react';
import Frame from "../Frame";
import FrameBottom from "../FrameBottom";
import FrameTitle from "../FrameTitle";
import { makeStyles } from '@material-ui/core/styles';
import Paper from '@material-ui/core/Paper';
import Grid from '@material-ui/core/Grid';

import CountUp from "react-countup";


// const useStyles = makeStyles((theme) => ({
//   root: {
//     flexGrow: 1,
//   },
//   paper: {
//     padding: theme.spacing(0),
//     textAlign: 'center',
//     backgroundColor: '#304753',
//   },
// }));


const countUpProps = {
    
    useEasing: true,
    
    useGrouping: true,
    
    
    }
    
export default class DataStatistics extends Component {

    constructor(props) {
        super(props);
        this.state={
            SiteNum : this.props.SiteNum,
            ScanNum : this.props.AppNum,
            dailySiteNum : 2013,
            dailyScanNum : 67246
        }
        console.log(this.state.dailySiteNum)
    }

    componentDidMount() {
        // setInterval(() => {
        //     let a = Math.ceil(Math.random()*1);
        //     this.setState({
        //         SiteNum : this.state.SiteNum + a
        //     });
        //     this.setState({
        //         dailySiteNum : this.state.dailySiteNum + a
        //     });
        // }, 20000);

        // setInterval(() => {
        //     let b = Math.ceil(Math.random()*2);
        //     this.setState({
        //         AppNum : this.state.AppNum + b
        //     });
        //     this.setState({
        //         dailyAppNum : this.state.dailyAppNum + b
        //     });    
        // }, 1000);
    }


    
    // const classes = useStyles();
    render(){
        return(
            <Frame heightZZ = "100">
                <FrameTitle value="数据统计"/>
                <div  >
                <Grid container spacing={0}>
                    <Grid item xs={6}>
                        <div className="paper" >
                            <p style = {{color:"#5CD0FD"}}>累计发现诈骗网站</p >
                            <p style = {{color:"#ECE8EF"}}>{this.state.SiteNum}</p >
                            <p style = {{color:"#5CD0FD"}}>累计扫描可疑网站</p >
                            <p style = {{color:"#ECE8EF"}}>{this.state.ScanNum}</p >
                        </div>
                    </Grid>
                    <Grid item xs={6}>
                        <div className="paper">
                            <p style = {{color:"#5CD0FD"}}>当日发现诈骗网站</p >
                            <p style = {{color:"#ECE8EF"}}>{this.state.dailySiteNum}</p >
                            <p style = {{color:"#5CD0FD"}}>当日扫描可疑网站</p >
                            <p style = {{color:"#ECE8EF"}}>{this.state.dailyScanNum}</p >
                        </div>
                    </Grid>
                </Grid>
                </div>
                </Frame>
        );
    }    
}