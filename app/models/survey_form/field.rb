module SurveyForm
  class Field < ApplicationRecord
    attr_accessor :skip_validation

    TYPES = %w[SurveyForm::Fields::TextField SurveyForm::Fields::NoteField SurveyForm::Fields::IntegerField SurveyForm::Fields::DateField SurveyForm::Fields::DateTimeField SurveyForm::Fields::SelectOneField SurveyForm::Fields::SelectMultipleField SurveyForm::Fields::ImageField SurveyForm::Fields::FileField SurveyForm::Fields::LocationField SurveyForm::Fields::MappingField].freeze

    # Association
    belongs_to :section, class_name: 'SurveyForm::Section'
    belongs_to :parent, foreign_key: :mapping_field_id, class_name: 'SurveyForm::Field', optional: true
    has_many   :field_options, class_name: 'SurveyForm::FieldOption', dependent: :destroy
    # has_many   :field_values

    # Validation
    validates :code, presence: true, uniqueness: { scope: :section_id, message: 'already exist' }
    validates :name, presence: true, uniqueness: { scope: :section_id, message: 'already exist' }
    validates :type, presence: true, inclusion: { in: TYPES }
    validates :mapping_field_id, presence: true, if: -> { type == 'SurveyForm::Fields::MappingField' && !skip_validation }

    before_validation :set_field_code, if: -> { name.present? }
    # before_validation :set_mapping_field_type
    before_validation :set_form
    before_create :set_display_order

    # Nested attributes
    accepts_nested_attributes_for :field_options, allow_destroy: true, reject_if: ->(attributes) { attributes['name'].blank? }

    serialize :validations, Hash

    def kind
      raise 'you have to implement in subclass'
    end

    def self.es_datatype
      raise 'you have to implement in subclass'
    end

    def format_name
      name.downcase.split(' ').join('_')
    end

    private
      def set_field_code
        self.code ||= format_name
      end

      def set_display_order
        self.display_order ||= section.present? && section.fields.maximum(:display_order).to_i + 1
      end

      def set_form
        self.form_id = section.form_id if section
      end

      def set_mapping_field_type
        # return unless field_type == 'mapping_field'

        # event_mapping_field = self.class.roots.find { |obj| obj[:code] == mapping_field }
        # self.mapping_field_type = event_mapping_field.present? && event_mapping_field[:field_type]
        # self.color_required = event_mapping_field.present? && event_mapping_field[:color_required]
      end
  end
end
