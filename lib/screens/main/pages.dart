import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PageItem {
  late String title;
  late Widget body;
  late Widget unselectedIcon;
  late Widget selectedIcon;

  PageItem(this.title, this.body, this.selectedIcon, this.unselectedIcon);
}
