class Crops {
  final int id;
  final String uuid;
  final String name;
  final String photo;
  final int admin_id;
  final String deleted_at;
  final String created_at;
  final String updated_at;

  Crops(
      {this.uuid,
      this.created_at,
      this.admin_id,
      this.deleted_at,
      this.id,
      this.name,
      this.photo,
      this.updated_at});

  Crops.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        uuid = json['uuid'],
        name = json['name'],
        photo = json['photo'],
        admin_id = json['admin_id'],
        deleted_at = json['deleted_at'],
        created_at = json['created_at'],
        updated_at = json['updated_at'];
}

class PreferredCrops {
  String uuid;

  PreferredCrops({this.uuid});

  PreferredCrops.toJson(Map<String, dynamic> json) : uuid = json['uuid'];
}

class PreferredCropsResponse {
  final bool status;
  final String type;
  final String message;

  PreferredCropsResponse({this.message, this.status, this.type});
}
