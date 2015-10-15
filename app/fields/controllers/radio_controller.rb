require 'fields/controllers/main_controller'
require 'fields/controllers/select_radio_controller'

module Fields
  class RadioController < SelectRadioController
    def name
      attrs.name || "#{field_name}_radio"
    end

    def selected?(option)
      option[:value] == model_inst.send(@field_name) ? true : false
    end

    def set(option)
      model_inst.send("#{@field_name}=", option[:value])
    end
  end
end
