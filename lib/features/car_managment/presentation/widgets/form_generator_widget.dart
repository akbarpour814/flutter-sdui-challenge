import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_sdui_challenge/features/car_managment/data/models/form_fields_response_model/form_fields_response_model.dart';
import 'package:flutter_sdui_challenge/features/car_managment/presentation/widgets/drop_down_generator.dart';
import 'package:flutter_sdui_challenge/features/car_managment/presentation/widgets/text_field_generator.dart';

class FormGeneratorWidget extends StatelessWidget {
  final FormFieldsResponseModel formFields;
  const FormGeneratorWidget({
    super.key,
    required this.formFields,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.all(16),
            children: formFields.fields!
                .map((e) => switch (e.type) {
                      'input' => TextFieldGenerator(
                          item: e,
                        ),
                      'select' => (e.props?.options ?? []).isNotEmpty
                          ? DropDownGenerator(
                              item: e,
                            )
                          : const Center(),
                      String() => Center(),
                      // TODO: Handle this case.
                      null => Center(),
                    })
                .toList()));
  }
}
