import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StaticWidgets{

  static Widget getFloatingActionButton(context){
    return FloatingActionButton(
      child: Icon( Icons.volunteer_activism),
      onPressed: () =>{
        Navigator.pushNamed(context,'dono_page')
      },
    );
  }

  static Widget addText(String t){
    return Text(t,
        style: TextStyle(
          fontSize: 25.0,
          color: Colors.green,
        )
    );
  }

  static Widget addTittle(String t){
    return Text(t,
        style: TextStyle(
          fontSize: 30.0,
          color: Colors.black,
        )
    );
  }
}