module Fields
  class MainController < Volt::ModelController
    before_action :setup_field
    reactive_accessor :options

    def setup_field
      # Default to text fields
      if attrs.respond_to?(:type)
        @type = attrs.type
      else
        @type = 'text'
      end

      unless attrs.value_last_method
        field_type = self.class.to_s.underscore.gsub(/[_]Controller$/, '')
        raise "a <:fields:#{field_type} tag was used without passing a value attribute"
      end

      # Get the name of the field by looking at the method scope
      @field_name = attrs.value_last_method.gsub(/^[_]/, '')
    end

    # Find the parent reactive value that produced the value
    # (usually just model._field)
    def model_inst
      attrs.value_parent
    end

    def label
      unless ['false','False'].include?(attrs.label)
        attrs.label || @field_name.titleize
      end
    end

    # Find the errors for this field
    def errors
      model_inst.marked_errors[@field_name]
    end

    def field_name
      @field_name
    end

    # When a field goes out of focus, then we want to start checking a field
    def blur
      model_inst.mark_field!(@field_name)
    end

    def marked
      model_inst.marked_fields[@field_name]
    end
  end
end
