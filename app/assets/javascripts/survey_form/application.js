//= require rails-ujs

//= require jquery3
//= require popper
//= require bootstrap

//= require survey_form/tagify.min

//= require survey_form/namespace

//= require survey_form/field_type_constant
//= require survey_form/skip_logic_constant

//= require survey_form/skip_logic
//= require survey_form/forms

$( document ).ready(function() {
  window.SurveyForm.Form.init();
});
