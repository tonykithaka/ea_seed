class Conversation {
  final int id;
  final String uuid;
  final String photo;
  final String title;
  final String body;
  final int admin_id;
  final String ip;
  final String deleted_at;
  final String created_at;
  final String updated_at;

  Conversation(
      {this.id,
      this.uuid,
      this.photo,
      this.title,
      this.body,
      this.admin_id,
      this.created_at,
      this.deleted_at,
      this.ip,
      this.updated_at});

  Conversation.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        uuid = json['uuid'],
        photo = json['photo'],
        title = json['title'],
        body = json['body'],
        admin_id = json['admin_id'],
        created_at = json['created_at'],
        deleted_at = json['deleted_at'],
        ip = json['ip'],
        updated_at = json['updated_at'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'uuid': uuid,
        'photo': photo,
        'title': title,
        'body': body,
        'admin_id': admin_id,
        'created_at': created_at,
        'deleted_at': deleted_at,
        'ip': ip,
        'updated_at': updated_at,
      };
}
