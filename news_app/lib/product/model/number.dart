// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class Number extends Equatable {
  final String? number;
  const Number({
    this.number,
  });

  @override
  List<Object?> get props => [number];

  Number copyWith({
    String? number,
  }) {
    return Number(
      number: number ?? this.number,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'number': number,
    };
  }

  factory Number.fromMap(Map<String, dynamic> map) {
    return Number(
      number: map['number'] != null ? map['number'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Number.fromJson(String source) => Number.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;
}
