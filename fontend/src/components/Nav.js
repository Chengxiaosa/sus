import React, { Component } from 'react';
import "../assets/css/nav.css"
class Nav extends Component {
    constructor(props) {
        super(props);
        this.state={
            nav_number:this.props.nav_number,
        }
    }
    render() {
        return (
            <div id={"nav"}>
                <div><a href="#/home" className={this.state.nav_number === "p1" ? "active" : ""}>首页</a></div>
                <div><a href="#/statistics" className={this.state.nav_number === "p2" ? "active" : ""}>综合数据</a></div>
                <div><a href="#/finding" className={this.state.nav_number === "p3" ? "active" : ""}>足迹发现</a></div>
                <div><a href="#/exploit" className={this.state.nav_number === "p4" ? "active" : ""}>深入挖掘</a></div>
                <div><a href="#/cluster" className={this.state.nav_number === "p5" ? "active" : ""}>网站集群</a></div>

            </div>
        );
    }
}

export default Nav;