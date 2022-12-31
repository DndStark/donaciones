import 'package:donaciones/services/ApiClient.dart';
import 'package:donaciones/ui/widgets/static_widgets.dart';
import 'package:flutter/material.dart';
import 'package:donaciones/controllers/AllRoutes.dart';
import 'package:donaciones/ui/pages/nav_menu.dart';
import 'package:donaciones/models/Donation.dart';

  // Create a Form widget.
class DonoPage extends StatelessWidget {
  const DonoPage({super.key});

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Dodona';

    return MaterialApp(
        routes: AllRoutes().getRoutes(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.amber,
        ),
        home:  Scaffold(
          appBar: AppBar(
            title: const Text('Dodona'),
          ),
          body: const MyCustomForm(),
          drawer: NavMenu().getNavMenu(context),
        )
    );
  }
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {

  String objName = "";
  String objDescription = "";
  int objAmount = 0;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
  // Build a Form widget using the _formKey created above.
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.only(top: 25.0, right: 25.0, left: 25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StaticWidgets.addTittle("Donación en progreso..."),
              getTextFormField("Nombre del objeto a donar", "d1"),
              getTextFormField("Descripción del objeto a donar", "d2"),
              getTextFormField("¿Qué cantidad de objetos donará?", "d4"),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      saveData();
                    }
                  },
                  child: const Text('Donar'),
                ),
              ),
            ],
          ),
        ),
      ),
    );

  }

  Widget getTextFormField(String title, String tag){
    return TextFormField(
      decoration: InputDecoration(
        suffix: GestureDetector(
          child: Text(
            tag,
          ),
        ),
        labelText: title,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Ingresar datos por favor';
        }
        return null;
      },
      onSaved: (value){
        switch(tag){
          case 'd1': objName = value!;
            break;
          case 'd2': objDescription = value!;
            break;
          case 'd3': objAmount = (value!=null)?int.parse(value):0;
            break;
        }
      },
    );
  }

  void saveData() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Registrando...')),
    );
    _formKey.currentState?.save();

    Donation d = Donation(
        objName,
        objDescription,
        'https://miguelmedina.online/img/minions43.jpg',
        1, 1, 1, 3);
    print(objName.runtimeType);
    print(objDescription.runtimeType);
    ApiClient apiClient = ApiClient();
    print(d.toJson()['donation_name'].runtimeType);
    print(d.toJson()['donation_description'].runtimeType);
    print(d.toJson()['donation_photo'].runtimeType);
    print(d.toJson()['user'].runtimeType);
    print(d.toJson()['category'].runtimeType);
    print(d.toJson()['detail'].runtimeType);
    print(d.toJson()['campaign'].runtimeType);

    apiClient.setDonation(d.toJson());

  }
}