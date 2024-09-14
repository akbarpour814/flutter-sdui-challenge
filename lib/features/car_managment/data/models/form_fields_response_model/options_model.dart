class OptionsModel {
  String? label;
  String? value;

  OptionsModel({this.label, this.value});

  factory OptionsModel.fromJson(Map<String, dynamic> json) => OptionsModel(
        label: json['label'] as String?,
        value: json['value'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'label': label,
        'value': value,
      };
}
