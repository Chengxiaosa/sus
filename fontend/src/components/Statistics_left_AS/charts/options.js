import echarts from 'echarts/lib/echarts';
import { color } from 'echarts/lib/theme/light';

function ASData (params = {}){
  console.log("params")
  console.log(params)
  var ASData = new Array
  if(params.length>1){
  for(var m  in params){

      var single = params[m].asName

      ASData.push(single)
  }
  console.log(ASData.length)
  console.log(ASData)
  return ASData
  }else{
    console.log("params长度为0")
    // 为什么这段代码，在执行的时候 ， 会执行两轮 ，并且第一轮这个里面没有
    return ['111','111','111','111','111','111','111','111','111','111']
  }

}
function domainNum (params = {}){
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
    return [21,31,41,51,16,17,18,19,10,12]
  }


}

function IPNum (params = {}){
  var IPData = new Array
  if(params.length>1){
    console.log("params长度不为0")
  for(var m  in params){

      var single = params[m].ipNum

      IPData.push(single)
  }
  return IPData
  }else{
    console.log("params长度为0")
    // 为什么这段代码，在执行的时候 ， 会执行两轮 ，并且第一轮这个里面没有
    return [21,31,41,51,16,17,18,19,10,12]
  }
  }
  



export const AsOption = (params = {}) => (
  ASData(params)
)
export const IPNumOption = (params = {}) => (
  IPNum(params)
)
export const domainOption = (params = {}) => (
  domainNum(params)
)

