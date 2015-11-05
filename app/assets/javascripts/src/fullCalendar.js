// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function() {

  $("div#event-calendar").fullCalendar({
     header: { left: "prev,next today",
               center: "title",
               right: "month,agendaWeek,agendaDay",
     defaultView: "month" },
     height: 500,
     slotMinutes: 30,
     allDayDefault: false,
     editable: true,
     selectable: true,
     resizable: true,
     events: "/events",
     timeFormat: "h:mm A to h:mm A ",
     timezone: true,
     dragOpacity: "0  .5",
     eventRender: function(event, element) {
      $('a.fc-event-draggable').attr('data-remote', true);
     },
     eventResize: function(event, dayDelta, minuteDelta) {
       resize(event, dayDelta, minuteDelta);
     },
     eventDrop: function(event, dayDelta, minuteDelta, allDay){
       drop(event, dayDelta, minuteDelta);
     }

  });

  $("div#schedule-calendar").fullCalendar({
     header: { left: "prev,next today",
               center: "title",
               right: "month,agendaWeek,agendaDay",
     defaultView: "month" },
     height: 500,
     slotMinutes: 30,
     allDayDefault: false,
     editable: true,
     selectable: true,
     resizable: true,
     events: "/schedules",
     timeFormat: "h:mm A to h:mm A ",
     timezone: true,
     dragOpacity: "0  .5",
     eventRender: function(event, element) {
      $('a.fc-event-draggable').attr('data-remote', true);
     },
     eventResize: function(event, dayDelta, minuteDelta) {
       resize(event, dayDelta, minuteDelta);
     },
     eventDrop: function(event, dayDelta, minuteDelta, allDay){
       drop(event, dayDelta, minuteDelta);
     }

  });

  function resize(event, dayDelta, minuteDelta){
    $.ajax({
      type: 'PUT',
      dataType: 'script',
      url: event.update,
      contentType: 'application/json',
      data: JSON.stringify({
        event: { id: event.id, finish: event.finish },
        _method:'POST'
      })
    });
  }

  function drop(event, dayDelta, minuteDelta){
    $.ajax({
      type: 'PUT',
      dataType: 'script',
      url: event.update,
      contentType: 'application/json',
      data: JSON.stringify({
        event: { id: event.id, start: event.start, finish: event.end },
        _method:'POST'
      })
    });
  }

  // $(document).on('page:change', function() {
  //   $('#calendar').fullCalendar({
  //     header: {
  //       left: 'prev,next today',
  //       center: 'title',
  //       right: 'month,agendaWeek,agendaDay'
  //     },
  //     height: 600,
  //     editable: true,
  //     resizable: true,
  //     events: '/events',
  //     eventRender: function(event, element) {
  //       $('a.fc-event-draggable').attr('data-remote', true);
  //     },
  //     eventResize: function(event, dayDelta, minuteDelta) {
  //       resize(event, dayDelta, minuteDelta);
  //     },
  //     eventDrop: function(event, dayDelta, minuteDelta, allDay){
  //       drop(event, dayDelta, minuteDelta);
  //     }
  //   });
  // });

});

