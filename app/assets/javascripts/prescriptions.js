$(document).on("turbolinks:load", function() {
  $(function addEventListenerToForm() {
    $('#new_prescription').on("submit", function(e) {
      e.preventDefault();
      let values = $(this).serialize();
      $.post('/prescriptions', values).done(function(data) {
        let prescription = data;
        $("#prescriptionPatient").append(
          `<a href="/patients/${prescription["appointment"]["patient"]["id"]}">
          ${prescription["appointment"]["patient"]["first_name"]}  ${prescription["appointment"]["patient"]["last_name"]}</a>`
        );
        $("#prescriptionDrug").append(
          prescription["drug"]
        );
        $("#prescriptionDosage").append(
          prescription["dosage_in_milligrams"] + " " + "mg"
        );
        $("#prescriptionAilment").append(
          prescription["appointment"]["ailment"]["description"]
        );
        $("#prescriptionAppointment").append(
          `<a href="/appointments/${prescription["appointment"]["id"]}">
          ${moment(
            prescription["appointment"]["scheduled_for"]
          ).format('MMM. D, YYYY')}</a>`
        );
        $("#prescriptionEdit").append(
          `<a href="/prescriptions/${prescription["appointment"]["id"]}/edit">
          edit this prescription</a>
          <br>
          <form action="/prescriptions/${prescription["id"]}"
          accept-charset="UTF-8" method="post"><input name="utf8" type="hidden"
          value="✓"><input type="hidden" name="_method" value="delete">
          <input type="hidden" name="authenticity_token"
          value="aiQxRWZzxN1TFBB1/ApsbI0OdhzJNZ/1qvyf1hRfCa45Pis9st+IB8hXPCBeeD3lVeMaAs9QCIyc4cnJOUAAnA==">
          <input type="hidden" name="id" id="id" value="${prescription["id"]}">
          <input type="submit" name="commit" value="Cancel Prescription"
          data-disable-with="Cancel Prescription">
          </form>`
        );
      });
    });
  });
});
