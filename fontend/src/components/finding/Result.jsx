import React, { Component } from 'react';
import { AsOption,possibleNumOption,port80NumOption}  from './options';
// 添加到配置
import { ScrollBoard } from '@jiaminghi/data-view-react';
import { Charts } from '@jiaminghi/data-view-react';
import { color } from 'echarts/lib/theme/light';
import { red } from '@material-ui/core/colors';

class ResultCategory extends Component {

  constructor(props) {
    super(props);
    this.state = {
      config: {
        // 表头背景色
        // headerBGC: '#443dc5',
        // 奇数行背景色
        oddRowBGC: '#09184F',
        // 偶数行背景色
        evenRowBGC: '#070C34',
        // 行号
        index: true,
        // 行号表头
        indexHeader: '排名',
        // 宽度
        columnWidth: [50, 100, 200],
        // 对其方式
        align: ['center'],
        // 表行数
        rowNum: 10,
      },
      option:{
        legend: {
          data: ['80端口存活', '总生成网站'],
          textStyle:{
            fill:'#fff'
          }
        },
        xAxis: {
          name: '聚类',
          data: ['DNS', '证书', '共有子网', '域名生成'],
          textStyle:{
            fill:'#fff'
          },
          axisLabel: {
            style: {
              rotate: 20,
              textAlign: 'left',
              textBaseline: 'top',
              fill: '#fff',
              fontSize:11,
              fontStyle:'oblique'
            },
          },
          axisLine:{
            style:{
              stroke: '#fff'
            }
          }
        },
        yAxis: {
          name: '数量',
          data: 'value',
          min: 0,
          // max: 20,
          // interval: 5,
          splitLine: {
            style: {
              lineDash: [3,3],
              fill: '#fff'
            }
          },
          axisLabel: {
            formatter: '{value} ',
            style:{
              fill: '#fff',
              fontSize:'11'
            }
          },
          axisTick: {
            show: false
          },
          axisLine:{
            style:{
              stroke: '#fff'
            }
          }
        },
        series: [
          {
            name: '80端口存活',
            data: [0, 0, 0, 0],
            type: 'bar',
            stack: 'a'
          },
          {
            name: '总生成网站',
            data: [0, 0, 0, 0],
            type: 'bar',
            stack: 'b',
            lable:{
              show:true,
              formatter:'{value}',
              fill: '#fff'
            }
          }
        ]
        }
    };
  //   saveUpdate=(num)=>{
  //     this.setState({
  //       option.series[0]:
        
  //     })
  // }
    
    
  }

  render() {
    console.log("possible变化")
    const { AsData } = this.props;
    // // const option = AS
    console.log("possible变化InResult")
    console.log(this.props.possible)
    console.log(this.props.port80)
    if(JSON.stringify(AsData) === '{}'){
    console.log("这个地方没有值")
    }else{
      
      // this.state.option.xAxis.data = AsOption(AsData)
      this.state.option.series[1].data = this.props.possible
      this.state.option.series[0].data =  this.props.port80
    }
    // 为什么这里要这么写才不会出错？？？
    const config = {
      ...this.state.option
    };
    return (
          // <Charts option={config}             
          // style={{
          //   width: '6.5rem',
          //   height: '5.25rem',
          //   marginLeft:'0.1rem',
          //   marginTop:'-0.2rem'
          // }} />
          <Charts option={config}  

          style={{

            height: '98%',
            marginTop:'-5%'
          }} 
          />
    );
  }
}

class ResultCategory2 extends Component {

  constructor(props) {
    super(props);
    this.state = {
      config: {
        // 表头背景色
        // headerBGC: '#443dc5',
        // 奇数行背景色
        oddRowBGC: '#09184F',
        // 偶数行背景色
        evenRowBGC: '#070C34',
        // 行号
        index: true,
        // 行号表头
        indexHeader: '排名',
        // 宽度
        columnWidth: [50, 100, 200],
        // 对其方式
        align: ['center'],
        // 表行数
        rowNum: 10,
      },
      option:{
        legend: {
          data: ['高危网站', '可疑网站'],
          textStyle:{
            fill:'#fff'
          }
        },
        xAxis: {
          name: '聚类',
          data: ['DNS', '证书', '共有子网', '域名生成'],
          textStyle:{
            fill:'#fff'
          },
          axisLabel: {
            style: {
              rotate: 20,
              textAlign: 'left',
              textBaseline: 'top',
              fill: '#fff',
              fontSize:11,
              fontStyle:'oblique'
            },
          },
          axisLine:{
            style:{
              stroke: '#fff'
            }
          }
        },
        yAxis: {
          name: '数量',
          data: 'value',
          min: 0,
          // max: 20,
          // interval: 5,
          splitLine: {
            style: {
              lineDash: [3,3],
              fill: '#fff'
            }
          },
          axisLabel: {
            formatter: '{value} ',
            style:{
              fill: '#fff',
              fontSize:'11'
            }
          },
          axisTick: {
            show: false
          },
          axisLine:{
            style:{
              stroke: '#fff'
            }
          }
        },
        series: [
          {
            name: '高危网站',
            data: [0, 0, 0, 0],
            type: 'bar',
            stack: 'a'
          },
          {
            name: '可疑网站',
            data: [0, 0, 0, 0],
            type: 'bar',
            stack: 'b',
            lable:{
              show:true,
              formatter:'{value}',
              fill: '#fff'
            }
          }
        ]
        }
    };
  //   saveUpdate=(num)=>{
  //     this.setState({
  //       option.series[0]:
        
  //     })
  // }
    
    
  }

  render() {
    console.log("possible变化")
    const { AsData } = this.props;
    // // const option = AS
    console.log("possible变化InResult")
    console.log(this.props.possible)
    console.log(this.props.port80)
    if(JSON.stringify(AsData) === '{}'){
    console.log("这个地方没有值")
    }else{
      
      // this.state.option.xAxis.data = AsOption(AsData)
      this.state.option.series[1].data = this.props.possible
      this.state.option.series[0].data =  this.props.port80
    }
    // 为什么这里要这么写才不会出错？？？
    const config = {
      ...this.state.option
    };
    return (
          // <Charts option={config}             
          // style={{
          //   width: '6.5rem',
          //   height: '5.25rem',
          //   marginLeft:'0.1rem',
          //   marginTop:'-0.2rem'
          // }} />
          <Charts option={config}  

          style={{

            height: '98%',
            marginTop:'-5%'
          }} 
          />
    );
  }
}


export {ResultCategory,ResultCategory2};
