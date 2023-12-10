// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Payor {
  String payorName;
  double payable;
  int percentage;
  Payor({
    required this.payorName,
    required this.payable,
    required this.percentage,
  });
  





  Payor copyWith({
    String? payorName,
    double? payable,
    int? percentage,
  }) {
    return Payor(
      payorName: payorName ?? this.payorName,
      payable: payable ?? this.payable,
      percentage: percentage ?? this.percentage,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'payorName': payorName,
      'payable': payable,
      'percentage': percentage,
    };
  }

  factory Payor.fromMap(Map<String, dynamic> map) {
    return Payor(
      payorName: map['payorName'] as String,
      payable: map['payable'] as double,
      percentage: map['percentage'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Payor.fromJson(String source) => Payor.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Payor(payorName: $payorName, payable: $payable, percentage: $percentage)';

  @override
  bool operator ==(covariant Payor other) {
    if (identical(this, other)) return true;
  
    return 
      other.payorName == payorName &&
      other.payable == payable &&
      other.percentage == percentage;
  }

  @override
  int get hashCode => payorName.hashCode ^ payable.hashCode ^ percentage.hashCode;
}
