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

## How to Use
### Setup
Include in your gemfile:

```
gem 'volt-fields'
```

Then use fields as tags in your views:
```
<:fields:text value="{{ model.first_name }}"/>
```

### Text and Textarea
```
<:fields:text value="{{ model.first_name }}"/>
```

### Select, Radio, and Checkbox
Select, radio and checkbox fields make use of Volt's attribute bindings. For details, see [docs](http://docs.voltframework.com/en/docs/attribute_bindings.html) and [source](https://github.com/voltrb/volt/blob/master/lib/volt/page/bindings/attribute_binding.rb).

#### Select
Select fields accept either an array of options, or an array of {label: '', value: ''} hashes.

```
<:fields:select value="{{ model.role }}" options="{{ ['User', 'Admin', 'Something Else']}}"/>
```
    
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

For inline checkboxes, use ```:fields:checkbox:inline```.