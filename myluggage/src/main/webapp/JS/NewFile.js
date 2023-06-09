let count = 0; 

const value = document.querySelector('#value') ;
const btns1 = document.querySelectorAll(".btn1") ; 

btns1.forEach(function(btn){
     btn.addEventListener('click',function(e){
     	const styles = e.currentTarget.classList ;   
     	if(styles.contains('decrease')){
     		count-- ;
     	} 
     	else if(styles.contains('increase')){
     		count++ ;
     	}  
     	 else{
     		count = 0  ;
     	}  
     	if(count>0){
     		value.style.color = 'green' ;
     	} 
     	if(count<0){
     		value.style.color = 'red' ;
               count=0;
     	} 
     	if(count===0){
     		value.style.color = '#222' ;
     	}
     	value.textContent =count ;
     }) ;
}) ;


let count2 = 0; 

const value2 = document.querySelector('#value2') ;
const btns2 = document.querySelectorAll(".btn2") ; 

btns2.forEach(function(btn2){
     btn2.addEventListener('click',function(e){
          const styles = e.currentTarget.classList ;   
          if(styles.contains('decrease')){
               count2-- ;
          } 
          else if(styles.contains('increase')){
               count2++ ;
          }  
           else{
               count2 = 0  ;
          }  
          if(count2>0){
               value2.style.color = 'green' ;
          } 
          if(count2<0){
               value2.style.color = 'red' ;
               count2=0;
          } 
          if(count2===0){
               value2.style.color = '#222' ;
          }
          value2.textContent =count2 ;
     }) ;
}) ;

function myfun(){
const value1 = document.querySelector('#value').textContent ;     
const value2 = document.querySelector('#value2').textContent ; 
const date = document.getElementById("myDate").value ; 
 console.log(value1);
 console.log(value2);
  console.log(date);


  //send this data to  backend
}





