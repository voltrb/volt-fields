require 'fields/controllers/main_controller'

module Fields
  class CheckboxController < MainController
    before_action :setup_field

    def setup_field
      # Get the name of the field by looking at the method scope
      @field_name = attrs.checked_last_method.gsub(/^[_]/, '')
    end

    def inline
      # Get the name of the field by looking at the method scope
      @field_name = attrs.checked_last_method.gsub(/^[_]/, '')
    end

    # Find the parent reactive value that produced the value
    # (usually just model._field)
    def model_inst
      attrs.checked_parent
    end

  end
end
