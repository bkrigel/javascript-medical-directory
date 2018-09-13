$(document).on("turbolinks:load", function() {
  $(function () {
    $("#show-appointments").on('click', function(e) {
      e.preventDefault();
      let id = window.location.href.split("/").pop();
      $.getJSON("/appointments", {doctor_id: id}, function(data) {
        $("#appointments").empty()
        data.forEach(function(appointment){
          $("#appointments").append(`<ul>
            <li>
              <small><i>Patient:</i></small>
              <a href="/patients/${appointment["patient"]["id"]}">
                ${appointment["patient"]["first_name"]} ${appointment["patient"]["last_name"]}
              </a>
            </li>
            <li>
              <small><i>Date/Time:</i></small>
              <a href="/appointments/${appointment["id"]}">
                ${moment(
                  appointment["scheduled_for"]
                ).format('dddd, MMM. D, YYYY @ h:mm a')}
              </a>
            </li>
            <li>
              <small><i>Duration:</i></small>
              ${appointment["duration_in_minutes"]} min.
            </li>
            <li>
              <small><i>Reason:</i></small>
              ${appointment["ailment"]["description"]}
            </li>
            <form action="/appointments/${appointment["id"]}" accept-charset="UTF-8" method="post">
              <input name="utf8" type="hidden" value="✓">
              <input type="hidden" name="_method" value="delete">
              <input type="hidden" name="authenticity_token"
              value="eYZQXrqO3NLWo4JovbFEDuFz0wh3iMKxpN9GmlgHu4AqnEombiKQCE3grj0fwxWHOZ6/FnHtVciSwhCFdRiysg==">
              <input type="hidden" name="id" id="id" value="${appointment["id"]}">
              <input type="submit" name="commit" value="Cancel Appointment" data-disable-with="Cancel Appointment">
            </form>
          </ul>`
        )});
      });
    });
  });
});
