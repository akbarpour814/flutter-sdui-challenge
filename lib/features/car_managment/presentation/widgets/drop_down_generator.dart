import 'package:flutter/material.dart';
import 'package:flutter_sdui_challenge/core/utils/validators.dart';
import 'package:flutter_sdui_challenge/features/car_managment/data/models/form_fields_response_model/field_model.dart';
import 'package:flutter_sdui_challenge/features/car_managment/data/models/form_fields_response_model/options_model.dart';

class DropDownGenerator extends StatefulWidget {
  final FieldModel item;
  const DropDownGenerator({
    super.key,
    required this.item,
  });

  @override
  State<DropDownGenerator> createState() => _DropDownGeneratorState();
}

class _DropDownGeneratorState extends State<DropDownGenerator> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(double.parse(
            (widget.item.style?.margin ?? '10').replaceAll('px 0', ''))),
        child: ButtonTheme(
          layoutBehavior: ButtonBarLayoutBehavior.constrained,
          alignedDropdown: true,
          child: DropdownButtonFormField<OptionsModel>(
            value: widget.item.selectedOptions,
            items: widget.item.props?.options!
                .map((e) => DropdownMenuItem<OptionsModel>(
                    value: e,
                    alignment: Alignment.centerRight,
                    child: Text(e.label ?? '')))
                .toList(),
            onChanged: (value) {},
            decoration: InputDecoration(
                labelText: widget.item.label,
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(double.parse(
                        (widget.item.style?.borderRadius ?? '8')
                            .replaceAll('px', '')))),
                contentPadding: EdgeInsets.all(double.parse(
                    (widget.item.style?.padding ?? '8').replaceAll('px', '')))),
            validator: (value) =>
                dropdownValidator(value, (widget.item.label ?? '').replaceAll(':', '')),
          ),
        ));
  }
}
