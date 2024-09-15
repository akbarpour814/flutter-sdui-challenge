import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_sdui_challenge/features/car_management/data/models/form_fields_response_model/form_fields_response_model.dart';
import 'package:flutter_sdui_challenge/features/car_management/presentation/widgets/drop_down_generator.dart';
import 'package:flutter_sdui_challenge/features/car_management/presentation/widgets/image_picker_generator.dart';
import 'package:flutter_sdui_challenge/features/car_management/presentation/widgets/text_field_generator.dart';

class FormGeneratorWidget extends StatefulWidget {
  final FormFieldsResponseModel formFields;
  const FormGeneratorWidget({
    super.key,
    required this.formFields,
  });

  @override
  State<FormGeneratorWidget> createState() => _FormGeneratorWidgetState();
}

class _FormGeneratorWidgetState extends State<FormGeneratorWidget> {
  ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.all(16),
            controller: _scrollController,
            children: widget.formFields.fields!
                .map((e) => switch (e.type) {
                      'input' => TextFieldGenerator(
                          item: e,
                        ),
                      'textarea' => TextFieldGenerator(
                          item: e,
                        ),
                      'select' => (e.props?.options ?? []).isNotEmpty
                          ? DropDownGenerator(
                              item: e,
                            )
                          : const Center(),
                      'file' => ImagePickerGenerator(
                          item: e,
                          scrollController: _scrollController,
                        ),
                      String() => Center(),
                      null => Center(),
                    })
                .toList()));
  }
}
