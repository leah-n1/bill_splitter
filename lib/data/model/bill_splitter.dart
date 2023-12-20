// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'dart:convert';

// import 'package:flutter/foundation.dart';

// import 'package:get_x/data/model/transactions.dart';

// import 'payor.dart';

//  class BillSplitter {
// Transaction transaction;
// List<Payor> payors;
//   BillSplitter({
//     required this.transaction,
//     required this.payors,
//   });






//   BillSplitter copyWith({
//     Transaction? transaction,
//     List<Payor>? payors,
//   }) {
//     return BillSplitter(
//       transaction: transaction ?? this.transaction,
//       payors: payors ?? this.payors,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'transaction': transaction.toMap(),
//       'payors': payors.map((x) => x.toMap()).toList(),
//     };
//   }

//   factory BillSplitter.fromMap(Map<String, dynamic> map) {
//     return BillSplitter(
//       transaction: Transaction.fromMap(map['transaction'] as Map<String,dynamic>),
//       payors: List<Payor>.from((map['payors'] as List<int>).map<Payor>((x) => Payor.fromMap(x as Map<String,dynamic>),),),
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory BillSplitter.fromJson(String source) => BillSplitter.fromMap(json.decode(source) as Map<String, dynamic>);

//   @override
//   String toString() => 'BillSplitter(transaction: $transaction, payors: $payors)';

//   @override
//   bool operator ==(covariant BillSplitter other) {
//     if (identical(this, other)) return true;
  
//     return 
//       other.transaction == transaction &&
//       listEquals(other.payors, payors);
//   }

//   @override
//   int get hashCode => transaction.hashCode ^ payors.hashCode;
// }
