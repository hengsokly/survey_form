class CreateSurveyFormSections < ActiveRecord::Migration[6.0]
  def change
    create_table :survey_form_sections do |t|
      t.string   :name
      t.integer  :form_id
      t.integer  :display_order
      t.boolean  :default, default: false
      t.boolean  :display, default: true

      t.timestamps
    end
  end
end
