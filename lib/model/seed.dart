class Seed {
  final String uuid;
  final String name;
  final String photo;
  final String categoryName;
  final String productName;

  Seed({
    this.uuid,
    this.name,
    this.photo,
    this.categoryName,
    this.productName,
  });

  Seed.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        uuid = json['uuid'],
        photo = json['photo'],
        categoryName = json['categoryName'],
        productName = json['productName'];
}
