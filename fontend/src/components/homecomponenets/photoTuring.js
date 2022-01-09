// 获取图片组。
// 获取按钮*2。
// 获取圆点组。
console.log("in PhotoTuring")
let imgGroup=document.getElementsByClassName('carousel_item');
let btnLeft=document.getElementsByClassName('left')[0];
let btnRight=document.getElementsByClassName("right")[0];
let pointGroup=document.getElementsByClassName("points_item");

// console.log(imgGroup, btnLeft,btnRight,pointGroup);获取的元素是正确的
let index=0;//初始化一个索引值，用于切换图片。
let clearActive=function(){
    for(let i=0;i<imgGroup.length;i++){
        imgGroup[i].className="carousel_item";
        pointGroup[i].className="points_item";
    }
}
let goRight=function () {
    clearActive();
    if(index<4){index++;}
    else {index=0;}
    imgGroup[index].className="carousel_item active";
    pointGroup[index].className="points_item active";
}
let goRight_auto=goRight;
btnRight.addEventListener("click",goRight);

let goLeft=function () {
    clearActive();
    if(index>0){index--;}
    else {index=4;}
    imgGroup[index].className="carousel_item active";
    pointGroup[index].className="points_item active";
}

btnLeft.addEventListener("click",goLeft);


setInterval(function () {
    goRight_auto();
},5000);

let carouselContainer=document.getElementsByClassName("carousel_container")[0];
for(let i=0;i<pointGroup.length;i++){
    pointGroup[i].addEventListener("click",function(){
        index=this.getAttribute("data-index")-1;
        goRight();
    })
}


carouselContainer.addEventListener('mouseover',function () {
    goRight_auto=function(){};
});
carouselContainer.addEventListener('mouseleave',function () {
    goRight_auto=goRight;
});



