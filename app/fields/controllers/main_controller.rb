module Fields
  class MainController < Volt::ModelController
    before_action :setup_field

    def setup_field
      @options ||= {}

      # Default to text fields
      if attrs.respond_to?(:type)
        @type = attrs.type
      else
        @type = 'text'
      end

      if attrs.respond_to?(:confirm_empty_fields)
        @options ||= {confirm_empty_fields: 'true'} # confirm fields by default
        @options[:confirm_empty_fields] = attrs.confirm_empty_fields == "false"
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
      attrs.label || @field_name.titleize
    end

    # Find the errors for this field
    def errors
      model_inst.marked_errors[@field_name]
    end

    # When a field goes out of focus, then we want to start checking a field
    def blur
      # Only place a check mark if a if :confirm_empty_fields option is present and false and
      # if the length of the field data is non-zero. The use of try here is to prevent spurious
      # errors from cropping up on the client side.
      if @options[:confirm_empty_fields] != false
        model_inst.mark_field!(@field_name) unless attrs.value.nil? || attrs.value.try(:strip).try(:length) == 0
      end
    end

    def marked
      model_inst.marked_fields[@field_name]
    end
  end
end
