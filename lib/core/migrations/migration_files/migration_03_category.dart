import 'package:shamo/core/migrations/base/migration_base.dart';
import 'package:sqflite_common/sqlite_api.dart';

class Migration03Category extends MigrationBase {
  @override
  Future<void> import(Database database) async {
    await database.execute("CREATE TABLE category ("
        "id INTEGER PRIMARY KEY AUTOINCREMENT, "
        "name TEXT "
        ")");
  }
}
