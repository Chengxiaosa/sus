import React, { useEffect, useState, useRef } from "react";
import Frame from "../Frame";
import FrameBottom from "../FrameBottom";
import FrameTitle from "../FrameTitle";
import { makeStyles } from '@material-ui/core/styles';
import Paper from '@material-ui/core/Paper';
import Grid from '@material-ui/core/Grid';
import moment from 'moment';
import "../../assets/css/homestyle.css";
import { render } from "react-dom";

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
        return (
            (props.dailyDatas[0] === 0 ) ?
                <div style={{ color: "white" }}><h2>loading...</h2></div>
                :
                <FrameBottom >
                    <FrameTitle value="最新发现" />
                    <div >
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
                        </Grid>
                    </div>
                    <div className='parent' ref={warper} style = {{height:"50%"}}>
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

                                </Grid>

                                <Grid container spacing={0} >
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
                                </Grid>

                            </div>

                        </div>

                    </div>
                </FrameBottom>

            
        );
}