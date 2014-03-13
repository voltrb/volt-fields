module Fields
  class TextController < ModelController
    def index
      # Default to text fields
      @type ||= 'text'
      @label ||= nil

      # Get the reactive manager for the value passed in
      manager = @value.reactive_manager

      # Find the parent reactive value that produced the value
      # (usually just model._field)
      @model = manager.parents[0].reactive_value

      # Get the name of the field by looking at the method scope
      @field_name = manager.scope[0]

      # Find the errors for this field
      @errors = @model.marked_errors[@field_name]
    end

    # When a field goes out of focus, then we want to start checking a field
    def blurred
      @model.mark_field!(@field_name)
    end
  end
end
