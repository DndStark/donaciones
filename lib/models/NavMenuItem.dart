import 'package:flutter/material.dart';

class NavMenuItem{
  String _name = "";
  IconData _icon = Icons.square_outlined;

  NavMenuItem(name, icon){
    this.name = name;
    this.icon = icon;
  }

  String get name => _name;
  set name(String newName) => _name = newName;

  IconData get icon => _icon;
  set icon(IconData newIcon) => _icon = newIcon;
}