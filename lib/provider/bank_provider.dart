import 'package:flutter/material.dart';
import '../database/banks_database.dart';
import '../model/bank.dart';

class BankProvider with ChangeNotifier {
  List<Bank> _banks = [];

  List<Bank> get banks {
    getBankFromDb();
    return [..._banks];
  }

  void getBankFromDb() {
    BanksDataBase().getAllBanks().then((value) {
      _banks = value;
      notifyListeners();
    });
  }

  Bank findById(int bankId) {
    return _banks.firstWhere((element) => element.id == bankId);
  }

  void addBank(Bank bank) async {
    await BanksDataBase().insertBank(bank);

    _banks.add(bank);
    notifyListeners();
  }

  void updateBank(Bank bank) async {
    print('bank amount ${bank.amount}');

    await BanksDataBase().update(bank);

    for (int i = 0; i < _banks.length; i++) {
      if (_banks[i].id == bank.id) {
        _banks[i] = bank;
      }
    }

    notifyListeners();
  }
}
