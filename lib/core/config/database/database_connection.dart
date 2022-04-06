// ignore_for_file: avoid_print

import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shamo/core/core.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseConnection {
  Database? _database;
  static final DatabaseConnection db = DatabaseConnection._();
  DatabaseConnection._();

  Future<Database> get database async {
    if (_database == null) {
      Directory documentsDirectory = await getApplicationDocumentsDirectory();
      final path = join(documentsDirectory.path, ConstantHelper.DATABASE_NAME);
      return await openDatabase(
        path,
        version: 1,
        onOpen: (db) {},
      );
    }

    return _database!;
  }
}
