// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class DashboardCategoryModel {
  final String title;
  final String heading;
  final String subHeading;
  final VoidCallback? onPress;
  DashboardCategoryModel(
    this.title,
    this.heading,
    this.subHeading,
    this.onPress,
  );
  static List<DashboardCategoryModel> list = [
    DashboardCategoryModel('C', 'Canvas Paintings', '15 Items', null),
    DashboardCategoryModel('C', 'Pebble Paintings', '15 Items', null),
    DashboardCategoryModel('C', 'Pencil Portraits', '15 Items', null),
    DashboardCategoryModel('C', 'Pencil Generic', '15 Items', null),
    DashboardCategoryModel('C', 'Wall Paintings', '15 Items', null),
  ];
}
