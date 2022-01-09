import React, { useEffect, useState, useRef } from "react";
import Frame from "./Frame";
import FrameTitle from "./FrameTitle";
import { makeStyles } from '@material-ui/core/styles';
import Paper from '@material-ui/core/Paper';
import Grid from '@material-ui/core/Grid';
import moment from 'moment';
import "../assets/css/homestyle.css";
import { Loading } from '@jiaminghi/data-view-react';
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

export default function FindData(props) {
    const classes = useStyles();

    //文字滚动
    const [isScrolle1, setIsScrolle1] = useState(true);
    const [isScrolle2, setIsScrolle2] = useState(true);
    const [isScrolle3, setIsScrolle3] = useState(true);
    const [isScrolle4, setIsScrolle4] = useState(true);

    // 滚动速度，值越小，滚动越快
    const speed = 40;
    const warper1 = useRef();
    const warper2 = useRef();
    const warper3 = useRef();
    const warper4 = useRef();
    const childDom1 = useRef();
    const childDom2 = useRef();
    const childDom3 = useRef();
    const childDom4 = useRef();

    // 开始滚动
    useEffect(() => {
        // 多拷贝一层，让它无缝滚动
        // childDom2.current.innerHTML = childDom1.current.innerHTML;

        let timer;
        let warper1_current = warper1.current;

        let b = childDom1.current;
        // if (isScrolle1) {
        //     timer = setInterval(
        //         () =>
        //         warper1_current.scrollTop >= b.scrollHeight
        //                 ? (warper1_current.scrollTop = 0)
        //                 : warper1_current.scrollTop++, speed
        //     );
        // }
        return () => {
            clearTimeout(timer);
        };
    }, [isScrolle1]);

    useEffect(() => {
        // 多拷贝一层，让它无缝滚动
        // childDom2.current.innerHTML = childDom1.current.innerHTML;

        let timer2;
        let warper2_current = warper2.current;

        let c = childDom2.current;
        if (isScrolle2) {
            timer2 = setInterval(
                () =>
                warper2_current.scrollTop >= c.scrollHeight
                        ? (warper2_current.scrollTop = 0)
                        : warper2_current.scrollTop++, speed
            );
        }
        return () => {
            clearTimeout(timer2);
        };
    }, [isScrolle2]);

    useEffect(() => {
        // 多拷贝一层，让它无缝滚动
        // childDom2.current.innerHTML = childDom1.current.innerHTML;

        let timer3;
        let warper3_current = warper3.current;

        let d = childDom3.current;
        if (isScrolle3) {
            timer3 = setInterval(
                () =>
                warper3_current.scrollTop >= d.scrollHeight
                        ? (warper3_current.scrollTop = 0)
                        : warper3_current.scrollTop++, speed
            );
        }
        return () => {
            clearTimeout(timer3);
        };
    }, [isScrolle3]);

    useEffect(() => {
        // 多拷贝一层，让它无缝滚动
        // childDom2.current.innerHTML = childDom1.current.innerHTML;

        let timer4;
        let warper4_current = warper4.current;

        let e = childDom4.current;
        if (isScrolle4) {
            timer4 = setInterval(
                () =>
                warper4_current.scrollTop >= e.scrollHeight
                        ? (warper4_current.scrollTop = 0)
                        : warper4_current.scrollTop++, speed
            );
        }
        return () => {
            clearTimeout(timer4);
        };
    }, [isScrolle4]);

    const hoverHandler1 = (flag) => setIsScrolle1(flag);
    const hoverHandler2 = (flag) => setIsScrolle2(flag);
    const hoverHandler3 = (flag) => setIsScrolle3(flag);
    const hoverHandler4 = (flag) => setIsScrolle4(flag);

    let cert_20 = props.props.domains_from_cert;
    let cert_60 = cert_20

    let boom_20 = props.props.domains_from_boom;
    let boom_60 = boom_20

    let subnet_20 = props.props.domains_from_subnet;
    let subnet_60 = subnet_20

    console.log("rem");
    console.log(window.getComputedStyle(document.documentElement)["fontSize"]);
    return (
        (props.bandwidth === 0) ?
            <div style={{ color: "white" }}><h2>loading...</h2></div>
            :
            <Frame heightZZ = "100">
                <FrameTitle value="新发现可疑网站" />
                    <Grid container spacing={0}>
                        <Grid item xs={3}>
                            <div className="paper">
                            {/* #5CD0FD */}
                                <p style={{ color: "white" }}>DNS记录</p>
                            </div>
                        </Grid>
                        <Grid item xs={3}>
                            <div className="paper">
                                <p style={{ color: "white" }}>证书共同主体</p>
                            </div>
                        </Grid>
                        <Grid item xs={3}>
                            <div className="paper">
                                <p style={{ color: "white" }}>同有子网</p>
                            </div>
                        </Grid>
                        <Grid item xs={3}>
                            <div className="paper">
                                <p style={{ color: "white" }}>域名生成</p>
                            </div>
                        </Grid>
                    </Grid>
                    <Grid container spacing={0} style={{height:"100%"}}>
                    <Grid item xs={3}  style={{height:"100%"}}>
                        <div className='parent' ref={warper1}  style={{height:"70%"}}>
                            <div className='child' ref={childDom1}>
                                <div className={classes.root}>
                                
                                    <div className="paper" id = "fromDns">
                                        <div style={{ fontSize: "16px", listStyleType: "none" }}>
                                            {     (props.props.flagLoading1 === "1")?

                                            <Loading/>
                                                                :
                                                props.props.domains_from_dns.map((value, key) => {
                                                    return (
                                                        <li
                                                            onMouseOver={() => hoverHandler1(false)}
                                                            onMouseLeave={() => hoverHandler1(true)}>
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
                        <Grid item xs={3} style={{height:"100%"}}>
                        <div className='parent' ref={warper2}  style={{height:"70%"}}>
                            <div className='child' ref={childDom2}>
                                <div className={classes.root}>
                                
                                    <div className="paper">
                                        <div style={{ fontSize: "16px", listStyleType: "none" }}>
                                            {
                                                (props.props.flagLoading2 === "1")?

                                                <Loading/>
                                                                    :

                                                cert_60.map((value, key) => {
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
                        <Grid item xs={3} style={{height:"100%"}}>
                        <div className='parent' ref={warper3}  style={{height:"70%"}}>
                            <div className='child' ref={childDom3}>
                                <div className={classes.root}>
                                
                                    <div className="paper">
                                        <div style={{ fontSize: "16px", listStyleType: "none" }}>
                                            {
                                                (props.props.flagLoading3 === "1")?

                                                <Loading/>
                                                                    :
                                                subnet_60.map((value, key) => {
                                                    return (
                                                        <li
                                                            onMouseOver={() => hoverHandler3(false)}
                                                            onMouseLeave={() => hoverHandler3(true)}>
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
                        <Grid item xs={3} style={{height:"100%"}}>
                        <div className='parent' ref={warper4}  style={{height:"70%"}}>
                            <div className='child' ref={childDom4}>
                                <div className={classes.root}>
                                
                                    <div className="paper">
                                        <div style={{ fontSize: "16px", listStyleType: "none" }}>
                                            {
                                                (props.props.flagLoading4 === "1")?

                                                <Loading/>
                                                                    :
                                                boom_60.map((value, key) => {
                                                    return (
                                                        <li
                                                            onMouseOver={() => hoverHandler4(false)}
                                                            onMouseLeave={() => hoverHandler4(true)}>
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