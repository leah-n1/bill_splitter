// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Transaction {
  String id;
  String date;
  String type;
  double amount;
  String description;
  Transaction({
    required this.id,
    required this.date,
    required this.type,
    required this.amount,
    required this.description,
  });

  Transaction copyWith({
    String? id,
    String? date,
    String? type,
    double? amount,
    String? description,
  }) {
    return Transaction(
      id: id ?? this.id,
      date: date ?? this.date,
      type: type ?? this.type,
      amount: amount ?? this.amount,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'date': date,
      'type': type,
      'amount': amount,
      'description': description,
    };
  }

  factory Transaction.fromMap(Map<String, dynamic> map) {
    return Transaction(
      id: map['id'] as String,
      date: map['date'] as String,
      type: map['type'] as String,
      amount: map['amount'] as double,
      description: map['description'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Transaction.fromJson(String source) => Transaction.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Transaction(id: $id, date: $date, type: $type, amount: $amount, description: $description)';
  }

  @override
  bool operator ==(covariant Transaction other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.date == date &&
      other.type == type &&
      other.amount == amount &&
      other.description == description;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      date.hashCode ^
      type.hashCode ^
      amount.hashCode ^
      description.hashCode;
  }
}
 