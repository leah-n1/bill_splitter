
import 'dart:convert';

class Contact {
  String name;
  String accountNumber;
  String id;
  Contact({
    required this.name,
    required this.accountNumber,
    required this.id,
  });

  Contact copyWith({
    String? name,
    String? accountNumber,
    String? id,
  }) {
    return Contact(
      name: name ?? this.name,
      accountNumber: accountNumber ?? this.accountNumber,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'accountNumber': accountNumber,
      'id': id,
    };
  }

  factory Contact.fromMap(Map<String, dynamic> map) {
    return Contact(
      name: map['name'] as String,
      accountNumber: map['accountNumber'] as String,
      id: map['id'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Contact.fromJson(String source) => Contact.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Contact(name: $name, accountNumber: $accountNumber, id: $id)';

  @override
  bool operator ==(covariant Contact other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.accountNumber == accountNumber &&
      other.id == id;
  }

  @override
  int get hashCode => name.hashCode ^ accountNumber.hashCode ^ id.hashCode;
}
 