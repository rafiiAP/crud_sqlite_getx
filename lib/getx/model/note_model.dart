import 'package:crud_sqlite/getx/model/note_entity.dart';

class NoteModel {
  String cTitle;
  String cDescription;
  String cCreatedAt;
  int id;

  NoteModel({
    required this.cTitle,
    required this.cDescription,
    required this.cCreatedAt,
    required this.id,
  });

  factory NoteModel.fromJson(Map<String, dynamic> json) {
    return NoteModel(
      cTitle: json['title'] ?? '',
      cDescription: json['description'] ?? '',
      cCreatedAt: json['createdAt'] ?? '',
      id: json['id'] ?? '',
    );
  }

  Map<String, dynamic> toSQL() => {
        'title': cTitle,
        'description': cDescription,
        'createdAt': cCreatedAt,
        'id': id,
      };

  NoteEntity toEntity() => NoteEntity(
        cTitle: cTitle,
        cDescription: cDescription,
        cCreatedAt: cCreatedAt,
        id: id,
      );
}
