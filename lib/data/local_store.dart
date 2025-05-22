import 'dart:convert';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../data/algorithm.dart';

late final Database? _database;

/// Initializes the database.
/// Call on startup of Flutter application.
Future<void> openDB() async {
  _database = await openDatabase(
    join(await getDatabasesPath(), "learncfop.db"),
    version: 1,
    onCreate: (db, version) async {
      // initializing tables:
      await _createAlgorithmTable(db, "OLLAlgorithms");
      // adding specific fields of subclass "OLLAlgorithm":
      await _addColumn(
          db, "OLLAlgorithms", "caseConfiguration", "TEXT NOT NULL");
      await _createAlgorithmTable(db, "PLLAlgorithms");
      // adding specific fields of subclass "PLLAlgorithm":
      await _addColumn(
          db, "PLLAlgorithms", "caseConfiguration", "TEXT NOT NULL");
      await _addColumn(db, "PLLAlgorithms", "arrows", "TEXT NOT NULL");
    },
  );
}

/// Stores an algorithm to local storage.
Future<void> storeAlgorithm(Algorithm algorithm) async {
  if (_database == null) {
    throw ("There is no open database. Try to open one first!");
  }
  if (algorithm is OLLAlgorithm) {
    _database!.insert("OLLAlgorithms", algorithm.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  } else if (algorithm is PLLAlgorithm) {
    _database!.insert("PLLAlgorithms", algorithm.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }
}

// /// Loads an algorithm from local storage.
// /// Important: use the id naming conventions, f.e. "oll-42" or "pll2look-3".
// Future<Algorithm?> loadAlgorithm(String id) async {
//   if (_database == null) {
//     throw ("There is no open database. Try to open one first!");
//   }

//   String tableName;
//   if (_getAlgorithmType(id) is OLLAlgorithm) {
//     tableName = "OLLAlgorithms";
//   } else if (_getAlgorithmType(id) is PLLAlgorithm) {
//     tableName = "PLLAlgorithms";
//   } else {
//     return null;
//   }

//   final List<Map<String, dynamic>> results =
//       await _database!.query(tableName, where: "id = id");
//   final Map<String, dynamic> result = results[0];

//   if (_getAlgorithmType(id) is OLLAlgorithm) {
//     result["caseConfiguration"] = jsonDecode(result["caseConfiguration"]);
//     return OLLAlgorithm.fromMap(result);
//   } else if (_getAlgorithmType(id) is PLLAlgorithm) {
//     result["caseConfiguration"] =
//         jsonDecode(result["caseConfiguration"]) as List<String>;
//     result["arrows"] = jsonDecode(result["arrows"]) as List<List<dynamic>>;
//     return PLLAlgorithm.fromMap(result);
//   }

//   return null;
// }

/// Loads all algorithms where given SQL condition is met.
Future<List<Algorithm>> loadAlgorithmsWhere(String sqlCondition) async {
  if (_database == null) {
    throw ("There is no open database. Try to open one first!");
  }

  final List<Algorithm> algorithms = [];

  // query OLL rows:
  final List<Map<String, dynamic>> ollResults = [];
  ollResults
      .addAll(await _database!.query("OLLAlgorithms", where: sqlCondition));
  if (ollResults.isNotEmpty) {
    // parse OLL SQL results into proper JSON:
    for (int i = 0; i < ollResults.length; i++) {
      ollResults[i]["caseConfiguration"] =
          jsonDecode(ollResults[i]["caseConfiguration"]) as List<int>;
    }
    // create OLL algorithms:
    for (Map<String, dynamic> ollResult in ollResults) {
      algorithms.add(OLLAlgorithm.fromMap(ollResult));
    }
  }

  // query PLL rows:
  final List<Map<String, dynamic>> pllResults = [];
  pllResults
      .addAll(await _database!.query("PLLAlgorithms", where: sqlCondition));
  if (pllResults.isNotEmpty) {
    // parse PLL SQL results into proper JSON:
    for (int i = 0; i < pllResults.length; i++) {
      pllResults[i]["caseConfiguration"] =
          jsonDecode(pllResults[i]["caseConfiguration"]) as List<String>;
      pllResults[i]["arrows"] =
          jsonDecode(pllResults[i]["arrows"]) as List<List<dynamic>>;
    }
    // create PLL algorithms:
    for (Map<String, dynamic> pllResult in pllResults) {
      algorithms.add(PLLAlgorithm.fromMap(pllResult));
    }
  }

  return algorithms;
}

/// Helper method that creates a database table which has all fields of the
/// "Algorithm" superclass.
Future<void> _createAlgorithmTable(Database db, String tableName) async {
  await db.execute("""CREATE TABLE $tableName (id TEXT PRIMARY KEY,
                                          label TEXT NOT NULL,
                                          algorithm TEXT NOT NULL,
                                          notes TEXT,
                                          isFavourite INTEGER)""");
}

/// Helper method that adds adds a column to an existing table.
/// Watch out for the right MySQLite datatypes!
Future<void> _addColumn(
    Database db, String tableName, String columnName, String dataType) async {
  if (_database == null) {
    throw ("There is no open database. Try to open one first!");
  }
  switch (dataType.toUpperCase()) {
    case "NULL":
    case "INTEGER":
    case "INTEGER NOT NULL":
    case "REAL":
    case "REAL NOT NULL":
    case "TEXT":
    case "TEXT NOT NULL":
    case "BLOB":
    case "BLOB NOT NULL":
      await db.execute("ALTER TABLE $tableName ADD $columnName $dataType");
    default:
      throw ("$dataType is not a MySQLite Type, use INTEGER, REAL, TEXT, BLOB or NULL");
  }
}

// /// Helper method that decodes a SQL row into proper JSON.
// Map<String, dynamic> _decodeSQLRow(Map<String, dynamic> sqlRow) {
//   sqlRow["caseConfiguration"] = ;
// }

/// Helper method that determines the type of a given algorithm id.
Type? _getAlgorithmType(String id) {
  String first = id.split("-")[0];
  if (first == "oll") {
    return OLLAlgorithm;
  } else if (first == "pll") {
    return PLLAlgorithm;
  }
  return null;
}
