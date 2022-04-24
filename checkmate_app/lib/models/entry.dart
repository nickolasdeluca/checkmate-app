import 'package:checkmate_app/models/items.dart';

class Entry {
  int id;
  DateTime date;
  String place;
  Items items;

  Entry(this.id, this.date, this.place, this.items);
}
