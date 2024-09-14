class StyleModel {
  String? borderRadius;
  String? margin;
  String? padding;

  StyleModel({this.borderRadius, this.margin, this.padding});

  factory StyleModel.fromJson(Map<String, dynamic> json) => StyleModel(
        borderRadius: json['borderRadius'] as String?,
        margin: json['margin'] as String?,
        padding: json['padding'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'borderRadius': borderRadius,
        'margin': margin,
        'padding': padding,
      };
}
