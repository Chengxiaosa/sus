import axios from 'axios'

const myAxios = axios.create({
    baseURL:'',
    headers:{}
})

//拦截器
myAxios.interceptors.request.use(function(config){
    return config
},function(err){
    return Promise.reject(err)
})

myAxios.interceptors.response.use(function(response){
    return response
},function(err){
    return Promise.reject(err)
})

export default myAxios