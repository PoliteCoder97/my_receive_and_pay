import 'dart:ui';

import 'package:flutter/material.dart';

class Bank {
  int id;
  String name;
  int amount;
  String cardNumber;
  String cardDate;
  Color color;

  Bank(this.name, this.cardNumber, this.amount, this.cardDate, this.color,
      {this.id});

  static List<Bank> banks = [
    Bank('Melli', '-', 0, '-', Colors.red[400], id: 1),
    Bank('Mellat', '-', 0, '-', Colors.pink[400], id: 2),
    Bank('Saderat', '-', 0, '-', Colors.blue[400], id: 3),
    Bank('Mehr Eghtesad', '-', 0, '-', Colors.green[400], id: 4),
    Bank('Sepah', '-', 0, '-', Colors.blue[400], id: 5),
    Bank('Eghtesad Novin', '-', 0, '-', Colors.green[400], id: 6),
    Bank('Keshavarzi', '-', 0, '-', Colors.green[400], id: 7),
    Bank('Tejarat', '-', 0, '-', Colors.amber[400], id: 8),
    Bank('Refah', '-', 0, '-', Colors.grey[400], id: 9),
    Bank('Post Bank', '-', 0, '-', Colors.green[400], id: 10),
    Bank('Wallet', '-', 0, '-', Colors.brown[400], id: 11),
  ];

  Map<String, dynamic> toMap() {
    return {
//      'id': id,
      'name': name,
      'amount': amount,
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
