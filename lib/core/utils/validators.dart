String? generalValidator(String? value, String title) {
  if (value == null || value.trim().isEmpty) {
    return '$title را به درستی وارد نمایید';
  }
  return null;
}

String? dropdownValidator(Object? value, String title) {
  if (value == null) {
    return '$title را انتخاب نمایید';
  }
  return null;
}