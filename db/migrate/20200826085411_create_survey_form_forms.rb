class CreateSurveyFormForms < ActiveRecord::Migration[6.0]
  def change
    create_table :survey_form_forms do |t|
      t.string  :name
      t.integer :display_order

      t.timestamps
    end
  end
end
