class County {
  final int id;
  final String uuid;
  final String name;
  final int country_id;
  final String deleted_at;
  final String created_at;
  final String updated_at;

  County(
      {this.uuid,
      this.name,
      this.updated_at,
      this.created_at,
      this.deleted_at,
      this.id,
      this.country_id});

  County.fromJson(Map<String, dynamic> json)
      : uuid = json["uuid"],
        id = json["id"],
        name = json["name"],
        country_id = json["country_id"],
        deleted_at = json["deleted_at"],
        created_at = json["created_at"],
        updated_at = json["updated_at"];
}
