function A (params = {}){
    var SumCity = new Array
    for(var m  in params){
        var single = {
            name:params[m].city,
            value:params[m].ipNum

        }
        SumCity.push(single)
    }
    
    return SumCity


}


export const cityOption = (params = {}) => ({
    data:A(params)
});

// function cityOption(paramas){
// // var packJson=[{"name":"9999"}]
// // return{data:packJson}
// }

// export default cityOption 