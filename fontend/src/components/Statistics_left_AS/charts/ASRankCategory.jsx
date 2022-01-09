import React, { PureComponent } from 'react';
import { AsOption,IPNumOption,domainOption}  from './options';
// 添加到配置
import { ScrollBoard } from '@jiaminghi/data-view-react';
import { Charts } from '@jiaminghi/data-view-react';
import { color } from 'echarts/lib/theme/light';
import { red } from '@material-ui/core/colors';

class ASRankCategory extends PureComponent {
  constructor(props) {
    super(props);
    this.state = {
      config: {
        // 表头背景色
        headerBGC: '#443dc5',
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
        // data:A(params)
        // console.log(params)
          // title: {
          //   text: 'AS域名与IP数量图',
          //   color:['#c3dbff'],
          //   style:{
          //     fill: '#fff'
          //   },
          //   show:''
        
          // },
          legend: {
            data: ['域名数', 'IP数'],
            show:'false',
            bottom: 10,
            textStyle:{
              fill:'#fff'
            }
          },
          xAxis: {
            data: [
            "一月份", "二月份", "二月份", "二月份", '五月份', '六月份',
            '七月份', '八月份', '九月份', '十月份'
            ],
            textStyle:{
              fill:'#fff'
            },
            // data:ASData(params),
            // 为什么这里写成调用函数就会导致内存泄漏？？？？
            axisLabel: {
              style: {
                rotate: 20,
                textAlign: 'left',
                textBaseline: 'top',
                fill: '#fff',
                fontSize:11,
                fontStyle:'oblique'
              },
              // show:'true'
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
          yAxis: [
            {
              name: '域名数',
              data: 'value',
              min: 10000,
              max: 160000,
              interval: 10000,
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
            {
              name: 'IP数',
              data: 'value',
              position: 'right',
              min: 5000,
              max: 40000,
              interval: 5000,
              splitLine: {
                show: false
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
            }
          ],
          series: [
            {
              name: '域名数',
              data: [
                175, 125, 90, 130, 45, 65,
                65, 47, 50, 52
              ],
              // data:domainNum(params),
              type: 'bar',
              gradient: {
                color: ['#37a2da', '#67e0e3']
              },
              animationCurve: 'easeOutBounce'
            },
            {
              name: 'IP数',
              data: [
              23, 18, 16, 14, 10, 8,
              6, 6, 6, 6
              ],
              // data:IPNum(params),
              type: 'line',
              yAxisIndex: 1,
              animationCurve: 'easeOutBounce'
            }
          ]
        }
    };

    
    
  }

  render() {
    console.log("这个地方会执行两次")
    const { AsData } = this.props;
    // // const option = AS
    console.log("AsDataInAsrankcategory")
    console.log(AsData)
    if(JSON.stringify(AsData) === '{}'){
    console.log("这个地方没有值")
    }else{
      
      this.state.option.xAxis.data = AsOption(AsData)
      this.state.option.series[1].data = IPNumOption(AsData)
      this.state.option.series[0].data = domainOption(AsData)
    }
    // 为什么这里要这么写才不会出错？？？
    const config = {
      ...this.state.option
    };
    return (
      AsData ? (
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
        ) : (
          ''
        )
    );
  }
}

export default ASRankCategory;
