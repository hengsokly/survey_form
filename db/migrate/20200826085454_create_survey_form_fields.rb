class CreateSurveyFormFields < ActiveRecord::Migration[6.0]
  def change
    create_table :survey_form_fields do |t|
      t.string  :code
      t.string  :name
      t.string  :type
      t.text    :description
      t.integer :display_order
      t.integer :section_id
      t.integer :form_id

      # Mapping
      t.integer :mapping_field_id
      t.string  :mapping_field_type

      # Other
      t.boolean :default, default: false
      t.boolean :entry_able, default: true
      t.boolean :color_required, default: false
      t.boolean :tracingable, default: false

      # Skip logic
      t.boolean :required
      t.text    :validations
      t.string  :relevant

      t.timestamps
    end
  end
end


