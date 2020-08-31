module SurveyForm
  class Engine < ::Rails::Engine
    isolate_namespace SurveyForm

    initializer 'MyEngine', before: :load_config_initializers do
      Rails.application.config.i18n.load_path += Dir["#{config.root}/config/locales/**/*.yml"]
    end
  end
end
