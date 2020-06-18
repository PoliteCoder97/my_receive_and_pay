import './my_database.dart';
import '../model/bank.dart';

class BanksDataBase extends MyDatabase {
  //  -------------- insert data to table --------------------
  Future<int> insertBank(Bank bank) async {
    var db = await getDb();

    int result;
    try {
      result = await db.insert('banks', bank.toMap());
    } catch (e) {
      print('catch the error $e');
//      insertSimNumber(deviceSimNumber);
      result = -1;
    }
//    await db.close();
    return result;
  }

//  ------------ update data --------------------
  Future<int> update(Bank bank) async {
    var db = await getDb();
    var result;

    try {
      result = await db
          .update('banks', bank.toMap(), where: 'id = ?', whereArgs: [bank.id]);
    } catch (e) {
      print('catch the error update $e');
      update(bank);
    }
//    db.close();
    return result;
  }

// ------------ delete data ---------------------
  void delete(int id) async {
    var db = await getDb();
    try {
      await db.delete('banks', where: 'id= ?', whereArgs: [id]);
    } catch (e) {}
//    db.close();
  }

  Future<void> truncate() async {
    var db = await getDb();
    try {
      await db.delete('banks');
    } catch (e) {
      print(e.toString());
    }
//    db.close();
//    return result;
  }

// ------------ get data ------------------------
  Future<List<Bank>> getAllBanks() async {
    List<Bank> list = List();

    var db = await getDb();

    try {
      List<Map> maps = await db.rawQuery('SELECT * FROM banks');
      for (Map map in maps) {
        Bank bank = Bank.fromMap(map);
        list.add(bank);
      }
    } catch (e) {
      print('catch the error $e');
    }

//    db.close();
    return list;
  }
}
