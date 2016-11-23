$(window).load(function() {
		// Animate loader off screen
		$(".se-pre-con").fadeOut("50000");;
	});

//Build & Launch input Modal
$(function() {
$('#myModal').on('show.bs.modal', function(e) {

    var date = e.relatedTarget.dataset.date; 
    var userId = e.relatedTarget.dataset.user;
    var position = e.relatedTarget.dataset.position;
    var id = e.relatedTarget.dataset.id;

    
//get Start Time & if set format for Time standard
var start = e.relatedTarget.dataset.start;
        if(typeof start != 'undefined'){
            start = start.replace( /[^0-9:]/g, '' );
            if(start.length < 5){
                start = "0" + start;  
            };
        };

//get End Time & if set format for Time standard
var end = e.relatedTarget.dataset.end;
        if(typeof end != 'undefined'){
            end = end.replace( /[^0-9:]/g, '' );
            if(end.length < 5){
                end = "0" + end;  
            };
        };

   
   
//set form pre-data
     document.getElementById("schedule_date_1i").value = date.substring(0,4);      //year
     document.getElementById("schedule_date_2i").value = date.substring(5,7);      //month
     document.getElementById("schedule_date_3i").value = date.substring(8,10);      //day
     document.getElementById("schedule_user_id").value = userId;
     document.getElementById("schedule_position_id").value = position;
  

    if(typeof id != 'undefined'){
        document.getElementById("schedule_id").value = id;
        document.getElementById("schedule_startTime_4i").value = start.substring(0, 2);    //hour
        document.getElementById("schedule_startTime_5i").value = start.substring(3, 5);    //minutes
        document.getElementById("schedule_endTime_4i").value = end.substring(0,2);     //hour
        document.getElementById("schedule_endTime_5i").value = end.substring(3,5);     //minutes
    }else{
        document.getElementById("schedule_startTime_4i").value = 11;    //hour
        document.getElementById("schedule_startTime_5i").value = "00";    //minutes
        document.getElementById("schedule_endTime_4i").value = 11;     //hour
        document.getElementById("schedule_endTime_5i").value = "00"; 
        
    }
    
  

});


//Auto convert military time to Standard
//converts content of spans w class="mil_time"
getFormattedTime = function (fourDigitTime) {
    /* make sure add radix*/
    var hours24 = parseInt(fourDigitTime.substring(0, 2),10);
    var hours = ((hours24 + 11) % 12) + 1;
    var amPm = hours24 > 11 ? 'p' : 'a';
    var minutes = fourDigitTime.substring(2);

    return hours + minutes;
};
/* find all spans and replace their content*/
$('span.mil_time').html(function( i, oldHtml){
   return getFormattedTime(oldHtml);
})


document.getElementById("shiftForm").addEventListener("submit", printShiftView);

function printShiftView() {
    var startT = getFormattedTime(document.getElementById("startT").value);
    var endT = getFormattedTime(document.getElementById("endT").value);
    var date = document.getElementById("date").value;
    var userId = document.getElementById("userId").value;
    
    var tdId = userId + "|" + date;
    var tdTagId = "tag" + tdId;
    
    var shiftHtml = '<span class="timeText ">' + startT + 
        '</span> - <span class="timeText ">' + endT + 
        '</span><button type="button" class="editBut" data-toggle="modal" '+
        'data-user="' + userId + '" data-start="' + startT + '" data-end="' + endT + '" '  +
        'data-date="' + date + '" href="#myModal" id="' + tdId + '">Edit Shift</button>';
    alert(tdTagId);
    var shiftObj = document.getElementById(tdTagId);
    shiftObj.innerHTML = shiftHtml;
    return false;
};
})