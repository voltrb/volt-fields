module Fields
  class TextController < ModelController
    reactive_accessor :blurred
    reactive_accessor :errors
    def index
      # Default to text fields
      if attrs.respond_to?(:type)
        @type = attrs.type
      else
        @type = 'text'
      end

      # Find the parent reactive value that produced the value
      # (usually just model._field)
      @model = attrs.value_parent

      # Get the name of the field by looking at the method scope
      @field_name = attrs.value_last_method

    end

    def label
      label = (attrs.respond_to?(:label) && attrs.label)

      unless @label
        label = @field_name.titleize
      end

      return label
    end

    # Find the errors for this field
    def errors
      @model.marked_errors[@field_name]
    end

    # When a field goes out of focus, then we want to start checking a field
    def blur
      @model.mark_field!(@field_name)

      self.blurred = true
    end
  end
end
