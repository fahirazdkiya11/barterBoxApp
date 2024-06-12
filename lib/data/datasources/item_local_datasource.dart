
import 'package:barterboxapp/data/models/response/item_response_models.dart';
import 'package:sqflite/sqflite.dart';

class ItemLocalDatasource {
  ItemLocalDatasource._init();

  static final ItemLocalDatasource instance = ItemLocalDatasource._init();

  final String tableItems = 'items';

  static Database? _database;

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = dbPath + filePath;

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $tableItems (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        item_id INTEGER,
        user_id INTEGER
        nama_pemilik TEXT,
        nama_item TEXT,
        status TEXT,
        catatan_tambahan TEXT,
        image TEXT,
        lokasi TEXT
      )
    ''');
  }

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('barterweb.db');
    return _database!;
  }

  //remove all data Item
  Future<void> removeAllItem() async {
    final db = await instance.database;
    await db.delete(tableItems);
  }

  //get all data Item
  Future<List<Item>> getAllItem() async {
    final db = await instance.database;
    final result = await db.query(tableItems);

    return result.map((e) => Item.fromMap(e)).toList();
  }
}
