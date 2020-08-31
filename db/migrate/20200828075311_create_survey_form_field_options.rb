class CreateSurveyFormFieldOptions < ActiveRecord::Migration[6.0]
  def change
    create_table :survey_form_field_options do |t|
      t.integer :field_id
      t.string  :name
      t.string  :value
      t.string  :color

      t.timestamps
    end
  end
end
