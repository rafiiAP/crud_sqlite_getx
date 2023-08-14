// ignore_for_file: avoid_print

import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart' as sql;

class SQLHelper {
  ///---UNTUK MEMBUAT TABEL DATABASE---
  static Future createTables(sql.Database database) async {
    await database.execute("""CREATE TABLE items(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        title TEXT,
        description TEXT,
        createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
      )
      """);
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase(
      'ehe.db',
      version: 1,
      onCreate: (database, version) async {
        await createTables(database);
      },
    );
  }

  ///---UNTUK MENAMBAHKAN DATA---
  static Future<int> createItem(title, String? description) async {
    final db = await SQLHelper.db();

    final data = {
      'title': title,
      'description': description,
    };
    final id = await db.insert(
      'items',
      data,
      conflictAlgorithm: sql.ConflictAlgorithm.replace,
    );

    return id;
  }

  ///---READ SEMUA ITEM---
  static Future<List<Map<String, dynamic>>> getItems() async {
    final db = await SQLHelper.db();

    return db.query('items', orderBy: "id");
  }

  ///---READ SINGLE ITEM---
  static Future<List<Map<String, dynamic>>> getItem(int id) async {
    print('---res');
    final db = await SQLHelper.db();
    print('---res');
    var result = db.query(
      'items',
      orderBy: 'createAt ASC',
    );
    print('---res$result');
    return result;
  }

  ///---UNTUK MENGEDIT DATA---
  static Future<int> updateItem(
      int id, String title, String? description) async {
    final db = await SQLHelper.db();

    final data = {
      'title': title,
      'description': description,
      'createdAt': DateTime.now().toString(),
    };

    final result = await db.update(
      "items",
      data,
      where: "id = ?",
      whereArgs: [id],
    );
    return result;
  }

  ///---UNTUK MENDELETE DATA---
  static Future deleteItem(int id) async {
    final db = await SQLHelper.db();

    try {
      await db.delete(
        "items",
        where: "id = ?",
        whereArgs: [id],
      );
    } catch (e) {
      debugPrint("Something went wrong when deleting an item: $e");
    }
  }
}
