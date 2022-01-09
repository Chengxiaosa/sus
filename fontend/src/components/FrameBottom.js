import React, {Component} from 'react';
import "../assets/css/Frame.css"
class FrameBottom extends Component {
    render() {
        return (
            <div id="frame" style={{height:"100%"}}>
                {this.props.children}
            </div>
        );
    }
}

export default FrameBottom;