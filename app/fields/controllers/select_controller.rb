require 'fields/controllers/main_controller'

module Fields
  class SelectController < MainController
    def options
      if attrs.options[0].is_a?(Hash)
        options = attrs.options
      else
        options = attrs.options.collect { |option| { value: option, label: option } }
      end
      options
    end
  end
end
