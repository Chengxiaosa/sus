import React, { useEffect, useState, useRef } from "react";
import Frame from "./Frame";
import FrameTitle from "./FrameTitle";
import { makeStyles } from '@material-ui/core/styles';
import Paper from '@material-ui/core/Paper';
import Grid from '@material-ui/core/Grid';
import moment from 'moment';
import "../assets/css/homestyle.css";
import { data } from "jquery";

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

export default function Moment(my_data) {
    const classes = useStyles();

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
            <div style={{height:"100%"}}>
                <FrameTitle value="集群动态" />
                <div style={{marginBottom:"6px", marginTop:"2px"}}>
                    <Grid container spacing={0}>
                        <Grid item xs={6}>
                            <div className="paper">
                                <p style={{ color: "#5CD0FD" }}>发现时间</p>
                            </div>
                        </Grid>
                        <Grid item xs={6}>
                            <div className="paper">
                                <p style={{ color: "#5CD0FD" }}>类型</p>
                            </div>
                        </Grid>
                    </Grid>
                </div>
                <div className='parent' ref={warper} style = {{height : "70%"}}>
                    <div className='child' ref={childDom1}>
                        <div className={classes.root}>
                            <Grid container spacing={0}>

                                <Grid item xs={6}>
                                    <div className="paper">
                                        <div style={{ fontSize: "16px", listStyleType: "none" }}>
                                            {
                                                my_data.my_time.map((item) => {
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

                                <Grid item xs={6}>
                                    <div className="paper">
                                        <div style={{ fontSize: "16px", listStyleType: "none" }}>
                                            {
                                                my_data.my_action.map((item) => {
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
                            </Grid>

                            <Grid container spacing={0}>
                                <Grid item xs={6}>
                                    <div className="paper">
                                        <div style={{ fontSize: "16px", listStyleType: "none" }}>
                                            {
                                                my_data.my_time.map((item) => {
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

                                <Grid item xs={6}>
                                    <div className="paper">
                                        <div style={{ fontSize: "16px", listStyleType: "none" }}>
                                            {
                                                my_data.my_action.map((item) => {
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
                            </Grid>

                        </div>

                    </div>
                </div>
            </div>
    );
}