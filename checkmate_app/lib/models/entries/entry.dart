import 'package:checkmate_app/models/items/item.dart';
import 'package:hive/hive.dart';

part 'entry.g.dart';

@HiveType(typeId: 0)
class Entry extends HiveObject {
  @HiveField(0)
  int id;

  @HiveField(1)
  DateTime? date;

  @HiveField(2)
  String? place;

  @HiveField(3)
  List<Item> items;

  Entry({required this.id, this.date, this.place, required this.items});
}
