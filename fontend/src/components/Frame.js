import React, {Component} from 'react';
import "../assets/css/Frame.css"
class Frame extends Component {
    render() {
        return this.props.heightZZ? (
            <div id="frame"  style={{height:'100%'}}>
                {this.props.children}
            </div>
        ):(
            <div id="frame"  >
                {this.props.children}
            </div>
        )
    }
}

export default Frame;