class ProductCode {
  String? id;

  ProductCode({
    required this.id,
  });

  factory ProductCode.fromJson(Map<String, dynamic> json) =>
      ProductCode(id: json["id"]);
}
