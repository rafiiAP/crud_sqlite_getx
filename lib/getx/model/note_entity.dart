// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class NoteEntity extends Equatable {
  String cTitle;
  String cDescription;
  String cCreatedAt;
  int id;
  NoteEntity({
    this.cTitle = '',
    this.cDescription = '',
    this.cCreatedAt = '',
    this.id = 0,
  });

  @override
  List<Object?> get props => [
        cTitle,
        cDescription,
        cCreatedAt,
        id,
      ];
}
