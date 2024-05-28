import 'package:intl/intl.dart';

class Notice {
  int? id;
  String? title;
  String? slug;
  String? subtitle;
  String? lead;
  String? body;
  int? hemocentre_user_id;
  int? view;
  String? created_at;
  String? updated_at;

  Notice({
    required this.id,
    required this.title,
    required this.slug,
    required this.subtitle,
    required this.lead,
    required this.hemocentre_user_id,
    required this.body,
    required this.view,
    required this.created_at,
    required this.updated_at,
  });

  factory Notice.fromMap(Map map) {
    String formattedDateCreated =
        DateFormat('dd/MM/yyyy').format(DateTime.parse(map['created_at']));
    String formattedDateUpdated =
        DateFormat('dd/MM/yyyy').format(DateTime.parse(map['updated_at']));

    return Notice(
      id: map['id'],
      title: map['title'],
      slug: map['slug'],
      subtitle: map['subtitle'],
      lead: map['lead'],
      hemocentre_user_id: map['hemocentre_user_id'],
      body: map['body'],
      view: map['view'],
      created_at: formattedDateCreated,
      updated_at: formattedDateUpdated,
    );
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'id': id,
      'title': title,
      'slug': slug,
      'subtitle': subtitle,
      'lead': lead,
      'hemocentre_user_id': hemocentre_user_id,
      'body': body,
      'view': view,
      'created_at': created_at,
      'updated_at': updated_at,
    };
    return map;
  }

  @override
  String toString() {
    return 'Notice(id: $id, title: $title)';
  }
}
