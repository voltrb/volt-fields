require 'fields/controllers/main_controller'
require 'fields/controllers/select_radio_controller'

module Fields
  class RadioController < SelectRadioController
    def name
      attrs.name || "#{field_name}_radio"
    end
  end
end
