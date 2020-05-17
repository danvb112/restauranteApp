import 'package:path/path.dart';
import 'package:restauranteapp/model/cardapio.dart';

import 'package:sqflite/sqflite.dart';


final String cardapioTable = "cardapio";
final String idColumn = 'id';
final String nameColumn = 'name';
final String descricaoColumn = 'descricao';
final String precoColumn = 'preco';

Future<Database> initDb() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, "cardapios.db");

    return await openDatabase(path, onCreate: (Database db, int newerVersion)async{
      await db.execute(
          'CREATE TABLE $cardapioTable('
            '$idColumn INTEGER PRIMARY KEY AUTOINCREMENT,'  
            '$nameColumn VARCAHR(45) NOT NULL,' 
            '$descricaoColumn VARCHAR(100) NOT NULL,'
            '$precoColumn VARCHAR(10) NOT NULL)');
    }, version: 2, onDowngrade: onDatabaseDowngradeDelete  );
  }

  Map<String, dynamic> _toMap(Cardapio cardapio){
    final Map<String, dynamic> cardapioMap = Map();
    cardapioMap[idColumn] = cardapio.id  ;
    cardapioMap[nameColumn] = cardapio.name  ;
    cardapioMap[descricaoColumn] = cardapio.descricao ;
    cardapioMap[precoColumn] = cardapio.preco ;
    return cardapioMap;
  }


Future<List<Cardapio>> findAllCardapio() async {
  final Database db = await initDb();
  final List<Map<String, dynamic>> result = await db.query(cardapioTable);
  List<Cardapio> cardapioList = _toList(result);
  print(cardapioList);
  return cardapioList;
}

List<Cardapio> _toList(List<Map<String, dynamic>> result) {
  final List<Cardapio> users = List();
  for (Map<String, dynamic> row in result) {
    final Cardapio user = Cardapio( 
      row['name'], 
      row['descricao'], 
      row['preco'],
    );
    users.add(user);
  }
  return users;
}



  Future<int> saveCardapio(Cardapio cardapio)async{
    final Database dbCardapio = await initDb();
    final Map<String, dynamic> cardapioMap = await _toMap(cardapio);
    return dbCardapio.insert(cardapioTable, cardapioMap);
  }

  // Future<Cardapio> getCardapio(int id)async{
  //   final Database dbCardapio = await initDb();
  //   List<Map> maps = await dbCardapio.query(cardapioTable,
  //       columns: [idColumn, nameColumn, descricaoColumn, precoColumn],
  //       where: "$idColumn = ?",
  //       whereArgs: [id]);
  //   if(maps.length > 0){
  //     return Cardapio._toMap(maps.first);
  //   }else {
  //     return null;
  //   }
  // }

  Future<int> deleteCardapio(int id) async {
    final Database dbCardapio = await initDb();
    return await dbCardapio.delete(cardapioTable, where: "$idColumn = ?", whereArgs: [id]);
  }

  // Future<int> updateCardapio(Cardapio cardapio) async {
  //   final Database dbCardapio = await initDb();
  //   return await dbCardapio.update(cardapioTable,
  //       cardapio.toMap(),
  //       where: "$idColumn = ?",
  //       whereArgs: [cardapio.id]);
  // }

  // Future<List> getAllCardapio() async {
  //   final Database dbCardapio = await initDb();;
  //   List listMap = await dbCardapio.rawQuery("SELECT * FROM $cardapioTable");
  //   List<Cardapio> listCardapio = List();
  //   for(Map m in listMap){
  //     listCardapio.add(Cardapio._toMap(m));
  //   }
  //   return listCardapio;
  // }

  Future<int> getNumber() async{
      final Database dbCardapio = await initDb();
      return Sqflite.firstIntValue(await dbCardapio.rawQuery("SELECT COUNT(*) FROM $cardapioTable"));
  }

  Future close() async {
    final Database dbCardapio = await initDb();
    dbCardapio.close();
  }

