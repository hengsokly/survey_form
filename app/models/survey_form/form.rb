module SurveyForm
  class Form < ApplicationRecord
    has_many :sections, class_name: 'SurveyForm::Section'
    has_many :fields, through: :sections

    accepts_nested_attributes_for :sections, allow_destroy: true, reject_if: ->(attributes) { attributes['name'].blank? }
  end
end
