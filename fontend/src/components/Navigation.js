import React, {Component} from 'react';
import "../assets/css/navigation.css"
class Navigation extends Component {
    constructor(props) {
        super(props);
        this.state={
            nav_number:this.props.nav_number,
        }
    }

    render() {
        return (
            <div>
                <ul className="navigation">
                    <li>
                        <a href="#/home" className={this.state.nav_number==="p1"?"active":""}>首页</a></li>
                    <li>
                        <a href="#/statistics" className={this.state.nav_number==="p2"?"active":""}>综合数据</a></li>
                    <li>
                        <a href="#/finding" className={this.state.nav_number==="p3"?"active":""}>足迹发现</a></li>
                    <li>
                        <a href="#/exploit" className={this.state.nav_number==="p4"?"active":""}>深入挖掘</a></li>
                </ul>
            </div>
        );
    }
}

export default Navigation;