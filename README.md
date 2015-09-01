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

or

```
<:fields:text value="{{ model.first_name }}" confirm_empty_fields="false" />
```

If you use the latter, it affects behavior when a user leaves the field (`blur` event). Any value other than `false`
for `confirm_empty_fields` puts a check mark in a field that validates even if it is empty. If you use
`confirm_empty_fields="false"`, no check mark will be placed in text fields with no entry on blur.

### Select
Select fields accept either an array of options, or an array of {label: '', value: ''} hashes.

```
<:fields:select value="{{ model.role }}" options="{{ ['User', 'Admin', 'Something Else']}}"/>
```

### Radio
For radio buttons, pass an options array of {label: '', value: ''} hashes.

```
<:fields:radio value="{{ model.active }}" options="{{[{label: 'Active', value: true},{label:'Inactive', value: false}]}}"/>
```

For inline radio buttons, use ```:fields:radio:inline```.

### Checkbox
For checkboxes, use 'checked' instead of 'value' to bind the checkbox to a boolean field.
```
<:fields:checkbox checked="{{ model.active }}"/>
```

For inline radio buttons, use ```:fields:radio:inline```.
