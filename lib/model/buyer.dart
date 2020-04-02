class Buyers {
  final String uuid;
  final String name;
  final String email;
  final String phone;
  final String country;
  final String region;

  Buyers(
      {this.name,
      this.uuid,
      this.country,
      this.email,
      this.phone,
      this.region});

  Buyers.fromJson(Map<String, dynamic> json)
      : uuid = json['uuid'],
        name = json['name'],
        country = json['country'],
        email = json['email'],
        phone = json['phone'],
        region = json['region'];
}
