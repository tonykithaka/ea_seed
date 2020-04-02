class News {
  final int id;
  final String uuid;
  final String photo;
  final String caption;
  final String title;
  final String body;
  final int admin_id;
  final String ip;
  final String expires_at;
  final bool status;
  final String deleted_at;
  final String created_at;
  final String updated_at;

  News(
      {this.id,
      this.uuid,
      this.photo,
      this.caption,
      this.title,
      this.body,
      this.status,
      this.admin_id,
      this.created_at,
      this.deleted_at,
      this.expires_at,
      this.ip,
      this.updated_at});

  News.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        uuid = json['uuid'],
        photo = json['photo'],
        caption = json['caption'],
        title = json['title'],
        body = json['body'],
        status = json['status'],
        admin_id = json['admin_id'],
        created_at = json['created_at'],
        deleted_at = json['deleted_at'],
        expires_at = json['expires_at'],
        ip = json['ip'],
        updated_at = json['updated_at'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'uuid': uuid,
        'photo': photo,
        'caption': caption,
        'title': title,
        'body': body,
        'status': status,
        'admin_id': admin_id,
        'created_at': created_at,
        'deleted_at': deleted_at,
        'expires_at': expires_at,
        'ip': ip,
        'updated_at': updated_at,
      };
}

class NewsResponse {
  final List<News> newsList;
  NewsResponse({this.newsList});
}
