import 'dart:convert';

class Contact {
  String name;
  String? accountNumber;
  String? id;
  double? amount;
  double? percentage;
  Contact({
    required this.name,
    this.accountNumber,
    this.id,
    this.amount,
    this.percentage,
  });

  Contact copyWith({
    String? name,
    String? accountNumber,
    String? id,
    double? amount,
    double? percentage,
  }) {
    return Contact(
      name: name ?? this.name,
      accountNumber: accountNumber ?? this.accountNumber,
      id: id ?? this.id,
      amount: amount ?? this.amount,
      percentage: percentage ?? this.percentage,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'name': name});
    if(accountNumber != null){
      result.addAll({'accountNumber': accountNumber});
    }
    if(id != null){
      result.addAll({'id': id});
    }
    if(amount != null){
      result.addAll({'amount': amount});
    }
    if(percentage != null){
      result.addAll({'percentage': percentage});
    }
  
    return result;
  }

  factory Contact.fromMap(Map<String, dynamic> map) {
    return Contact(
      name: map['name'] ?? '',
      accountNumber: map['accountNumber'],
      id: map['id'],
      amount: map['amount']?.toDouble(),
      percentage: map['percentage']?.toDouble(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Contact.fromJson(String source) => Contact.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Contact(name: $name, accountNumber: $accountNumber, id: $id, amount: $amount, percentage: $percentage)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Contact &&
      other.name == name &&
      other.accountNumber == accountNumber &&
      other.id == id &&
      other.amount == amount &&
      other.percentage == percentage;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      accountNumber.hashCode ^
      id.hashCode ^
      amount.hashCode ^
      percentage.hashCode;
  }
}
