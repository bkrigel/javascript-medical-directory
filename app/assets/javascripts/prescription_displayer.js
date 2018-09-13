class PrescriptionDisplayer {
  constructor(prescription) {
    this.prescription = prescription
  }
  displayDrug() {
    return this.prescription.drug
  }
  displayDosage() {
    return `${this.prescription.dosage_in_milligrams} mg`
  }
  displayAilment() {
    return this.prescription.appointment.ailment.description
  }
  displayFullName() {
    return `${this.prescription.appointment.patient.first_name} ${this.prescription.appointment.patient.last_name}`
  }
}
