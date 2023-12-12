import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'user.dart';

class Profile {
  String name;
  num age;
  List<User> friends;
  Profile({
    required this.name,
    required this.age,
    required this.friends,
  });

  Profile copyWith({
    String? name,
    num? age,
    List<User>? friends,
  }) {
    return Profile(
      name: name ?? this.name,
      age: age ?? this.age,
      friends: friends ?? this.friends,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'age': age,
      'friends': friends.map((x) => x.toMap()).toList(),
    };
  }

  factory Profile.fromMap(Map<String, dynamic> map) {
    return Profile(
      name: map['name'] as String,
      age: map['age'] as num,
      friends: List<User>.from(
        (map['friends'] as List<dynamic>).map<User>(
          (x) => User.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Profile.fromJson(String source) =>
      Profile.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Profile(name: $name, age: $age, friends: $friends)';

  @override
  bool operator ==(covariant Profile other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.age == age &&
        listEquals(other.friends, friends);
  }

  @override
  int get hashCode => name.hashCode ^ age.hashCode ^ friends.hashCode;
}