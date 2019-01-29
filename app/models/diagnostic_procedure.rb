class DiagnosticProcedure < ApplicationRecord
  belongs_to :patient, inverse_of: :diagnostic_procedures

  validates :description,
            :moment,
            presence: true
end
