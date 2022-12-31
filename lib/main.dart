import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:donaciones/controllers/AllRoutes.dart';
import 'package:donaciones/services/authenticator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: AllRoutes().getRoutes(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.amber,
      ),
      home: LoginMain(),
    );
  }
}

class LoginMain extends StatefulWidget {
  @override
  _LoginDemoState createState() => _LoginDemoState();
}

class _LoginDemoState extends State<LoginMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Dodona"),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            addMainPicture('image004.jpg'),
            addFormFild('Correo electrónico', 'Ingresa un correo válido, como abc@gmail.com'),
            addFormFild('Contraseña', 'Ingresa una contraseña segura'),
            addText('¿Olvidó su contraeña?'),
            addButton('correo', 'Ingresar', 10.0),
            addText('O'),
            addButton('google', 'google_icon.png', 8.0),
            addButton('facebook', 'facebook_icon.png', 0.0),
            const SizedBox(
              height: 50,
            ),
            const Text('¿Usuario nuevo? Crear cuenta')
          ],
        ),
      ),
    );
  }

  Widget addText(String t){
    return Text(t,
        style: TextStyle(
        fontSize: 18.0,
        color: Colors.deepOrangeAccent,
      )
    );
  }

  Widget addMainPicture(String picture){
    return Padding(
      padding: const EdgeInsets.only(top: 60.0, bottom: 30.0),
      child: Center(
        child: Container(
            width: 300,
            height: 150,
            /*decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50.0)),*/
            child: Image.asset('assets/images/' + picture)),
      ),
    );
  }
  Widget addButton(String option, String icon, double topMargin){
    return Container(
      margin: EdgeInsets.only(bottom: 8.0, top: topMargin),
      height: 50,
      width: 250,
      decoration: BoxDecoration(
          color: Colors.deepOrangeAccent, borderRadius: BorderRadius.circular(20)),
      child: TextButton(
        style: TextButton.styleFrom(
          foregroundColor: Colors.white,
        ),
        onPressed: () async{
          User?  user = null;
          if(option == 'google'){
            user = await Authenticator.initSession(context: context);
          }else if(option == 'facebook'){
            user = await Authenticator.initSessionFacebook(context: context);
          }

          if(user != null) {
            Navigator.pushNamed(context,'main_page');
          }

        },
          child: addButtonContent(icon),
      ),
    );
  }
  
  Widget addButtonContent(String data){
      if (data != 'Ingresar') {
        return Image.asset('assets/images/' + data);
      }
      else {
        return Text(data,
          style: new TextStyle(
            fontSize: 18.0,
          ),
        );
      }
  }

  Widget addFormFild(String label, String hint){
    return Padding(
      padding: EdgeInsets.only(left:30.0,right: 30.0, top:5, bottom: 10),
      child: TextField(
        obscureText: true,
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.deepOrangeAccent, width: 0.0),
            ),
            labelText: label,
            hintText: hint),
      ),
    );
  }
}
