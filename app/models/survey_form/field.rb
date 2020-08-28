module SurveyForm
  class Field < ApplicationRecord
    belongs_to :form, class_name: 'SurveyForm::Form', foreign_key: :form_id
  end
end
