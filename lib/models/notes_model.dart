import 'package:hive/hive.dart';

part 'notes_model.g.dart';

@HiveType(typeId: 0)
class NotesModel extends HiveObject {
  @HiveField(0)
  String title;
  @HiveField(1)
  String desc;
  @HiveField(2)
  String time;
  @HiveField(3)
  int color;

  NotesModel({
    required this.title,
    required this.desc,
    required this.time,
    required this.color,
  });
  @override
  String toString() {
    return 'title: $title desc: $desc time: $time color: $color';
  }
}
