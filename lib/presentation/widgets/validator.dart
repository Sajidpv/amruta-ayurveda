String? validateEmail(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter an email address.';
  }

  return null;
}

String? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return 'Enter a password.';
  }
  if (value.length < 8) {
    return 'Minimum 8 Charecters required';
  }

  return null;
}

String? validaterMandatory(String? value) {
  if (value == null || value.isEmpty) {
    return 'Required Field';
  }

  return null;
}

String? validateDropdown(value) {
  if (value == null) {
    return 'Select an option.';
  }
  return null;
}
