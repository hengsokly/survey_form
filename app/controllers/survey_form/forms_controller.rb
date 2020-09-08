require_dependency "survey_form/application_controller"

module SurveyForm
  class FormsController < ApplicationController
    def index
      @forms = SurveyForm::Form.all
    end

    def show
      @form = SurveyForm::Form.find(params[:id])
    end

    def new
      @form = SurveyForm::Form.new
    end

    def create
      @form = SurveyForm::Form.new(form_params)

      if @form.save
        redirect_to forms_url
      else
        flash.now[:alert] = @form.errors.full_messages
        render :new
      end
    end

    def edit
      @form = SurveyForm::Form.find(params[:id])
      @form.fields.new
    end

    def update
      @form = SurveyForm::Form.find(params[:id])

      if @form.update(form_params)
        redirect_to survey_form.forms_url
      else
        flash.now[:alert] = @form.errors.full_messages
        render :edit
      end
    end

    def destroy
      @form = SurveyForm::Form.find(params[:id])
      @form.destroy

      redirect_to survey_form.forms_url
    end

    private
      def form_params
        params.require(:form).permit(
          :name, :display_order,
          sections_attributes: [
            :id, :name, :default, :_destroy, :display,
            fields_attributes: [
              :id, :name, :type, :required, :display_order, :code, :entry_able,
              :mapping_field_id, :_destroy, :tracking, :description, :relevant,
              validations: {},
              field_options_attributes: %i[id name value color _destroy]
            ]
          ]
        )
      end
  end
end
