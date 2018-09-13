$(document).on("turbolinks:load", function() {
  $(function addEventListenerToForm() {
    $('#new_prescription').on("submit", function(e) {
      e.preventDefault();
      let values = $(this).serialize();
      $.post('/prescriptions', values).done(function(data) {
        let prescription = data;
        let prescriptionDisplayer = new PrescriptionDisplayer(prescription)
        $("#prescriptionPatient").append(
          `<a href="/patients/${prescription["appointment"]["patient"]["id"]}">
          ${prescriptionDisplayer.displayFullName()}</a>`
        );
        $("#prescriptionDrug").append(
          prescriptionDisplayer.displayDrug()
        );
        $("#prescriptionDosage").append(
          prescriptionDisplayer.displayDosage()
        );
        $("#prescriptionAilment").append(
          prescriptionDisplayer.displayAilment()
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
