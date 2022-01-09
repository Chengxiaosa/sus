import React,{Component} from 'react';
import ReactDOM from 'react-dom';
import { Map, Marker } from 'react-amap';

class Location extends Component {
  constructor (props) {
    super(props)
    this.state = {
      ip:this.props.ip,
      sitecenter:this.props.sitecenter,
      appcenter:this.props.appcenter,
    }
  }
  render() {
      (this.state.sitecenter == '' || this.state.appcenter == '')
      ? <div style={{color:"white"}}>loading...</div>
      : 
      console.log(this.props.sitecenter)
      if(this.props.flag == "site"){
        return (
          <div>
          <p className="text6">IP定位地点 :   <b>{this.props.siteaddress}</b></p>
            <div id="map" style={{ width: '100%', height: '220px', position: 'relative',display:"block" }}>
              <Map zoom={4} center={this.props.sitecenter} amapkey="a1538be955e5ace2256f15972571046d">
                <Marker marker={this.props.sitecenter}/>
              </Map>
            </div>
          </div>
        )
      }else {
          return (

        <div>
        <p className="text6">ip定位地点 :   <b>{this.props.appaddress}</b></p>
          <div id="map" style={{ width: '100%', height: '180px', position: 'relative',display:"block" }}>
            <Map zoom={4} center={this.props.appcenter} amapkey="a1538be955e5ace2256f15972571046d">
              <Marker marker={this.props.appcenter}/>
            </Map>
          </div>
        </div>
        )
      }

  }
}

export default Location
