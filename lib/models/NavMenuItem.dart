import 'package:flutter/material.dart';

class NavMenuItem{
  String _name = "";
  IconData _icon = Icons.square_outlined;
  String _page = "";

  NavMenuItem(name, icon, page){
    this.name = name;
    this.icon = icon;
    this.page = page;
  }

  String get name => _name;
  set name(String newName) => _name = newName;

  IconData get icon => _icon;
  set icon(IconData newIcon) => _icon = newIcon;

  String get page => _page;
  set page(String newPage) => _page = newPage;
}