class Dimensions {
  final double width;
  final double height;
  final double depth;

  Dimensions({
    required this.width,
    required this.height,
    required this.depth,
  });

  factory Dimensions.fromJson(Map<String, dynamic> json) {
    return Dimensions(
      width: (json['width'] is int) ? (json['width'] as int).toDouble() : json['width'] as double,
      height: (json['height'] is int) ? (json['height'] as int).toDouble() : json['height'] as double,
      depth: (json['depth'] is int) ? (json['depth'] as int).toDouble() : json['depth'] as double,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'width': width,
      'height': height,
      'depth': depth,
    };
  }
}
