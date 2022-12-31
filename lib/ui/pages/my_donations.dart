import 'package:donaciones/models/Donation.dart';
import 'package:donaciones/ui/widgets/static_widgets.dart';
import 'package:flutter/material.dart';
import 'package:donaciones/ui/pages/nav_menu.dart';

class MyDonations extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dodona'),
      ),
      body: getBody(),
      drawer: NavMenu().getNavMenu(context),
      floatingActionButton: StaticWidgets.getFloatingActionButton(context),
    );
  }

  Widget getBody(){
    return
      ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          Container(
            height: 50,
            color: Colors.amber[600],
            child: const Center(child: Text('Entry A')),
          ),
          Container(
            height: 50,
            color: Colors.amber[500],
            child: const Center(child: Text('Entry B')),
          ),
          Container(
            height: 50,
            color: Colors.amber[100],
            child: const Center(child: Text('Entry C')),
          ),
        ],
      );
  }
}