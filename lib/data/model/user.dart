// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:get/get.dart';

import 'package:get_x/data/model/transactions.dart';

import 'contact.dart';

class User {
  String firstName;
  String lastName;
  String id;
  String accountNumber;
  double balance;
  RxList<Transaction> transactions = <Transaction>[].obs;
  RxList<Contact> contacts = <Contact>[].obs;
  User({
    required this.firstName,
    required this.lastName,
    required this.id,
    required this.accountNumber,
    required this.balance,
    required this.transactions,
    required this.contacts,
  });

  User copyWith({
    String? firstName,
    String? lastName,
    String? id,
    String? accountNumber,
    double? balance,
    RxList<Transaction>? transactions,
    RxList<Contact>? contacts,
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
    return <String, dynamic>{
      'firstName': firstName,
      'lastName': lastName,
      'id': id,
      'accountNumber': accountNumber,
      'balance': balance,
      'transactions':
          transactions.map((transaction) => transaction.toMap()).toList(),
      'contacts': contacts.map((contact) => contact.toMap()).toList(),
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
        firstName: map['firstName'] as String,
        lastName: map['lastName'] as String,
        id: map['id'] as String,
        accountNumber: map['accountNumber'] as String,
        balance: map['balance'] as double,
        transactions: RxList<Transaction>.from(
          (map['transactions'] as List<dynamic>).map(
            (t) => Transaction.fromMap(t as Map<String, dynamic>),
          ),
        ),
        contacts: RxList<Contact>.from((map['contacts'] as List<dynamic>).map(
          (c) => Contact.fromMap(c as Map<String, dynamic>),
        )));
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User(firstName: $firstName, lastName: $lastName, id: $id, accountNumber: $accountNumber, balance: $balance, transactions: $transactions, contacts: $contacts)';
  }

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return other.firstName == firstName &&
        other.lastName == lastName &&
        other.id == id &&
        other.accountNumber == accountNumber &&
        other.balance == balance &&
        other.transactions == transactions &&
        other.contacts == contacts;
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
