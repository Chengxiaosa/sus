import React, { useEffect, useState, useRef } from "react";
import Frame from "../Frame";
import FrameTitle from "../FrameTitle";
import { makeStyles } from '@material-ui/core/styles';
import Paper from '@material-ui/core/Paper';
import Grid from '@material-ui/core/Grid';
import moment from 'moment';
import "../../assets/css/homestyle.css";

const useStyles = makeStyles((theme) => ({
    root: {
        flexGrow: 1,
    },
    paper: {
        padding: theme.spacing(0),
        textAlign: 'center',
        backgroundColor: '#111D4A',
        color: '#ECE8EF',
        fontSize: "18px",
    },
}));

export default function DailyData(props) {
    const classes = useStyles();


    let Date = [];
    for (let i in props.dailyDatas) {
        let statusPassTime = moment(props.dailyDatas[i].date).format('YYYY.MM.DD');
        Date.push(statusPassTime);
    }

    //文字滚动

    const [isScrolle, setIsScrolle] = useState(true);

    // 滚动速度，值越小，滚动越快
    const speed = 40;
    const warper = useRef();
    const childDom1 = useRef();
    // const childDom2 = useRef();

    // 开始滚动
    useEffect(() => {
        // 多拷贝一层，让它无缝滚动
        // childDom2.current.innerHTML = childDom1.current.innerHTML;

        let timer;
        let a = warper.current;
        let b = childDom1.current;
        if (isScrolle) {
            timer = setInterval(
                () =>
                    a.scrollTop >= b.scrollHeight
                        ? (a.scrollTop = 0)
                        : a.scrollTop++, speed
            );
        }
        return () => {
            clearTimeout(timer);
        };
    }, [isScrolle]);

    const hoverHandler = (flag) => setIsScrolle(flag);
    console.log(props)

    return (
        (props.dailyDatas[0].victimNum === 0) ?
            <div style={{ color: "white" }}><h2>loading...</h2></div>
            :
            <Frame>
                <FrameTitle value="最新发现" />
                <div style={{marginBottom:"6px", marginTop:"2px"}}>
                    <Grid container spacing={0}>
                        <Grid item xs={5}>
                            <div className="paper">
                                <p style={{ color: "#5CD0FD" }}>发现时间</p>
                            </div>
                        </Grid>
                        <Grid item xs={2}>
                            <div className="paper">
                                <p style={{ color: "#5CD0FD" }}>类型</p>
                            </div>
                        </Grid>
                        <Grid item xs={5}>
                            <div className="paper">
                                <p style={{ color: "#5CD0FD" }}>IP地址</p>
                            </div>
                        </Grid>
                        {/* <Grid item xs={3}>
                            <Paper className={classes.paper} elevation={0}>
                                <p style={{ color: "#8ef0f8" }}>潜在受害人数</p>
                            </Paper>
                        </Grid> */}
                    </Grid>
                </div>
                <div className='parent' ref={warper}>
                    <div className='child' ref={childDom1}>
                        <div className={classes.root}>
                            <Grid container spacing={0}>
                                <Grid item xs={5}>
                                    <div className="paper">
                                        <div style={{ fontSize: "16px", listStyleType: "none" }}>
                                            {
                                                Date.map((item) => {
                                                    return (
                                                        <li
                                                            onMouseOver={() => hoverHandler(false)}
                                                            onMouseLeave={() => hoverHandler(true)}>
                                                            {item}
                                                        </li>
                                                    )
                                                })
                                            }
                                        </div>
                                    </div>
                                </Grid>

                                <Grid item xs={2}>
                                    <div className="paper">
                                        <div style={{ fontSize: "16px", listStyleType: "none" }}>
                                            {
                                                props.dailyDatas.map((item) => {
                                                    return (
                                                        <li
                                                            onMouseOver={() => hoverHandler(false)}
                                                            onMouseLeave={() => hoverHandler(true)}>
                                                            {item.type}
                                                        </li>
                                                    )
                                                })
                                            }
                                        </div>
                                    </div>
                                </Grid>

                                <Grid item xs={5}>
                                    <div className="paper">
                                        <div style={{ fontSize: "16px", listStyleType: "none" }}>
                                            {
                                                props.dailyDatas.map((item) => {
                                                    return (
                                                        <li
                                                            onMouseOver={() => hoverHandler(false)}
                                                            onMouseLeave={() => hoverHandler(true)}>
                                                            {item.ip}
                                                        </li>
                                                    )
                                                })
                                            }
                                        </div>
                                    </div>
                                </Grid>

                                {/* <Grid item xs={3}>
                                    <Paper className={classes.paper} elevation={0}>
                                        <div style={{ fontSize: "14px", listStyleType: "none" }}>
                                            {
                                                props.dailyDatas.map((item) => {
                                                    return (
                                                        <li
                                                            onMouseOver={() => hoverHandler(false)}
                                                            onMouseLeave={() => hoverHandler(true)}>
                                                            {item.victimNum}
                                                        </li>
                                                    )
                                                })
                                            }
                                        </div>
                                    </Paper>
                                </Grid> */}
                            </Grid>

                            <Grid container spacing={0}>
                                <Grid item xs={5}>
                                    <div className="paper">
                                        <div style={{ fontSize: "16px", listStyleType: "none" }}>
                                            {
                                                Date.map((item) => {
                                                    return (
                                                        <li
                                                            onMouseOver={() => hoverHandler(false)}
                                                            onMouseLeave={() => hoverHandler(true)}>
                                                            {item}
                                                        </li>
                                                    )
                                                })
                                            }
                                        </div>
                                    </div>
                                </Grid>

                                <Grid item xs={2}>
                                    <div className="paper">
                                        <div style={{ fontSize: "16px", listStyleType: "none" }}>
                                            {
                                                props.dailyDatas.map((item) => {
                                                    return (
                                                        <li
                                                            onMouseOver={() => hoverHandler(false)}
                                                            onMouseLeave={() => hoverHandler(true)}>
                                                            {item.type}
                                                        </li>
                                                    )
                                                })
                                            }
                                        </div>
                                    </div>
                                </Grid>

                                <Grid item xs={5}>
                                    <div className="paper">
                                        <div style={{ fontSize: "16px", listStyleType: "none" }}>
                                            {
                                                props.dailyDatas.map((item) => {
                                                    return (
                                                        <li
                                                            onMouseOver={() => hoverHandler(false)}
                                                            onMouseLeave={() => hoverHandler(true)}>
                                                            {item.ip}
                                                        </li>
                                                    )
                                                })
                                            }
                                        </div>
                                    </div>
                                </Grid>

                                {/* <Grid item xs={3}>
                                    <Paper className={classes.paper} elevation={0}>
                                        <div style={{ fontSize: "14px", listStyleType: "none" }}>
                                            {
                                                props.dailyDatas.map((item) => {
                                                    return (
                                                        <li
                                                            onMouseOver={() => hoverHandler(false)}
                                                            onMouseLeave={() => hoverHandler(true)}>
                                                            {item.victimNum}
                                                        </li>
                                                    )
                                                })
                                            }
                                        </div>
                                    </Paper>
                                </Grid> */}
                            </Grid>

                        </div>

                    </div>
                    {/* <div className='child' ref={childDom2}></div> */}
                </div>
            </Frame>

        // <Frame>
        //     <FrameTitle value="最新发现"/>
        // <div className={classes.root}>
        //     <Grid container spacing={0}>
        //         <Grid item xs={3}>
        //             <Paper className={classes.paper} elevation={0}>
        //                 <p style = {{color:"#8ef0f8"}}>发现时间</p>
        //                 <div style={{fontSize:"13.9px"}}>
        //                 {
        //                     Date.map((item)=>{
        //                         return(
        //                         <div>
        //                             <p>{item}</p>
        //                         </div>
        //                         )
        //                     })
        //                 }
        //                 </div>
        //             </Paper>
        //         </Grid>
        // <Grid item xs={2}>
        //     <Paper className={classes.paper} elevation={0}>
        //         <p style = {{color:"#8ef0f8"}}>类型</p>
        //         <div style={{fontSize:"14px"}}>
        //         {
        //             props.dailyDatas.map((item)=>{
        //                 return(
        //                 <div>
        //                     <p>{item.type}</p>
        //                 </div>
        //                 )
        //             })
        //         }
        //         </div>
        //     </Paper>
        // </Grid>
        // <Grid item xs={5}>
        //     <Paper className={classes.paper} elevation={0}>
        //         <p style = {{color:"#8ef0f8"}}>IP地址</p>
        //         <div style={{fontSize:"14px"}}>
        //         {
        //             props.dailyDatas.map((item)=>{
        //                 return(
        //                 <div>
        //                     <p>{item.ip}</p>
        //                 </div>
        //                 )
        //             })
        //         }
        //         </div>
        //     </Paper>
        // </Grid>
        // <Grid item xs={2}>
        //     <Paper className={classes.paper} elevation={0}>
        //         <p style = {{color:"#8ef0f8"}}>受害者</p>
        //         <div style={{fontSize:"14px"}}>
        //         {
        //             props.dailyDatas.map((item)=>{
        //                 return(
        //                 <div>
        //                     <p>{item.victimNum}</p>
        //                 </div>
        //                 )
        //             })
        //         }
        //         </div>
        //     </Paper>
        // </Grid>
        //     </Grid>
        // </div>
        //     </Frame>
    );
}