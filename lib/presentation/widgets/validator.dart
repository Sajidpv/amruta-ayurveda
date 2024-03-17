String? validateEmail(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter an email address.';
  }
  if (!value.contains("@") || !value.contains('.')) {
    return 'Not a valid mail';
  }

  return null;
}

String? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return 'Enter a password.';
  }
  if (value.length < 6) {
    return 'Minimum 6 Charecters required';
  }

  return null;
}

String? validaterMandatory(String? value) {
  if (value == null || value.isEmpty) {
    return 'Required Field';
  }

  return null;
}

String? validatorColorQuantity(String? value, double? availableQuantity) {
  final parsedvalue = double.tryParse(value!);
  if (value.isEmpty) {
    return 'Required Field';
  }
  if (availableQuantity! < 1) {
    return 'Quantity Exceeded';
  }
  if (parsedvalue! > availableQuantity) {
    return 'Invalid Quantity';
  }

  return null;
}

String? quandityValidator(String? value, String? quantity) {
  final parsedValue = double.tryParse(value ?? '');
  final parsedQuantity = double.tryParse(quantity ?? '');

  if (parsedValue == null || parsedQuantity == null) {
    return 'Required Field';
  }

  if (value?.isEmpty ?? true) {
    return 'Please enter a quantity';
  }

  if (parsedValue > parsedQuantity) {
    return 'Quantity should not exceed $parsedQuantity';
  }

  // Return null if validation is successful
  return null;
}

String? layerQuantityValidator(
    String? value, double? quantity, double? availableQuantity) {
  final parsedvalue = double.tryParse(value!);

  if (parsedvalue == null || value.isEmpty) {
    return 'Required Field';
  }
  if (availableQuantity! < quantity!) {
    return 'Invalid Quantity';
  }

  return null;
}

String? balanceQuantityValidator(String? value, double? totalQuantity,
    double? availableQuantity, double? balanceQuantity) {
  final balance = totalQuantity! + balanceQuantity!;
  if (availableQuantity! < balance) {
    return 'Invalid Balance';
  }

  return null;
}

String? balanceValidator(
    String? value, double? quantity, double? availableQuantity) {
  if (value == null || quantity == null || availableQuantity == null) {
    return null;
  }
  if (quantity > availableQuantity) {
    return 'Invalid Balance';
  }
  return null;
}

String? damageValidator(
    String? value, double? quantity, double? availableQuantity) {
  final parsedvalue = double.tryParse(value!) ?? 0;
  if (quantity == null || availableQuantity == null) {
    return 'Enter Quantity';
  }
  final quantityy = parsedvalue + quantity;
  if (quantityy > availableQuantity) {
    return 'Invalid Balance';
  }
  return null;
}

String? validateDropdown(value) {
  if (value == null) {
    return 'Select an option.';
  }
  return null;
}

String? validateConfirmPassword(String? value, String? password) {
  if (value == null || value.isEmpty) {
    return 'Confirm your password.';
  }
  if (value != password) {
    return 'Passwords doesnot match.';
  }

  return null;
}

String? validateOldPassword(String? value, String? old) {
  if (value == null || value.isEmpty) {
    return 'Enter new password.';
  }
  if (value.length < 6) {
    return 'Minimum 6 Charecters required';
  }
  if (value == old) {
    return 'Passwords must be different from previous password';
  }

  return null;
}
