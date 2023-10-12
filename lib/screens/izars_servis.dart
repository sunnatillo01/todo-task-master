import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todo_height/data.dart';

class IsarService {
  late final Future<Isar> db;
  IsarService() {
    db = openDB();
  }

  Future<void> saveData(Data user) async {
    final isar = await db;
    isar.writeTxnSync(() => isar.datas.putSync(user));
  }

  Future<List<Data>> getAllData() async {
    final isar = await db;

    return isar.datas.where().findAll();
  }

  getDataWithId(Id id) async {
    final isar = await db;
    return isar.datas.get(id);
  }

  Future<bool> removeData(int id) async {
    final isar = await db;
    return await isar.writeTxn(() async => await isar.datas.delete(id));
  }

  /////////////////////////
  Future<Isar> openDB() async {
    final dir = await getApplicationDocumentsDirectory();
    if (Isar.instanceNames.isEmpty) {
      return await Isar.open(
        [DataSchema],
        inspector: true,
        directory: dir.path,
      );
    }

    return Future.value(Isar.getInstance());
  }
}
