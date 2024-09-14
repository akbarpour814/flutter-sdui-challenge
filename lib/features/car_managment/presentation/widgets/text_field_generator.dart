import 'package:flutter/material.dart';
import 'package:flutter_sdui_challenge/core/utils/const.dart';
import 'package:flutter_sdui_challenge/core/utils/extentions.dart';
import 'package:flutter_sdui_challenge/core/utils/utils.dart';
import 'package:flutter_sdui_challenge/core/utils/validators.dart';
import 'package:flutter_sdui_challenge/features/car_managment/data/models/form_fields_response_model/field_model.dart';

class TextFieldGenerator extends StatelessWidget {
  final FieldModel item;
  const TextFieldGenerator({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(
          double.parse((item.style?.margin ?? '10').replaceAll('px 0', ''))),
      child: TextFormField(
        keyboardType:
            item.props?.type == 'number' ? textInputType(TypeEnum.digit) : null,
        inputFormatters: item.props?.type == 'number'
            ? typeInputFormatters(TypeEnum.digit)
            : null,
        controller: item.controller,
        maxLines: item.props?.rows != null ? item.props!.rows! : 1,
        minLines: item.props?.rows != null ? item.props!.rows! : 1,
        decoration: InputDecoration(
            labelText: item.label,
            hintText: item.props?.placeholder ?? 'مقدار را وارد نمایید',
            hintStyle: TextStyle(
                fontSize: item.props?.size == 'large' ? 16 : 14,
                color: item.props != null && item.props!.color.isNotNullOrEmpty
                    ? Color(int.parse(
                        '0xff${item.props!.color!.replaceAll('#', '')}'))
                    : null),
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(double.parse(
                    (item.style?.borderRadius ?? '8').replaceAll('px', '')))),
            contentPadding: EdgeInsets.all(double.parse(
                (item.style?.padding ?? '8').replaceAll('px', '')))),
        validator: (value) =>
            generalValidator(value, (item.label ?? '').replaceAll(':', '')),
      ),
    );
  }
}
