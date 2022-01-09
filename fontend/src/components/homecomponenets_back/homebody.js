import React, { Component } from 'react';
import Navigation from "../Navigation";
import DataStatistics from "./datastatistics"
// import RankTLD from "./rankTLD"
import RankAS from "./rankAS"
import RankIP from "./rankIP"
import Server from "./server"
import DailyData from "./dailydata";
import PayChannel from "./paychannel";
import Bank from "./bank";
import { makeStyles } from '@material-ui/core/styles';
import Paper from '@material-ui/core/Paper';
import Grid from '@material-ui/core/Grid';
import StatisticsMapData from "../StatisticsMapData";
import SystemIntro from './systemIntro';


// const useStyles = makeStyles((theme) => ({
//   root: {
//     flexGrow: 1,
//   },
//   paper: {
//     textAlign: 'center',
//     backgroundColor: '#143340',
    
//   },
// }));

export default class HomeBody extends Component {
//   const classes = useStyles();
    render(){
        return (
            (this.props.AppNum === 0 || this.props.SiteNum === 0 || this.props.Servers.bandwidth === 0 || this.props.Servers.diskRate === 0 || this.props.Servers.request === 0)?
              <div style={{color:"#ECE8EF"}}><h2>loading...</h2></div>:

        <div>
            <Grid style={{marginLeft:"5%"}}>
                <div style={{position:"relative",width:"98%",left:"-2%"}}>
                    <div className="bodypaper">
                        <div>
                            <Grid container spacing={12} style={{marginTop:"0px"}}>
                                <Grid item xs={3}>
                                    <div style={{marginTop:"13%"}}>
                                        <SystemIntro/>
                                    </div>
                                </Grid>
                                <Grid item xs={9}>
                                    <Grid container spacing={12}>
                                        <Grid item xs={12}>
                                            <div id={"area3"} style={{position:"relative",width:"108%",height:"750px",left:"-6%",top:"-6%"}}>
                                                <StatisticsMapData area={'world'} mapID={'area3'}/>
                                            </div>
                                        </Grid>
                                    </Grid>
                                    <div style={{width:"100%", marginLeft:"3%", marginTop:"-9%"}}>
                                        <Grid container spacing={3}>
                                            <Grid item xs={6}>
                                                <div className="bodypaper">
                                                    <DataStatistics AppNum={this.props.AppNum} SiteNum={this.props.SiteNum} 
                                                        dailySiteNum={this.props.dailySiteNum} dailyAppNum={this.props.dailyAppNum}/>
                                                </div>
                                            </Grid>
                                            <Grid item xs={6}>
                                                <div className="bodypaper">
                                                    <DailyData dailyDatas={this.props.dailyDatas}/>
                                                </div>
                                            </Grid>
                                        </Grid>
                                    </div>
                                </Grid>
                            </Grid>
                        </div>
                    </div>
                </div>
            </Grid>
        </div>
        );
    }
}













// import React, { Component } from 'react';
// import Navigation from "../Navigation";
// import DataStatistics from "./datastatistics"
// // import RankTLD from "./rankTLD"
// import RankAS from "./rankAS"
// import RankIP from "./rankIP"
// import Server from "./server"
// import DailyData from "./dailydata";
// import PayChannel from "./paychannel";
// import Bank from "./bank";
// import { makeStyles } from '@material-ui/core/styles';
// import Paper from '@material-ui/core/Paper';
// import Grid from '@material-ui/core/Grid';
// import StatisticsMapData from "../StatisticsMapData";
// import SystemIntro from './systemIntro';


// // const useStyles = makeStyles((theme) => ({
// //   root: {
// //     flexGrow: 1,
// //   },
// //   paper: {
// //     textAlign: 'center',
// //     backgroundColor: '#143340',
    
// //   },
// // }));

// export default class HomeBody extends Component {
// //   const classes = useStyles();
//     render(){
//         return (
//             (this.props.AppNum === 0 || this.props.SiteNum === 0 || this.props.Servers.bandwidth === 0 || this.props.Servers.diskRate === 0 || this.props.Servers.request === 0)?
//               <div style={{color:"#ECE8EF"}}><h2>loading...</h2></div>:

//         <div>
//             <Grid style={{marginLeft:"5%"}}>
//                 <div style={{position:"relative",width:"98%",left:"-2%"}}>
//                     <div className="bodypaper">
//                         <div>
//                             <Grid container spacing={3} style={{marginTop:"0px"}}>
//                                     <Grid item xs={3}>
//                                         <div style={{marginTop:"13%"}}>
//                                             <SystemIntro/>
//                                         </div>
//                                     </Grid>
//                                     <Grid item xs={9}>
//                                         <div id={"area3"} style={{position:"relative",width:"108%",height:"750px",left:"-6%",top:"-6%"}}>
//                                             <StatisticsMapData area={'world'} mapID={'area3'}/>
//                                         </div>
//                                     </Grid>
//                             </Grid>
//                         </div>
//                         <div style={{width:"100%", marginLeft:"0%", marginTop:"-7%"}}>
//                             <Grid container spacing={8}>
//                                 <Grid item xs={4}>
//                                     <div className="bodypaper">
//                                         <DataStatistics AppNum={this.props.AppNum} SiteNum={this.props.SiteNum} 
//                                             dailySiteNum={this.props.dailySiteNum} dailyAppNum={this.props.dailyAppNum}/>
//                                     </div>
//                                 </Grid>
//                                 <Grid item xs={4}>
//                                     <div className="bodypaper">
//                                         <DailyData dailyDatas={this.props.dailyDatas}/>
//                                     </div>
//                                 </Grid>
//                                 <Grid item xs={4}>
//                                     <div className="bodypaper">
//                                         <Server Servers={this.props.Servers}/>
//                                     </div>
//                                 </Grid>
//                             </Grid>
//                         </div>
//                     </div>
//                 </div>
//             </Grid>
//         </div>
//         );
//     }
// }