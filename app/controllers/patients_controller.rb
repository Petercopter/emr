class PatientsController < ApplicationController
  before_action :set_patient, only: :show

  def index
    @patients = Patient.order(:last_name, :first_name)
  end

  def show
    @admission_date = @patient.admission.moment.to_date.to_formatted_s(:long)
    @admission_time = @patient.admission.moment.strftime('%l:%M%P')
    @admission_diagnoses = @patient.admission.diagnoses.map do |diagnosis|
      [
        diagnosis.description,
        ['(', diagnosis.coding_system, diagnosis.code, ')'].join
      ].join(' ')
    end.join(', ')

    @allergies = @patient.allergies.map(&:description).to_sentence
    @chronic_conditions = @patient.chronic_conditions.map do |diagnosis|
      [
        diagnosis.description,
        ['(', diagnosis.coding_system, diagnosis.code, ')'].join
      ].join(' ')
    end.join(', ')

    @diagnostic_procedures = @patient.diagnostic_procedures.map do |diagnostic_procedure|
      [
        diagnostic_procedure.description,
        'at',
        diagnostic_procedure.moment.strftime('%l:%M%P')
      ].join(' ')
    end.to_sentence

    @medications = @patient.medications.map do |medication_order|
      [
        medication_order.name,
        [
          '%g' % ('%.2f' % medication_order.dosage),
          medication_order.unit
        ].join,
        medication_order.route.upcase,
        [
          medication_order.order_frequency.value,
          medication_order.order_frequency.unit
        ].join,
        'to',
        medication_order.necessity
      ].join(' ')
    end.to_sentence

    @patient_diagnoses = @patient.diagnoses.map do |diagnosis|
      [
        diagnosis.description,
        ['(', diagnosis.coding_system, diagnosis.code, ')'].join
      ].join(' ')
    end.to_sentence

    @symptoms = @patient.admission.symptoms.map(&:description).to_sentence

    @treatments = @patient.treatments.map do |treatment|
      [
        treatment.description,
        'to',
        treatment.necessity
      ].join(' ')
    end.to_sentence
  end

  private

  def set_patient
    @patient = Patient.find params[:id]
  end
end
