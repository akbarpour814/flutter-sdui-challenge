import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_sdui_challenge/core/utils/enums.dart';
import 'package:flutter_sdui_challenge/core/utils/utils.dart';

void main() {
  group('typeInputFormatters', () {
    test('returns correct formatters for loginCode', () {
      var result = typeInputFormatters(TypeEnum.loginCode);
      expect(result, isNotEmpty);
      expect(result, contains(isA<LengthLimitingTextInputFormatter>()));
      expect(result, contains(isA<FilteringTextInputFormatter>()));
    });

    test('returns correct formatters for mobile', () {
      var result = typeInputFormatters(TypeEnum.mobile);
      expect(result, isNotEmpty);
      expect(result, contains(isA<LengthLimitingTextInputFormatter>()));
      expect(result, contains(isA<FilteringTextInputFormatter>()));
    });

    test('returns correct formatters for nationalCode', () {
      var result = typeInputFormatters(TypeEnum.nationalCode);
      expect(result, isNotEmpty);
      expect(result, contains(isA<LengthLimitingTextInputFormatter>()));
      expect(result, contains(isA<FilteringTextInputFormatter>()));
    });

    test('returns correct formatters for digit', () {
      var result = typeInputFormatters(TypeEnum.digit);
      expect(result, isNotEmpty);
      expect(result, contains(isA<FilteringTextInputFormatter>()));
      expect(result, isNot(contains(isA<LengthLimitingTextInputFormatter>())));
    });

    test('returns correct formatters for string', () {
      var result = typeInputFormatters(TypeEnum.string);
      expect(result, isNotEmpty);
      expect(result, contains(isA<LengthLimitingTextInputFormatter>()));
      expect(result, isNot(contains(isA<FilteringTextInputFormatter>())));
    });

    test('returns correct formatters for longString', () {
      var result = typeInputFormatters(TypeEnum.longString);
      expect(result, isNotEmpty);
      expect(result, contains(isA<LengthLimitingTextInputFormatter>()));
      expect(result, isNot(contains(isA<FilteringTextInputFormatter>())));
    });

    test('returns correct formatters for cvv2', () {
      var result = typeInputFormatters(TypeEnum.cvv2);
      expect(result, isNotEmpty);
      expect(result, contains(isA<LengthLimitingTextInputFormatter>()));
      expect(result, contains(isA<FilteringTextInputFormatter>()));
    });

    test('returns correct formatters for nationalCodeSerial', () {
      var result = typeInputFormatters(TypeEnum.nationalCodeSerial);
      expect(result, isNotEmpty);
      expect(result, contains(isA<LengthLimitingTextInputFormatter>()));
      expect(result, isNot(contains(isA<FilteringTextInputFormatter>())));
    });

    test('returns correct formatters for money', () {
      var result = typeInputFormatters(TypeEnum.money);
      expect(result, isNotEmpty);
      expect(result, contains(isA<FilteringTextInputFormatter>()));
      expect(result, contains(isA<TextInputFormatter>()));
    });
  });

  group('textInputType', () {
    test('returns correct TextInputType for loginCode', () {
      var result = textInputType(TypeEnum.loginCode);
      expect(result, TextInputType.number);
    });

    test('returns correct TextInputType for digit', () {
      var result = textInputType(TypeEnum.digit);
      expect(result, TextInputType.number);
    });

    test('returns correct TextInputType for mobile', () {
      var result = textInputType(TypeEnum.mobile);
      expect(result, TextInputType.number);
    });

    test('returns correct TextInputType for string', () {
      var result = textInputType(TypeEnum.string);
      expect(result, TextInputType.text);
    });

    test('returns correct TextInputType for email', () {
      var result = textInputType(TypeEnum.email);
      expect(result, TextInputType.emailAddress);
    });

    test('returns correct TextInputType for date', () {
      var result = textInputType(TypeEnum.date);
      expect(result, TextInputType.datetime);
    });

    test('returns correct TextInputType for postalCode', () {
      var result = textInputType(TypeEnum.postalCode);
      expect(result, TextInputType.phone);
    });

    test('returns correct TextInputType for cvv2', () {
      var result = textInputType(TypeEnum.cvv2);
      expect(result, TextInputType.phone);
    });
  });
}