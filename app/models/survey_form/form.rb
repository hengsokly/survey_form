module SurveyForm
  class Form < ApplicationRecord
    has_many :fields, class_name: 'SurveyForm::Field', foreign_key: :form_id

    accepts_nested_attributes_for :fields, allow_destroy: true, reject_if: ->(attributes) { attributes['name'].blank? }
  end
end
