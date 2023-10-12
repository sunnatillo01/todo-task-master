import 'package:isar/isar.dart';

part 'data.g.dart';

@collection
class Data {
  Id id = Isar.autoIncrement;
  String? name;
  String? description;
  String? lat;
  String? long;
  String? time;
  String? colorIndex;
}
