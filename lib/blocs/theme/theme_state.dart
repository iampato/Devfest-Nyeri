import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

@immutable
class ThemeState extends Equatable{
  final ThemeData themeData;

  ThemeState({
    this.themeData
  }):super([themeData]);

  

  @override
  String toString() => 'ThemeState'; 
}