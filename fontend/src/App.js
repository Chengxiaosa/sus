import React, {Component} from 'react';
import ReactDOM from 'react-dom'
import Dailyfinding from "./pages/Dailyfinding";
import Exploitpage from "./pages/Exploitpage";
import Homepage from "./pages/Homepage";
import Statistics from "./pages/Statistics";
import ClusterPage from "./pages/Cluster";

import {Route,Router,hashHistory,IndexRoute} from "react-router";
import axios from "./Utils/axios";

React.axios = axios

function Test(){
    console.log("Test多次执行")
    return <div />
}
// const appRouter=<Router history={hashHistory}>
const appRouter=<Router history={hashHistory}>
    <Route path="/">
        <IndexRoute component={Homepage}/>
        <Route path="home" component={Homepage}></Route>
        <Route path="finding" component={Dailyfinding}></Route>
        <Route path="exploit" component={Exploitpage}></Route>
        <Route path="statistics" component={Statistics}></Route>
        <Route path="cluster" component={ClusterPage}></Route>

    </Route>

</Router>
console.log("多次执行APP")
ReactDOM.render(
    appRouter,
    document.getElementById('root')
);

