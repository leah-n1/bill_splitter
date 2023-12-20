// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:get_x/data/model/transactions.dart';

import 'contact.dart';

class User {
  String firstName;
  String lastName;
  String id;
  String accountNumber;
  double balance;
  List<Transaction>? transactions;
  List<Contact>? contacts;
  User({
    required this.firstName,
    required this.lastName,
    required this.id,
    required this.accountNumber,
    required this.balance,
    this.transactions,
    this.contacts,
  });

  

  User copyWith({
    String? firstName,
    String? lastName,
    String? id,
    String? accountNumber,
    double? balance,
    List<Transaction>? transactions,
    List<Contact>? contacts,
  }) {
    return User(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      id: id ?? this.id,
      accountNumber: accountNumber ?? this.accountNumber,
      balance: balance ?? this.balance,
      transactions: transactions ?? this.transactions,
      contacts: contacts ?? this.contacts,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'firstName': firstName});
    result.addAll({'lastName': lastName});
    result.addAll({'id': id});
    result.addAll({'accountNumber': accountNumber});
    result.addAll({'balance': balance});
    if(transactions != null){
      result.addAll({'transactions': transactions!.map((x) => x?.toMap()).toList()});
    }
    if(contacts != null){
      result.addAll({'contacts': contacts!.map((x) => x?.toMap()).toList()});
    }
  
    return result;
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      firstName: map['firstName'] ?? '',
      lastName: map['lastName'] ?? '',
      id: map['id'] ?? '',
      accountNumber: map['accountNumber'] ?? '',
      balance: map['balance']?.toDouble() ?? 0.0,
      transactions: map['transactions'] != null ? List<Transaction>.from(map['transactions']?.map((x) => Transaction.fromMap(x))) : null,
      contacts: map['contacts'] != null ? List<Contact>.from(map['contacts']?.map((x) => Contact.fromMap(x))) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() {
    return 'User(firstName: $firstName, lastName: $lastName, id: $id, accountNumber: $accountNumber, balance: $balance, transactions: $transactions, contacts: $contacts)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is User &&
      other.firstName == firstName &&
      other.lastName == lastName &&
      other.id == id &&
      other.accountNumber == accountNumber &&
      other.balance == balance &&
      listEquals(other.transactions, transactions) &&
      listEquals(other.contacts, contacts);
  }

  @override
  int get hashCode {
    return firstName.hashCode ^
      lastName.hashCode ^
      id.hashCode ^
      accountNumber.hashCode ^
      balance.hashCode ^
      transactions.hashCode ^
      contacts.hashCode;
  }
}

