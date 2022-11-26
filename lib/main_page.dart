import 'package:donaciones/models/Donation.dart';
import 'package:donaciones/models/NavMenuItem.dart';
import 'package:flutter/material.dart';

Donation d1 = Donation("Casaca", "description", "Vestuario", "registrationDate", "detailId", "José Ramirez");
Donation d2 = Donation("Almohada", "description", "Muebles", "registrationDate", "detailId", "Daniel Coaguila");
Donation d3 = Donation("Tostador", "description", "Electrodomestico", "registrationDate", "detailId", "Norma Choque");
Donation d4 = Donation("Arroz", "description", "Alimentos", "registrationDate", "detailId", "María Condori");
Donation d5 = Donation("Leche", "description", "Muebles", "registrationDate", "detailId", "Abel Perez");
Donation d6 = Donation("Frazada", "description", "Electrodomestico", "registrationDate", "detailId", "Sofía Ayquipa");

List<Donation> donationList = [d1, d2, d3, d4, d5, d6, d1, d2, d3, d3, d4, d5, d6];

NavMenuItem m0 = NavMenuItem("Principal", Icons.volunteer_activism);
NavMenuItem m1 = NavMenuItem("Donar", Icons.volunteer_activism);
NavMenuItem m2 = NavMenuItem("Mis donaciones", Icons.favorite);
NavMenuItem m3 = NavMenuItem("Mi perfil", Icons.account_circle);
NavMenuItem m4 = NavMenuItem("Ajustes", Icons.settings);
NavMenuItem m5 = NavMenuItem("Salir", Icons.logout);

List<NavMenuItem> menuItemList = [m1, m2, m3, m4, m5];

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: const Text('Dodona'),
      ),
      body: getDonationlist(),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text(
                ' Hola Miguel',
                style: TextStyle(color: Colors.blue, fontSize: 25),
              ),
              decoration: BoxDecoration(
                  color: Colors.deepOrangeAccent,
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('assets/images/image001.jpg'))),
            ),
            ListTile(
              leading: Icon(Icons.input),
              title: Text('Bienvenido'),
              onTap: () => {},

            ),
            getMenulist()
          ],
        ),
      ),
    );
  }

  Widget addDonationItem(Donation donation){
    return ListTile(
      trailing: Icon(Icons.arrow_forward),
      leading: Icon(Icons.volunteer_activism),
      title: Text(donation.name),
      subtitle: Text(donation.userName),
    );
  }

  Widget getDonationlist(){
    return ListView(
      children: <Widget>[
        for(int i = 0; i< donationList.length; i++)
          addDonationItem(donationList[i]),
      ],
    );
  }

  Widget addMenuItem(NavMenuItem item){
    return ListTile(
      leading: Icon(item.icon),
      title: Text(item.name),
      onTap: () => {}
    );
  }

  Widget getMenulist(){
    return Column(
      children: <Widget>[
        for(int i = 0; i< menuItemList.length; i++)
          addMenuItem(menuItemList[i]),
      ],
    );
  }
}