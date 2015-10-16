require 'fields/controllers/main_controller'
require 'fields/controllers/select_radio_controller'

module Fields
  class ButtonGroupController < SelectRadioController

    def selected?(value)
      true if value == model_inst.send(@field_name)
    end

    def set_val(value)
      model_inst.send("#{@field_name}=", value)
    end

    def button_class
      attrs.button_class || 'btn-default'
    end

    def selected_button_class
      attrs.selected_button_class || attrs.button_class || 'btn-default'
    end

    def active_class
      attrs.active_class || 'active'
    end

  end
end
