// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Transaction {
  String transactionID;
  DateTime date;
  String type;
  double amount;
  String description;
  Transaction({
    required this.transactionID,
    required this.date,
    required this.type,
    required this.amount,
    required this.description,
  });

  Transaction copyWith({
    String? transactionID,
    DateTime? date,
    String? type,
    double? amount,
    String? description,
  }) {
    return Transaction(
      transactionID: transactionID ?? this.transactionID,
      date: date ?? this.date,
      type: type ?? this.type,
      amount: amount ?? this.amount,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'transactionID': transactionID,
      'date': date,
      'type': type,
      'amount': amount,
      'description': description,
    };
  }

  factory Transaction.fromMap(Map<String, dynamic> map) {
    return Transaction(
      transactionID: map['transactionID'] as String,
      date: map['date'] as DateTime,
      type: map['type'] as String,
      amount: map['amount'] as double,
      description: map['description'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Transaction.fromJson(String source) =>
      Transaction.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Transaction(transactionID: $transactionID, date: $date, type: $type, amount: $amount, description: $description)';
  }

  @override
  bool operator ==(covariant Transaction other) {
    if (identical(this, other)) return true;

    return other.transactionID == transactionID &&
        other.date == date &&
        other.type == type &&
        other.amount == amount &&
        other.description == description;
  }

  @override
  int get hashCode {
    return transactionID.hashCode ^
        date.hashCode ^
        type.hashCode ^
        amount.hashCode ^
        description.hashCode;
  }
}
