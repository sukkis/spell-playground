/*
Back to the future code wars exercise

Similar months:
    January & October
    April & July
    September & December
    February & March & November
    
    The input is a string of the date he arrived in the past: 
    "Monday 1 January"
If there is a matching day/date you will need to return the following string: 
"I'm leaving here on Monday 1 October
If there is no matching day/date that year, 
Marty is stuck in the past and you will need 
to return the following string: 
"Doc, I can't get back to the future!" 

*/
function solution(input) {
  // Should probably check the inputs for validity. Omitted here.  
  inputArray = input.split(' ', 3);  
  weekday    = inputArray[0];
  dayOfMonth = inputArray[1];
  month      = inputArray[2];
  
  monthBack  = "";
  
  switch (month) {
    case 'January':
      monthBack = "October"; // 31 days in October. Marty can get to future from any day in January.
      break;
 
    case 'February':
      monthBack = 'March';  // 31
      break;
    
    case 'March':  //31
      monthBack = 'November'; // 30 days. This special case handled with isValidDay
      break;
    
    case 'April':
      monthBack = 'July'; // 31
      break;

    case 'September':
      monthBack = 'December'; // 31
      break;
    
    default :
      monthBack = "NO";
      break
  }
    
    if ((monthBack !== "NO") && (isValidDay)) {
     return "I'm leaving here on " + weekday + " " + dayOfMonth + " of " + monthBack;
  } else {
     return "Doc, I can't get back to the future!"; 
  }
  
}

function isValidDay(day, month) {
    if (day == 31 && month === 'March') {
      return false;
    } else {
      return true;
    }
}
console.log("weekday : " + weekday);
console.log("dayOfMonth : " + dayOfMonth);
console.log("month : " + month);
console.log(solution('Monday 1 September'));
