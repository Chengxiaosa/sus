import React, { useEffect, useState, useRef } from "react";
import Frame from "./Frame";
import FrameTitle from "./FrameTitle";
import { makeStyles } from '@material-ui/core/styles';
import Paper from '@material-ui/core/Paper';
import Grid from '@material-ui/core/Grid';
import moment from 'moment';
import "../assets/css/homestyle.css";

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

export default function PredData(props) {
    const classes = useStyles();

    //文字滚动
    const [isScrolle1, setIsScrolle1] = useState(true);
    const [isScrolle2, setIsScrolle2] = useState(true);

    // 滚动速度，值越小，滚动越快
    const speed = 40;
    const warper1 = useRef();
    const childDom1 = useRef();
    // const childDom2 = useRef();

    // 开始滚动
    useEffect(() => {
        // 多拷贝一层，让它无缝滚动
        // childDom2.current.innerHTML = childDom1.current.innerHTML;

        let timer;
        let a = warper1.current;
        let b = childDom1.current;
        if (isScrolle1) {
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
    }, [isScrolle1]);

    const warper2 = useRef();
    const childDom2 = useRef();

    // 开始滚动
    useEffect(() => {
        // 多拷贝一层，让它无缝滚动
        // childDom2.current.innerHTML = childDom1.current.innerHTML;

        let timer2;
        let c = warper2.current;
        let d = childDom2.current;
        if (isScrolle2) {
            timer2 = setInterval(
                () =>
                    c.scrollTop >= d.scrollHeight
                        ? (c.scrollTop = 0)
                        : c.scrollTop++, speed
            );
        }
        return () => {
            clearTimeout(timer2);
        };
    }, [isScrolle2]);

    const hoverHandler1 = (flag) => setIsScrolle1(flag);
    const hoverHandler2 = (flag) => setIsScrolle2(flag);

    let bad_domains_name = []
    for (let key in props.props.bad_domains){
        bad_domains_name.push(key)
    }

    return (
        (props.bandwidth === 0) ?
            <div style={{ color: "white" }}><h2>loading...</h2></div>
            :
            <Frame heightZZ = "100">
                <FrameTitle value="识别结果" />
                <div >
                    <Grid container spacing={0}>
                        <Grid item xs={6}>
                            <div className="paper">
                                <p style={{ color: "#FFFFFF" }}>高危诈骗网站</p>
                            </div>
                        </Grid>
                        <Grid item xs={6}>
                            <div className="paper">
                                <p style={{ color: "#FFFFFF" }}>低风险网站</p>
                            </div>
                        </Grid>
                        {/* <Grid item xs={4}>
                            <div className="paper">
                                <p style={{ color: "#FFFFFF" }}>不确定网站</p>
                            </div>
                        </Grid> */}
                    </Grid>
                </div>
                <Grid container spacing={0} style={{height:"100%"}}>
                    <Grid item xs={6} style={{height:"100%"}}>
                        <div className='parent' ref={warper1}  style={{height:"70%"}}>
                            <div className='child' ref={childDom1}>
                                <div className={classes.root}>
                                    <div className="paper">
                                        <div style={{ fontSize: "16px", listStyleType: "none" }}>
                                            {
                                                bad_domains_name.map((value, key) => {
                                                    return (
                                                        <li
                                                            onMouseOver={() => hoverHandler1(false)}
                                                            onMouseLeave={() => hoverHandler1(true)}>
                                                            <a class="link" href={'https://'+value}>{value}</a>
                                                        </li>
                                                    )
                                                })
                                            }
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </Grid>

                    <Grid item xs={6} style={{height:"100%"}}>
                        <div className='parent' ref={warper2}  style={{height:"70%"}}>
                            <div className='child' ref={childDom2}>
                                <div className={classes.root}>
                                    <div className="paper">
                                        <div style={{ fontSize: "16px", listStyleType: "none" }}>
                                            {
                                                props.props.good_domains.map((value, key) => {
                                                    return (
                                                        <li
                                                            onMouseOver={() => hoverHandler2(false)}
                                                            onMouseLeave={() => hoverHandler2(true)}>
                                                            {value}
                                                        </li>
                                                    )
                                                })
                                            }
                                        </div>
                                    </div>                                
                                </div>
                            </div>
                        </div>
                    </Grid>
                </Grid>
                </Frame>
    );
}