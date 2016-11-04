

// //Build & Launch input Modal
// $(function() {
// $('#myModal').on('shown.bs.modal', function(e) {

//     var userId = e.relatedTarget.dataset.user;
//     var date = e.relatedTarget.dataset.date;
//     var position = e.relatedTarget.dataset.position;
// //get Start Time & if set format for Time standard
//     var start = e.relatedTarget.dataset.start;

//         if(typeof start != 'undefined'){
//             start = start.replace( /[^0-9:]/g, '' );
//             if(start.length < 5){
//                 start = "0" + start;  
//             };
//         };

// //get End Time & if set format for Time standard
//     var end = e.relatedTarget.dataset.end;
//         if(typeof end != 'undefined'){
//             end = end.replace( /[^0-9:]/g, '' );
//             if(end.length < 5){
//                 end = "0" + end;  
//             };
//         };
        
// //temp data for development 
//   // document.getElementById("devInfo").innerHTML = userId + " | " + end;
// //set form pre-data

//     var startPrint = document.getElementById("schedule_startTime_4i").value;
//      document.getElementById("schedule_startTime_4i").value = start.substring(0, 2);
//      document.getElementById("schedule_startTime_5i").value = start.substring(3, 5);
//      document.getElementById("schedule_endTime_4i").value = end.substring(0,2);
//      document.getElementById("schedule_endTime_5i").value = end.substring(3,5);
//     // document.getElementById("date").value = date;
//      document.getElementById("schedule_user_id").value = userId;
//      document.getElementById("schedule_position_id").value = position;
  
// });


// //Auto convert military time to Standard
// //converts content of spans w class="mil_time"
// getFormattedTime = function (fourDigitTime) {
//     /* make sure add radix*/
//     var hours24 = parseInt(fourDigitTime.substring(0, 2),10);
//     var hours = ((hours24 + 11) % 12) + 1;
//     var amPm = hours24 > 11 ? 'p' : 'a';
//     var minutes = fourDigitTime.substring(2);

//     return hours + minutes;
// };
// /* find all spans and replace their content*/
// $('span.mil_time').html(function( i, oldHtml){
//   return getFormattedTime(oldHtml);
// })


// document.getElementById("new_schedule").addEventListener("submit", printShiftView);

// function printShiftView() {
//     var startT = getFormattedTime(document.getElementById("startT").value);
//     var endT = getFormattedTime(document.getElementById("endT").value);
//     var date = document.getElementById("date").value;
//     var userId = document.getElementById("userId").value;
    
//     var tdId = userId + "|" + date;
//     var tdTagId = "tag" + tdId;
    
//     var shiftHtml = '<span class="timeText ">' + startT + 
//         '</span> - <span class="timeText ">' + endT + 
//         '</span><button type="button" class="editBut" data-toggle="modal" '+
//         'data-user="' + userId + '" data-start="' + startT + '" data-end="' + endT + '" '  +
//         'data-date="' + date + '" href="#myModal" id="' + tdId + '">Edit Shift</button>';
//     alert(tdTagId);
//     var shiftObj = document.getElementById(tdTagId);
//     shiftObj.innerHTML = shiftHtml;
//     return false;
// };
// })