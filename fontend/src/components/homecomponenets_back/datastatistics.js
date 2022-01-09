import React, { Component } from 'react';
import Frame from "../Frame";
import FrameTitle from "../FrameTitle";
import { makeStyles } from '@material-ui/core/styles';
import Paper from '@material-ui/core/Paper';
import Grid from '@material-ui/core/Grid';


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

export default class DataStatistics extends Component {
    // const classes = useStyles();
    render(){
        return(
            <Frame>
                <FrameTitle value="数据统计"/>
                <div style={{marginTop:"2.9px"}}>
                <Grid container spacing={0}>
                    <Grid item xs={6}>
                        <div className="paper" >
                            <p style = {{color:"#5CD0FD",fontSize:"18px"}}>累计甄别诈骗网站</p >
                            <p style = {{color:"#ECE8EF",fontSize:"20px"}}>{this.props.SiteNum}</p >
                            <p style = {{color:"#5CD0FD",fontSize:"18px"}}>累计发现可疑网站</p >
                            <p style = {{color:"#ECE8EF",fontSize:"20px"}}>{this.props.AppNum}</p >
                        </div>
                    </Grid>
                    <Grid item xs={6}>
                        <div className="paper">
                            <p style = {{color:"#5CD0FD",fontSize:"18px"}}>当日甄别诈骗网站</p >
                            <p style = {{color:"#ECE8EF",fontSize:"20px"}}>{this.props.dailySiteNum}</p >
                            <p style = {{color:"#5CD0FD",fontSize:"18px"}}>当日发现可疑网站</p >
                            <p style = {{color:"#ECE8EF",fontSize:"20px"}}>{this.props.dailyAppNum}</p >
                        </div>
                    </Grid>
                </Grid>
                </div>
            </Frame>
        );
    }    
}