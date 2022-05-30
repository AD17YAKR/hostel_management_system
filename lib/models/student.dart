import 'package:flutter/material.dart';

class Student {
  late final String? name;
  late final String? roomNo;
  late final String? guardianNumber;
  late final String? personalNumber;
  late final bool? isVeg;
  late final bool? isPresent;
  Student({
    this.name,
    this.roomNo,
    this.guardianNumber,
    this.personalNumber,
    this.isVeg,
    this.isPresent,
  });
}
