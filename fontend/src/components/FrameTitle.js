import React, {Component} from 'react';
import "../assets/css/Frame.css"
class FrameTitle extends Component {
    render() {
        // console.log("FrameTitle")
        // console.log(this.props.value)
        return (
            <div id="frame-title">
                <p>{this.props.value}</p>
            </div>
        );
    }
}

export default FrameTitle;