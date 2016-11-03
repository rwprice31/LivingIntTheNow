
//Build & Launch input Modal
$('#myModal').on('show.bs.modal', function(e) {
    var userId = e.relatedTarget.dataset.user;
    var date = e.relatedTarget.dataset.date;
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
        
//temp data for development 
   // document.getElementById("devInfo").innerHTML = userId + " | " + end;
//set form pre-data
    document.getElementById("startT").value = start;
    document.getElementById("endT").value = end;
    document.getElementById("date").value = date;
    document.getElementById("userId").value = userId;
  
});

//Auto convert military time to Standard
//converts content of spans w class="mil_time"
getFormattedTime = function (fourDigitTime) {
    /* make sure add radix*/
    var hours24 = parseInt(fourDigitTime.substring(0, 2),10);
    var hours = ((hours24 + 11) % 12) + 1;
    var amPm = hours24 > 11 ? 'p' : 'a';
    var minutes = fourDigitTime.substring(2);

    return hours + minutes + amPm;
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
    
    var shiftObj = document.getElementById(tdTagId);
    shiftObj.innerHTML = shiftHtml;
    return false;
}