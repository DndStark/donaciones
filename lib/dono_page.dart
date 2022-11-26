import 'package:donaciones/models/Donation.dart';
import 'package:flutter/material.dart';

  // Create a Form widget.
class DonoPage extends StatelessWidget {
  const DonoPage({super.key});

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Dodona';

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
        ),
        body: const MyCustomForm(),
      ),
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
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
  // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          getFormTextField("Nombre del objeto a donar", "d1"),
          getFormTextField("Descripción del objeto a donar", "d2"),
          getFormTextField("Seleccione una categoría", "d3"),
          getFormTextField("¿Qué cantidad donará?", "d3"),
          getFormTextField("Seleccione fecha de caducidad", "d4"),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Registrando...')),
              );
            }
          },
          child: const Text('Donar'),
          ),
        ),
        ],
      ),
    );
  }

  Widget getFormTextField(String title, String tag){
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
    );
  }
}