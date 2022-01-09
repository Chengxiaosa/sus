import React, {Component} from 'react';
class Img extends Component {
    render() {
        return (
            <div className={"img-div"}>
                <img src={require("../assets/images/"+this.props.src).default}  alt="" height={this.props.height}/>
            </div>

        );
    }
}

export default Img;