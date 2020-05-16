import 'package:path/path.dart';
import 'package:restauranteapp/model/User.dart';
import 'package:sqflite/sqflite.dart';

final String _name = 'name';
final String _email = 'email';
final String _address = 'address';
final String _cpf = 'cpf';
final String _fone = 'fone';
final String _password = 'password';
final String _tableName = 'login';

Future<Database> getDatabase() async {
  final String path = join(await getDatabasesPath(), 'restaurante.db');
  return openDatabase(path, onCreate: (db, version) {
    db.execute('CREATE TABLE $_tableName('
        '$_name VARCHAR(45) NOT NULL,'
        '$_email VARCHAR(100) NOT NULL,'
        '$_address VARCHAR(100) NOT NULL,'
        '$_cpf VARCHAR(11),'
        '$_fone VARCHAR(15),'
        '$_password VARCHAR(8),'
        'PRIMARY KEY(cpf))');
  }, version: 3);
}

Map<String, dynamic> _toMap(User user) {
  final Map<String, dynamic> userMap = Map();
  userMap[_name] = user.name;
  userMap[_email] = user.email;
  userMap[_address] = user.address;
  userMap[_cpf] = user.cpf;
  userMap[_fone] = user.fone;
  userMap[_password] = user.password;
  return userMap;
}


Future<int> save(User user) async {
  final Database db = await getDatabase();
  final Map<String, dynamic> userMap = _toMap(user);
  return db.insert('login', userMap);
}

Future<List<User>> findAll() async {
  final Database db = await getDatabase();
  final List<Map<String, dynamic>> result = await db.query(_tableName);
  List<User> users = _toList(result);
  print(users);
  return users;
}

List<User> _toList(List<Map<String, dynamic>> result) {
  final List<User> users = List();
  for (Map<String, dynamic> row in result) {
    final User user = User(row[_name], row[_email], row[_address], row[_cpf],
        row[_fone], row[_password]);
    users.add(user);
  }
  return users;
}

Future<bool> verificationLogin({emailLogin, passwordLogin}) async {
  final List<Map<String, dynamic>> user = await findUserByEmail(emailLogin);
  if(user.isNotEmpty){

  }
  
}


Future<List<Map<String, dynamic>>> findUserByEmail(String emailLogin) async{
  final Database db = await getDatabase();
  final List<Map<String, dynamic>> result = await db.rawQuery("SELECT * FROM login WHERE email = '$emailLogin'");
  print('$result');
  return result;
}








// final List<User> users = await findAll();

//   for (User user in users) {
//     final String emailDatabase = user.email;
//     final String passwordDatabase = user.password;
//     print('Email: $emailDatabase senha: $passwordDatabase');
//     // if (emailLogin == emailDatabase) {
//     //   if (passwordLogin == passwordDatabase) {
//     //     print('true');
//     //     return true;
//     //   }
//     // } else {
//     //   print('false');
//     //   return false;
//     // }
//   }