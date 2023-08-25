// /**  * @param {number[]} nums  * @return {number}  */ var findMaxConsecutiveOnes = function (nums) 
// { let counter = 0; 
//     let lowerindex = 0; 
//     let higherindex = 0; 
//     let max = 0; 
//     for (let i = 0; i < nums.length; i++) 
//     { if (nums[i] !== 1) { higherindex = i - 1; let diff = higherindex - lowerindex + 1; 
//         if (counter < diff) { counter = diff; } lowerindex = i + 1; 
//     } 
//     return counter;



// }     // check the last element     if (nums[nums.length - 1] === 1) {         let diff = nums.length - lowerindex;         if (counter < diff) {             counter = diff;         }     }     return counter; };
// var findMaxConsecutiveOnes = function(nums) {
//     let counter=0
//     let lowerindex=0;
//     let higherindex=0;
//     nums.forEach((num,index)=>{
//         if(num!==0){
//             higherindex=index;
//             let diff=Math.abs((higherindex-lowerindex+1))
//             if(counter<=diff){
//                 counter=diff;
//             }
//             else{

//                 lowerindex=index+1;
//             }
//         }
//     })
//     return counter;
// };
// console.log(findMaxConsecutiveOnes([1,1,0,1,1,1]))
// var findMaxConsecutiveOnes = function(nums) {
//     let counter=0
//     let lowerindex=0;
//     let higherindex=0;
//     nums.forEach((num,index)=>{
//         if(num!==0){
//             higherindex=index;
//             let diff=Math.abs((higherindex-lowerindex+1))
//             if(counter<=diff){
//                 counter=diff;
//             }
//         } else {
//             lowerindex=index+1; 
//         }
//     })
//     return counter;
// };
// console.log(findMaxConsecutiveOnes([1,1,0,1,1,1])) // should print 3
// var findNumbers = function(nums) {
 
//      return nums.reduce((totalvalue,curnum)=>{
//         if((curnum%10)%2==0){
//             return (totalvalue+1)
//          }
//          else{
//              return totalvalue
//          }
//     },0)
    
// };test
var findNumbers = function(nums) {
    return nums.reduce((totalvalue,curnum)=>{
        
        if((curnum.toString().length)%2==0){
            return (totalvalue+1)
         }
         else{
             return totalvalue
         }
    },0)
};
console.log(findNumbers([12,345,2,6,7896]))