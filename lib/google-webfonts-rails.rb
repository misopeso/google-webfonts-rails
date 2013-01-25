module GoogleWebfonts
  require 'google-webfonts/config_renderer'
end

if defined?(Rails)
  require 'google-webfonts/rails/helpers'

  ActiveSupport.on_load(:action_controller) do
    include GoogleWebfonts::Rails::Helpers
  end
end