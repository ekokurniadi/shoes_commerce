import 'package:shamo/core/migrations/base/migration_base.dart';
import 'package:sqflite/sqflite.dart';

class Migration01 extends MigrationBase {
  @override
  Future<void> import(Database database) async {
    await database.execute("CREATE TABLE test_migrations("
        "id INTEGER PRIMARY KEY AUTOINCREMENT,"
        ")");
  }
}
