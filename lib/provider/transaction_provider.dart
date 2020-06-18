import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/provider.dart';
import '../database/transactions_database.dart';
import '../model/transaction.dart';
import 'bank_provider.dart';

class TransActionProvider with ChangeNotifier {
  List<Transaction> _transactions = [];

  List<Transaction> accounts(int bankId) {
    getTransactionsFromDb(bankId);
    return _transactions.where((e) => e.bankId == bankId).toList();
  }

  void getTransactionsFromDb(int bankId) {
    TransactionsDataBase().getAllTransactions(bankId).then((value) {
      _transactions = value;
      notifyListeners();
    });
  }

  Future<void> pay(BuildContext context,Transaction transaction) async {
    //enter a new pay for account
    print('account count is ${transaction.count}');
    await TransactionsDataBase().insertTransaction(transaction);

    var bank =
    Provider.of<BankProvider>(context,listen: false).findById(transaction.bankId);
    bank.amount =  bank.amount - transaction.count;
    print('new amount of bank is ${bank.amount}');
    Provider.of<BankProvider>(context,listen: false).updateBank(bank);

    _transactions.add(transaction);
    notifyListeners();
  }

  Future<void> receive(BuildContext context, Transaction transaction) async {
    await TransactionsDataBase().insertTransaction(transaction);

    var bank =
    Provider.of<BankProvider>(context,listen: false).findById(transaction.bankId);
    bank.amount =  bank.amount + transaction.count;
    Provider.of<BankProvider>(context,listen: false).updateBank(bank);

    _transactions.add(transaction);
    notifyListeners();
  }

  Future<int> getTransactionBalance(int bankId) async {
    int balance = 0;
    await _transactions.map((t) {
      if (t.bankId == bankId && !t.isPay) {
        balance += t.count;
      }
    });
    return balance;
  }

  void deleteTransaction(int trasnactionId) async {
    await TransactionsDataBase().delete(trasnactionId);
    _transactions.removeWhere((element) => element.id == trasnactionId);
    notifyListeners();
  }
}
