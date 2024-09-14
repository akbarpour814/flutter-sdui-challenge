class PropsModel {
  String? color;
  String? placeholder;
  String? size;
  String? type;

  PropsModel({this.color, this.placeholder, this.size, this.type});

  factory PropsModel.fromJson(Map<String, dynamic> json) => PropsModel(
        color: json['color'] as String?,
        placeholder: json['placeholder'] as String?,
        size: json['size'] as String?,
        type: json['type'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'color': color,
        'placeholder': placeholder,
        'size': size,
        'type': type,
      };
}
