import React, {Component} from 'react';
import ReactDOM from "react-dom"
import Img7 from "../imgs/7.png";
import Img8 from "../imgs/8.png";
import Img8_0 from "../imgs/8.0.png";
import Img9_0 from "../imgs/9.0.png";
import Img9 from "../imgs/9.png";
import Grid from '@material-ui/core/Grid';
import frame from "../imgs/phone_frame.png"
import pcframe from "../imgs/pcframe.png"
import search from "../imgs/search_pro.png"
import mark from "../imgs/mark.png"
import "../assets/css/anim.css"

export default class SiteOrApp extends Component {
    constructor(props) {
        super(props);
        this.state={
            screenshotsite:this.props.sitescreen,
            screenshotapp:this.props.appscreen,
            f_display:"block",
            e_display:"none",
            a_display:"block",
            b_display:"none",
            display: ["none","none","none","none","none","none","none","none","none","none"],
            //display2: ["flex","flex","flex","flex","flex","flex","flex","flex","flex","flex"],
            display2: ["none","none","none","none","none","none","none","none","none","none"],
            percent: 0,
            percent2: 0,
            active:1,
            flag:false,
            flag2:false,
            icon:"none",
        }
    }
    addTab2 = () => {
        if (this.state.display2[0] == "none" && this.state.display2[9] == "none") {
            this.state.display2[0] = "flex"
            this.setState({
                display2: this.state.display2
            });
            //this.increase2()
        }else if(this.state.display2[1] == "none"){
            this.state.display2[1] = "flex"
            this.setState({
                display2: this.state.display2
            });
            this.increase2()
        }else if(this.state.display2[2] == "none"){
            this.state.display2[2] = "flex"
            this.setState({
                display2: this.state.display2
            });
            this.increase2()
        }else if(this.state.display2[3] == "none"){
            this.state.display2[3] = "flex"
            this.setState({
                display2: this.state.display2
            });
            this.increase2()
        }else if(this.state.display2[4] == "none"){
            this.state.display2[4] = "flex"
            this.setState({
                display2: this.state.display2
            });
            this.increase2()
        }else if(this.state.display2[5] == "none"){
            this.state.display2[5] = "flex"
            this.setState({
                display2: this.state.display2
            });
            this.increase2()
        }else if(this.state.display2[6] == "none"){
            this.state.display2[6] = "flex"
            this.setState({
                display2: this.state.display2
            });
            this.increase2()
        }else if(this.state.flag2 == false){
            this.setState({
                flag2: true
            });
        }else if(this.state.display2[7] == "none"){
            this.state.display2[7] = "flex"
            this.setState({
                display2: this.state.display2
            });
            this.increase2()
        }else if(this.state.display2[8] == "none"){
            this.state.display2[8] = "flex"
            this.setState({
                display2: this.state.display2
            });
            this.increase2()
        }else if(this.state.display2[9] == "none"){
            this.state.display2[9] = "flex"
            this.state.display2[0] = "none"
            this.setState({
                display2: this.state.display2
            });
            this.increase2()
        }else{
            this.setState({
                a_display: "none",
                b_display: "block",
            });
            clearInterval(this.id2);
            return;
        }
    }
    addTab = () => {
        if (this.state.display[8] == "none" && this.state.display[9] == "none") {
            this.state.display[8] = "flex"
            this.setState({
                display: this.state.display
            });
            //this.increase()
        }else if(this.state.display[0] == "none"){
            this.state.display[0] = "flex"
            this.setState({
                display: this.state.display
            });
            this.increase()
        }else if(this.state.display[1] == "none"){
            this.state.display[1] = "flex"
            this.setState({
                display: this.state.display
            });
            this.increase()
        }else if(this.state.display[2] == "none"){
            this.state.display[2] = "flex"
            this.setState({
                display: this.state.display
            });
            this.increase()
        }else if(this.state.display[3] == "none"){
            this.state.display[3] = "flex"
            this.setState({
                display: this.state.display
            });
            this.increase()
        }else if(this.state.display[4] == "none"){
            this.state.display[4] = "flex"
            this.setState({
                display: this.state.display
            });
            this.increase()
        }else if(this.state.display[6] == "none"){
            this.state.display[6] = "flex"
            this.setState({
                display: this.state.display
            });
            this.increase()
        }else if(this.state.display[7] == "none"){
            this.state.display[7] = "flex"
            this.setState({
                display: this.state.display
            });
            this.increase()
        }else if(this.state.display[7] == "flex" && this.state.display[8] == "flex"){
            this.state.display[9] = "flex"
            this.state.display[8] = "none"
            this.setState({
                display: this.state.display
            });
            this.increase()
        }else{
            console.log(1111)
            this.setState({
                f_display: "none",
                e_display: "block",
                flag: true
            });
            clearInterval(this.id);
            return;
        }
    }
    componentDidMount() {
        this.func()
        this.func2()
    }
    func = () => {
        this.id = setInterval(this.addTab,1000);
    }
    func2 = () => {
        this.id2 = setInterval(this.addTab2,850);
    }
    handleOnclick(value){
        this.props.grandfatherChange(value)
    }
    increase = () => {
        const percent = this.state.percent;
        const targetPercent = percent >= 85.7 ? 100 : percent + 14.3;
        const speed = (targetPercent - percent) / 400;
        let start = null;
        const animate = timestamp => {
            if (!start) start = timestamp;
            const progress = timestamp - start;
            const currentProgress = Math.min(parseInt(speed * progress + percent, 14.3), targetPercent);
            this.setState({
                percent: currentProgress
            });
            if (currentProgress < targetPercent) {
                window.requestAnimationFrame(animate);
            }
        };
        window.requestAnimationFrame(animate);
    }
    increase2 = () => {
        const percent2 = this.state.percent2;
        const targetPercent = percent2 >= 89 ? 100 : percent2 + 11.2;
        const speed = (targetPercent - percent2) / 400;
        let start = null;
        const animate = timestamp => {
            if (!start) start = timestamp;
            const progress = timestamp - start;
            const currentProgress = Math.min(parseInt(speed * progress + percent2, 11.2), targetPercent);
            this.setState({
                percent2: currentProgress
            });
            if (currentProgress < targetPercent) {
                window.requestAnimationFrame(animate);
            }
        };
        window.requestAnimationFrame(animate);
    
    }
    render() {
        const { percent,percent2} = this.state;
        return (
            (this.state.display2 == undefined)
            ? <div style={{color:"white"}}><h2>loading...</h2></div>
            :
            <div id="roo" style={{}}>
                <div style={{alignItems:"center",display:"flex"}}>
                    {/* <img src={Img7} className="img7" alt=""/> */}
                    <input type="text" className="input" value="48665gs.com" id={this.props.active===1?"show_input":""}>{}</input>
                    <input type="text" className="input" value="1616909407980.apk" id={this.props.active===2?"show_input":""}>{}</input>
                    {/* <img src={this.props.active===1?Img8:Img8_0} className="img8" alt="" onClick={this.handleOnclick.bind(this,1)}/>
                    <img src={this.props.active===2?Img9_0:Img9} className="img9" alt="" onClick={this.handleOnclick.bind(this,2)}/> */}
                </div>
                <br></br>
                {
                    this.props.active===1?
                    <div className="pcframe">                       
                        <div style={{position:"relative",width:"100%",marginTop:"20px"}}>
                            <img src={pcframe} style={{position:"relative",width:"100%",zIndex:"99"}}/>
                        </div>

                        <div style={{display:this.state.f_display}}>
                            <div class="ball ball1">
                                {/* <img style={{width:"50%"}} src={search}/> */}
                            </div>
                            <h3 style={{position:"absolute",color:"#8ef0f8",zIndex:"99",left:"35%",top:"36%",width:"98%"}}>自动挖掘中......</h3>
                        </div>

                        <div style={{display:this.state.e_display}}>
                            <img style={{position:"absolute",left:"43%",top:"35%",width:"10%",zIndex:"99"}} src={search}/>
                            <h3 style={{position:"absolute",color:"#8ef0f8",zIndex:"99",left:"42%",top:"48%",width:"38%"}}>检测完毕</h3>
                        </div>

                        <img src={this.props.screenshotsite} style={{opacity:"0.5",position:"absolute",left:"1.6%",top:"9%",width:"98%"}}/>
                        <div style={{position:"absolute",width:"100%"}}>
                            <br></br>
                            <br></br>
                            <div className="progress">
                                <div className="progress-wrapper" >
                                    <div className="progress-inner" style = {{width: `${percent}%`}} ></div>
                                </div>
                                <div className="progress-info" >{percent}%</div>
                            </div>
                            <br></br>
                            
                            <div style={{display:"flex"}}>
                                <Grid item xs={6}>
                                    <div class="info" style={{marginTop:"25px",display:this.state.display[8]}}>
                                        <p style={{color:"white",fontSize:"20px"}}><b>正在挖掘网站相关信息</b></p>
                                    </div>
                                    <div class="info" style={{marginTop:"25px",display:this.state.display[9]}}>     
                                        <Grid item xs={9}>
                                            <p style={{color:"white",fontSize:"20px"}}><b>挖掘完毕</b></p>
                                        </Grid>
                                        <Grid item xs={2}>
                                            <img src={mark} className="mark3"/>
                                        </Grid>
                                    </div>
                                    <div class="info" style={{display:this.state.display[0],left:"10%"}}>
                                        <Grid item xs={8}>
                                        <span style={{color:"white",fontSize:"18px"}}>IP地址</span>
                                        </Grid>
                                        <Grid item xs={2}>
                                            <img src={mark} className="mark"/>
                                        </Grid>
                                    </div>
                                    <div class="info" style={{display:this.state.display[1],left:"10%"}}>
                                        <Grid item xs={8}>
                                        <span style={{color:"white",fontSize:"18px"}}>注册商相关信息</span>
                                        </Grid>
                                        <Grid item xs={2}>
                                            <img src={mark} className="mark"/>
                                        </Grid>
                                    </div>
                                    <div class="info" style={{display:this.state.display[2],left:"10%"}}>
                                        <Grid item xs={8}>
                                        <span style={{color:"white",fontSize:"18px"}}>真实服务器地址</span>
                                        </Grid>
                                        <Grid item xs={2}>
                                            <img src={mark} className="mark"/>
                                        </Grid>
                                    </div>
                                    <div class="info" style={{display:this.state.display[3],left:"10%"}}>
                                        <Grid item xs={8}>
                                        <span style={{color:"white",fontSize:"18px"}}>网站类型</span>
                                        </Grid>
                                        <Grid item xs={2}>
                                            <img src={mark} className="mark"/>
                                        </Grid>
                                    </div>
                                </Grid>
                                <Grid item xs={6}>
                                <div style={{position:"relative", left:"5%"}}>
                                    <div class="info" style={{display:this.state.display[4],marginTop:"90px"}}>
                                        <Grid item xs={10}>
                                        <span style={{color:"white",fontSize:"18px"}}>网站信息</span>
                                        </Grid>
                                        <Grid item xs={2}>
                                            <img src={mark} className="mark"/>
                                        </Grid>
                                    </div> 
                                    <div class="info" style={{display:this.state.display[6]}}>
                                        <Grid item xs={10}>
                                        <span style={{color:"white",fontSize:"18px"}}>网站证书信息</span>
                                        </Grid>
                                        <Grid item xs={2}>
                                            <img src={mark} className="mark"/>
                                        </Grid>
                                    </div>
                                    <div class="info" style={{display:this.state.display[7]}}>
                                        <Grid item xs={10}>
                                        <span style={{color:"white",fontSize:"18px"}}>潜在同伙网站</span>
                                        </Grid>
                                        <Grid item xs={2}>
                                            <img src={mark} className="mark"/>
                                        </Grid>
                                    </div>
                                    <br></br>
                                    <br></br>
                                    </div>              
                                </Grid>                    
                            </div>
                        </div>
                    </div>
                    :
                    <div style={{position:"relative"}}>
                        <div className="phoneframe">
                            <div style={{position:"relative",width:"100%"}} >
                                <img src={frame} style={{position:"relative",width:"99%",zIndex:"99"}}/>
                            </div>
                            <img src={this.props.screenshotsite} style={{position:"absolute",top:"4.2%",left:"3%",width:"93%", height:"92%"}}/>
                            
                            <div style={{display:this.state.b_display}}>
                                <img style={{position:"absolute",left:"37%",top:"35%",width:"20%",zIndex:"99"}} src={search}/>
                                <h3 style={{position:"absolute",color:"#8ef0f8",fontSize:"20px",zIndex:"99",left:"32%",top:"43%",width:"98%"}}>挖掘完毕</h3>
                            </div>
                            <div style={{display:this.state.a_display}}>
                                <div class="ball0 ball2">
                                    <img style={{width:"80%"}} src={search}/>
                                </div>
                                <h3 style={{position:"absolute",fontSize:"20px",color:"#8ef0f8",zIndex:"99",left:"-2%",top:"40%",width:"110%"}}>深度挖掘诈骗相关信息</h3>
                            </div>
                        </div>
                        <br></br>
                        <div className="progress1">
                            <div className="progress-wrapper" >
                                <div className="progress-inner" style = {{width: `${percent2}%`}} ></div>
                            </div>
                            <div className="progress-info" >{percent}%</div>
                        </div>

                        <div style={{display:"flex"}}>
                        <Grid item xs={6}>
                            <div class="info" style={{marginTop:"30px",display:this.state.display2[0]}}>
                                <p style={{color:"white",fontSize:"20px"}}><b>正在挖掘相关信息</b></p>
                            </div>
                            <div class="info" style={{marginTop:"25px",display:this.state.display2[9]}}>     
                                <Grid item xs={9}>
                                    <p style={{color:"white",fontSize:"20px"}}><b>挖掘完毕</b></p>
                                </Grid>
                                <Grid item xs={2}>
                                    <img src={mark} className="mark4"/>
                                </Grid>
                            </div>
                            <div class="info1" style={{display:this.state.display2[1]}}>
                                <Grid item xs={8}>
                                <span style={{color:"white",fontSize:"18px"}}>IP地址</span>
                                </Grid>
                                <Grid item xs={2}>
                                    <img src={mark} className="mark1"/>
                                </Grid>
                            </div>
                            <div class="info1" style={{display:this.state.display2[2]}}>
                                <Grid item xs={8}>
                                <span style={{color:"white",fontSize:"18px"}}>网站主体信息</span>
                                </Grid>
                                <Grid item xs={2}>
                                    <img src={mark} className="mark1"/>
                                </Grid>
                            </div>
                            <div class="info1" style={{display:this.state.display2[3]}}>
                                <Grid item xs={8}>
                                <span style={{color:"white",fontSize:"18px"}}>后台服务器地址</span>
                                </Grid>
                                <Grid item xs={2}>
                                    <img src={mark} className="mark1"/>
                                </Grid>
                            </div>
                            <div class="info1" style={{display:this.state.display2[4]}}>
                                <Grid item xs={8}>
                                <span style={{color:"white",fontSize:"18px"}}>网站类型</span>
                                </Grid>
                                <Grid item xs={2}>
                                    <img src={mark} className="mark1"/>
                                </Grid>
                            </div>
                            
                            </Grid>                                
                            <Grid item xs={6}>
                            <div style={{position:"relative", left:"5%"}}>
                                <div class="info2" style={{display:this.state.display2[5],marginTop:"95px"}}>
                                    <Grid item xs={8}>
                                    <span style={{color:"white",fontSize:"18px"}}>证书类型</span>
                                    </Grid>
                                    <Grid item xs={2}>
                                        <img src={mark} className="mark2"/>
                                    </Grid>
                                </div>
                                <div class="info2" style={{display:this.state.display2[6]}}>
                                    <Grid item xs={8}>
                                    <span className="dig">证书颁发者</span>
                                    </Grid>
                                    <Grid item xs={2}>
                                        <img src={mark} className="mark2"/>
                                    </Grid>
                                </div>
                                <div class="info2" style={{display:this.state.display2[7]}}>
                                    <Grid item xs={8}>
                                    <span className="dig">证书序列号</span>
                                    </Grid>
                                    <Grid item xs={2}>
                                        <img src={mark} style={{}} className="mark2"/>
                                    </Grid>
                                </div>
                                <div class="info2" style={{display:this.state.display2[8]}}>
                                    <Grid item xs={8}>
                                    <span className="dig">潜在同伙网站</span>
                                    </Grid>
                                    <Grid item xs={2}>
                                        <img src={mark} className="mark2"/>
                                    </Grid>
                                </div>
                                <br></br>
                                <br></br>
                                </div>
                            </Grid>                               
                        </div>
                    </div>
                }             
            </div>
        );
    }
}
