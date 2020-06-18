class Transaction {
  int id;
  int bankId;
  int count;
  bool isPay;
  String forWhat;

  Transaction(this.bankId, this.forWhat, this.count, this.isPay);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'bankId': bankId,
      'count': count,
      'isPay': isPay ? 1 : 0,
      'forWhat': forWhat,
    };
  }

  Transaction.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    bankId = map['bankId'];
    count = map['count'];
    isPay = map['isPay'] == 1;
    forWhat = map['forWhat'];
  }

  @override
  String toString() {
    return forWhat;
  }
}
