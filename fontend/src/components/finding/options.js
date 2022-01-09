import echarts from 'echarts/lib/echarts';
import { color } from 'echarts/lib/theme/light';

function ASData (params = {}){
  console.log("params")
  console.log(params)
  var ASData = new Array
  if(params.length>1){
  return ['DNS','证书','子网','域名生成']
  }else{
    console.log("params长度为0")
    // 为什么这段代码，在执行的时候 ， 会执行两轮 ，并且第一轮这个里面没有
    return ['DNS','证书','子网','域名生成']
  }

}
function possibleNum (params = {}){
  console.log("params")
  console.log(params)
  var domainData = new Array
  if(params.length>1){
    console.log("params长度不为0")
  for(var m  in params){

      var single = params[m].domainNum

      domainData.push(single)
  }
  return domainData
  }else{
    console.log("params长度为0")
    // 为什么这段代码，在执行的时候 ， 会执行两轮 ，并且第一轮这个里面没有
    return [21,31,41,51]
  }


}

function port80Num (params = {}){
  console.log("params")
  console.log(params)
  var IPData = new Array
  if(params.length>0){
    console.log("params长度不为0")

  return params.port80Num
  }else{
    console.log("params长度为0")
    // 为什么这段代码，在执行的时候 ， 会执行两轮 ，并且第一轮这个里面没有
    return [42,62,82,102]
  }
  }
  



export const AsOption = (params = {}) => (
  ASData(params)
)
export const possibleNumOption = (params = {}) => (
  possibleNum(params)
)
export const port80NumOption = (params = {}) => (
  port80Num(params)
)

