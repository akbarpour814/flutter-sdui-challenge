import 'package:flutter/material.dart';
import 'package:flutter_sdui_challenge/features/car_managment/data/models/form_fields_response_model/options_model.dart';

import 'props_model.dart';
import 'style_model.dart';

class FieldModel {
  String? label;
  String? name;
  PropsModel? props;
  StyleModel? style;
  String? type;
  OptionsModel? selectedOptions;
  TextEditingController controller = TextEditingController();

  FieldModel({this.label, this.name, this.props, this.style, this.type});

  factory FieldModel.fromJson(Map<String, dynamic> json) => FieldModel(
        label: json['label'] as String?,
        name: json['name'] as String?,
        props: json['props'] == null
            ? null
            : PropsModel.fromJson(json['props'] as Map<String, dynamic>),
        style: json['style'] == null
            ? null
            : StyleModel.fromJson(json['style'] as Map<String, dynamic>),
        type: json['type'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'label': label,
        'name': name,
        'props': props?.toJson(),
        'style': style?.toJson(),
        'type': type,
      };
}
