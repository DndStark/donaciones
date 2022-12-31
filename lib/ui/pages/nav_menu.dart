import 'package:donaciones/services/authenticator.dart';
import 'package:flutter/material.dart';
import 'package:donaciones/models/NavMenuItem.dart';

NavMenuItem m0 = NavMenuItem("Principal", Icons.home, "main_page");
NavMenuItem m1 = NavMenuItem("Donar", Icons.volunteer_activism, "dono_page");
NavMenuItem m2 = NavMenuItem("Mis donaciones", Icons.favorite, "my_donations");
NavMenuItem m3 = NavMenuItem("Mis campañas", Icons.campaign, "");
NavMenuItem m4 = NavMenuItem("Lugares de donación", Icons.location_on, "");
NavMenuItem m5 = NavMenuItem("Mi perfil", Icons.account_circle, "");

List<NavMenuItem> menuItemList = [m0, m1, m2, m3, m4, m5];

class NavMenu{
  Widget getNavMenu(context){
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              ' Bienvenido Miguel ',
              style: TextStyle(color: Colors.deepOrangeAccent, fontSize: 20, backgroundColor: Colors.white),
            ),
            decoration: BoxDecoration(
                color: Colors.deepOrangeAccent,
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/images/image001.jpg'))),
          ),
          getMenulist(context),
          ListTile(
              leading: Icon(Icons.logout),
              title: Text("Cerrar sesión"),
              onTap: () => {
                _signOut(context)
              }
          )
        ],
      ),
    );
  }

  Widget addMenuItem(context, NavMenuItem item){
    return ListTile(
      leading: Icon(item.icon),
      title: Text(item.name),
      onTap: () => {
        Navigator.pushNamed(context, item.page)
      }
    );
  }

  Widget getMenulist(context){
    return Column(
      children: <Widget>[
        for(int i = 0; i< menuItemList.length; i++)
          addMenuItem(context, menuItemList[i]),
      ],
    );
  }

  Future<void> _signOut(context) async {
    Authenticator.logoutSession();
    Navigator.pushNamed(context, 'login_page');
  }

}