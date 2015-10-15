require 'fields/controllers/main_controller'

module Fields
  class SelectRadioController < MainController
    def options
      attrs.options.then do |options|
        if options[0].is_a?(Hash)
          options_hash = options
        else
          options_hash = options.collect { |option| {value: option, label: option }}
        end
        options_hash
      end
    end
  end
end
