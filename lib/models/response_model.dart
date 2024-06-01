final class ResponseModel<T> {
  final T? data;
  final int? total;
  final int? skip;
  final int? limit;

  ResponseModel({this.data, this.total, this.skip, this.limit});

  factory ResponseModel.fromJson(Map<String, dynamic> json) {
    return ResponseModel<T>(
      data: json['products'],
      total: json['total'],
      skip: json['skip'],
      limit: json['limit'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data,
      'total': total,
      'skip': skip,
      'limit': limit,
    };
  }
}
