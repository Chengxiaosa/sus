import React, {Component} from 'react';
import Grid from '@material-ui/core/Grid';

class Visitnum extends Component {
    constructor(props) {
        super(props);
        this.state={
            peopleNum:this.props.peopleNum,
            num: this.props.peopleNum.toString(),
            len: this.props.peopleNum.toString().length
        }
    }
    componentDidMount () {
        console.log(this.state.len);
        console.log(this.state.peopleNum);
    }
    render() {
        var temp = this.state.num;
        var items = [];
        for (var i = 0; i < this.state.len; i++){
            items.push(
                <div className="visitnum"><div className="Num">{temp[i]}</div></div>
                );
        }
        return (

            <div style={{position:"relative",float:"left",width:"100%"}}>
            
               {items}
            
            </div>
        );
    }
}

export default Visitnum;