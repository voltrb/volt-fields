require 'fields/controllers/main_controller'

module Fields
  class RadioController < MainController
    # When a radio button is clicked, set the value of the field and start checking the field
    def set_field(value)
      model_inst.send("#{@field_name}=", value)
      model_inst.mark_field!(@field_name)
    end

    def checked?(value)
      value == model_inst.send(@field_name)
    end
  end
end
