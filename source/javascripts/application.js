$(document).ready(function() {
  $('#calendar').fullCalendar({
    googleCalendarApiKey: 'AIzaSyCd4qpRTufHOrQPmxMP086FZ8r1EhJNiaQ',
    events: {
      googleCalendarId: 'freifunk-duesseldorf.de_cmre505gkff8l0uarm64rtkapg@group.calendar.google.com'
    },
    firstDay: 1,
    lang: 'de',
    defaultView: 'listMonth',
    views: {
      listDay: { buttonText: 'list day' },
      listWeek: { buttonText: 'list week' }
    },
    eventColor: '#009ee0',
    eventBackgroundColor: '#009ee0',
    eventTextColor: '#ffffff',
    header: {
      left:   'title',
      center: '',
      right:  'listMonth month today prev,next'
    },
    timeFormat: 'HH:mm',
    eventClick: function(event) {
      // opens events in a popup window
      window.open(event.url, 'gcalevent', 'width=700,height=600');
      return false;
    },
  });
});
