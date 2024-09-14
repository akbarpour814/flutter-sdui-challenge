import 'field_model.dart';

class FormFieldsResponseModel {
  List<FieldModel>? fields;

  FormFieldsResponseModel({this.fields});

  factory FormFieldsResponseModel.fromJson(Map<String, dynamic> json) {
    return FormFieldsResponseModel(
      fields: (json['fields'] as List<dynamic>?)
          ?.map((e) => FieldModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'fields': fields?.map((e) => e.toJson()).toList(),
      };
}
