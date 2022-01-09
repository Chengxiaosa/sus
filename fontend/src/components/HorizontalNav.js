import React, {Component} from 'react';
import "../assets/css/horizontalNav.css"
class HorizontalNav extends Component {
    handleOnclick(value){
        this.props.grandfatherChange(value)
    }
    render() {
        return (
            <div id={"horizontal-nav"}>
                <div><a onClick={this.handleOnclick.bind(this,1)} className={this.props.active===1?"active":""}>&emsp;全球&emsp;</a></div>
                <div><a onClick={this.handleOnclick.bind(this,2)} className={this.props.active===2?"active":""}>&emsp;境内&emsp;</a></div>
            </div>
        );
    }
}

export default HorizontalNav;