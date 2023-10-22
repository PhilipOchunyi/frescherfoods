class ProductCategory {
  String? id;
  String? articleName;

  ProductCategory({required this.id, required this.articleName});

  factory ProductCategory.fromJson(Map<String, dynamic> json) =>
      ProductCategory(id: json["id"], articleName: json["articleName"]);
}
