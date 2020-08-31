module SurveyForm
  class Section < ApplicationRecord
    belongs_to :form, class_name: 'SurveyForm::Section'
    has_many :fields, class_name: 'SurveyForm::Field', dependent: :destroy

    accepts_nested_attributes_for :fields, allow_destroy: true, reject_if: ->(attributes) { attributes['name'].blank? }

    # Validation
    validates :name, presence: true, uniqueness: { scope: [:form_id] }
    validate :validate_unique_field_name

    private
      def validate_unique_field_name
        validate_uniqueness_of_in_memory(fields, %i[name], 'duplicate')
      end
  end
end


