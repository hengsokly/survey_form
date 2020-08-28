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
        redirect_to main_app.root_url
      else
        flash.now[:alert] = @form.errors.full_messages
        render :new
      end
    end

    def edit
      @form = SurveyForm::Form.find(params[:id])
    end

    def update
      @form = SurveyForm::Form.find(params[:id])

      if @form.update(form_params)
        redirect_to main_app.root_url
      else
        flash.now[:alert] = @form.errors.full_messages
        render :edit
      end
    end

    def delete
      @form = SurveyForm::Form.find(params[:id])
      @form.destroy

      redirect_to main_app.root_url
    end

    private
      def form_params
        params.require(:form).permit(:name, :display_order, fields_attributes: [])
      end
  end
end
