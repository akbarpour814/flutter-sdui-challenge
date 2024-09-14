import 'package:flutter_sdui_challenge/features/car_managment/data/models/form_fields_response_model/options_model.dart';

class PropsModel {
  String? color;
  String? placeholder;
  String? size;
  String? type;
  List<OptionsModel>? options;

  PropsModel(
      {this.color, this.placeholder, this.size, this.type, this.options});

  factory PropsModel.fromJson(Map<String, dynamic> json) => PropsModel(
      color: json['color'] as String?,
      placeholder: json['placeholder'] as String?,
      size: json['size'] as String?,
      type: json['type'] as String?,
      options: (json['options'] as List<dynamic>?)
          ?.map((e) => OptionsModel.fromJson(e as Map<String, dynamic>))
          .toList());

  Map<String, dynamic> toJson() => {
        'color': color,
        'placeholder': placeholder,
        'size': size,
        'type': type,
        'options': options?.map((e) => e.toJson())
      };
}
