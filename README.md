# Volt::Fields

Provides controls with the following:

1. the necessary html for bootstrap
2. mark the fields when the blur event happens
3. display any marked errors below the field

Currently supported control types:
* Text
* Textarea
* Select
* Radio
* Checkbox
* Button groups / bar

## How to Use
#### Setup
Include in your gemfile:

```
gem 'volt-fields'
```

Then use fields as tags in your views:
```
<:fields:text value="{{ model.first_name }}"/>
```

#### Options common to all controls
Attribute | Description | Required/Optional | Default
----- | ----- | -----
value | The model field to bind to. | Required | None |
label | A label for the field. Pass 'false' for no label. | Optional | Name of the field on the model.

### Control Types

#### Text and Textarea
```
<:fields:text value="{{ model.first_name }}"/>
```
##### Alternative formats
* <:fields:textarea />

#### Select
Select fields accept either an array of options, or an array of {label: '', value: ''} hashes. You can pass promises and the options will be populated when the promise resolves.

```
<:fields:select value="{{ model.role }}" options="{{ ['User', 'Admin', 'Something Else']}}"/>
```

#### Button Groups / Bar
[Button groups](http://getbootstrap.com/components/#btn-groups) function just like select boxes, but provide a switch-like interface.

```
<:fields:button_group selected_button_class="btn-primary" value="{{ model.status }}" options="{{ MyModel.something_that_returns_a_promise }}" />
```

 Attribute | Description | Default
 ------ | ------ | -------
 button_class | Class to apply to all buttons (unless selected_button_class is also supplied) (i.e. btn-default, btn-primary) | 'btn-default'
 active_class | Class applied to the selected option (in addition to selected_button_class (i.e. 'active') | 'active'
 selected_button_class | Class to apply to the selected button (i.e. btn-default, btn-primary) | 'btn-default'

 ##### Alternative formats
 * <:fields:button_group:justified />

#### Radio
Radio buttons accept either an array of options, or an array of {label: '', value: ''} hashes.

```
<:fields:radio value="{{ model.active }}" options="{{[{label: 'Active', value: true},{label:'Inactive', value: false}]}}"/>
```

For inline radio buttons, use ```:fields:radio:inline```.

#### Checkbox
For checkboxes, use 'checked' instead of 'value' to bind the checkbox to a boolean field.
```
<:fields:checkbox checked="{{ model.active }}"/>
```

##### Alternative formats
* <:fields:checkbox:inline />
