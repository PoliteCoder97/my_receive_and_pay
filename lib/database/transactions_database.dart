import './my_database.dart';
import '../model/transaction.dart';

class TransactionsDataBase extends MyDatabase {
  //  -------------- insert data to table --------------------
  Future<int> insertTransaction(Transaction transaction) async {
    var db = await getDb();

    int result;
    try {
      result = await db.insert('transactions', transaction.toMap());
    } catch (e) {
      print('catch the error $e');
//      insertSimNumber(deviceSimNumber);
      result = -1;
    }
//    await db.close();
    return result;
  }

//  ------------ update data --------------------
  Future<int> update(Transaction transaction) async {
    var db = await getDb();
    var result;

    try {
      result = await db
          .update('transactions', transaction.toMap(), where: 'id = ?', whereArgs: [transaction.id]);
    } catch (e) {
      print('catch the error update $e');
      update(transaction);
    }
//    db.close();
    return result;
  }

// ------------ delete data ---------------------
  void delete(int id) async {
    var db = await getDb();
    try {
      await db.delete('transactions', where: 'id= ?', whereArgs: [id]);
    } catch (e) {}
//    db.close();
  }

  Future<void> truncate() async {
    var db = await getDb();
    try {
      await db.delete('transactions');
    } catch (e) {
      print(e.toString());
    }
//    db.close();
//    return result;
  }

// ------------ get data ------------------------
  Future<List<Transaction>> getAllTransactions(int bankId) async {
    List<Transaction> list = List();

    var db = await getDb();

    try {
      List<Map> maps = await db.rawQuery('SELECT * FROM transactions WHERE bankId = $bankId');
      for (Map map in maps) {
        Transaction bank = Transaction.fromMap(map);
        list.add(bank);
      }
    } catch (e) {
      print('catch the error $e');
    }

//    db.close();
    return list;
  }
}
