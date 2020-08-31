module SurveyForm
  class FieldOption < ApplicationRecord
    belongs_to :field, class_name: 'SurveyForm::Field', foreign_key: :field_id

    # Validation
    validates :value, :name, presence: true, uniqueness: { scope: [:field_id] }
    before_validation :set_option_value, if: -> { name.present? }

    private
      def set_option_value
        self.value = (value.presence || name).downcase.split(' ').join('_')
      end
  end
end
