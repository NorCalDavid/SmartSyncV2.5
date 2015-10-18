$(document).ready(function() {
   $("#calendar").fullCalendar({
     header: 
     left: "prev,next today",
     center: "title",
     right: "month,agendaWeek,agendaDay"
     defaultView: "month",
     height: 500,
     slotMinutes: 15,
     events: "/events/calendar",
     timeFormat: "h:mm t{ - h:mm t} ",
     dragOpacity: "0.5"
  });
});