import 'dart:ui';

import 'package:flutter/material.dart';

class Bank {
  int id;
  String name;
  int amount;
  String cardNumber;
  String cardDate;
  Color color;

  Bank(this.name, this.cardNumber,this.amount, this.cardDate, this.color, {this.id});

  static List<Bank> banks = [
    Bank('Melli', '-',0, '-', Colors.red, id: 1),
    Bank('Mellat', '-', 0,'-', Colors.pink, id: 2),
    Bank('Saderat', '-',0, '-', Colors.blue, id: 3),
    Bank('Mehr Eghtesad', '-',0, '-', Colors.green, id: 4),
    Bank('Sepah', '-', 0,'-', Colors.blue, id: 5),
    Bank('Eghtesad Novin', '-', 0,'-', Colors.green, id: 6),
    Bank('Keshavarzi', '-',0, '-', Colors.green, id: 7),
    Bank('Tejarat', '-',0, '-', Colors.amber, id: 8),
    Bank('Refah', '-', 0,'-', Colors.grey, id: 9),
    Bank('Post Bank', '-',0, '-', Colors.green, id: 10),
    Bank('Wallet', '-', 0,'-', Colors.brown, id: 11),
  ];

  Map<String, dynamic> toMap() {
    return {
//      'id': id,
      'name': name,
      'amount':amount,
      'cardNumber': cardNumber,
      'cardDate': cardDate,
      'color': color.value.toString(),
    };
  }

  Bank.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    amount = map['amount'];
    cardNumber = map['cardNumber'];
    cardDate = map['cardDate'];
    color = Color(int.parse('${map['color']}'));
  }

  @override
  String toString() {
    return name;
  }
}
