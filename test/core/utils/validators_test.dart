import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_sdui_challenge/core/utils/validators.dart'; // Adjust the import path as necessary

void main() {
  group('generalValidator', () {
    test('returns error message when value is null', () {
      var result = generalValidator(null, 'عنوان');
      expect(result, 'عنوان را به درستی وارد نمایید');
    });

    test('returns error message when value is empty', () {
      var result = generalValidator('', 'عنوان');
      expect(result, 'عنوان را به درستی وارد نمایید');
    });

    test('returns error message when value is only whitespace', () {
      var result = generalValidator('   ', 'عنوان');
      expect(result, 'عنوان را به درستی وارد نمایید');
    });

    test('returns null when value is not empty', () {
      var result = generalValidator('Some value', 'عنوان');
      expect(result, null);
    });
  });

  group('dropdownValidator', () {
    test('returns error message when value is null', () {
      var result = dropdownValidator(null, 'عنوان');
      expect(result, 'عنوان را انتخاب نمایید');
    });

    test('returns null when value is not null', () {
      var result = dropdownValidator('Some value', 'عنوان');
      expect(result, null);
    });
  });
}