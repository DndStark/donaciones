import 'package:donaciones/authenticator.dart';
import 'package:donaciones/dono_page.dart';
import 'package:donaciones/main_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        'main_page': (context) => MainPage(),
        'dono_page': (context) => DonoPage(),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.amber,
      ),
      home: LoginDemo(),
    );
  }
}

class LoginDemo extends StatefulWidget {
  @override
  _LoginDemoState createState() => _LoginDemoState();
}

class _LoginDemoState extends State<LoginDemo> {
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
            Padding(
              padding: const EdgeInsets.only(top: 60.0, bottom: 30.0),
              child: Center(
                child: Container(
                    width: 300,
                    height: 150,
                    /*decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50.0)),*/
                    child: Image.asset('assets/images/image004.jpg')),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left:30.0, right: 30.0, top:5, bottom: 5),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepOrangeAccent, width: 0.0),
                    ),
                    labelText: 'Correo electrónico',
                    hintText: 'Ingresa un correo válido, como abc@gmail.com'),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left:30.0,right: 30.0, top:5, bottom: 10),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepOrangeAccent, width: 0.0),
                    ),
                    labelText: 'Contraseña',
                    hintText: 'Ingresa una contraseña segura'),
              ),
            ),
            TextButton(
              onPressed: (){
                //TODO FORGOT PASSWORD SCREEN GOES HERE
              },
              child: const Text(
                'Forgot Password',
                style: TextStyle(color: Colors.deepOrangeAccent, fontSize: 18),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 10.0),
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.deepOrangeAccent, borderRadius: BorderRadius.circular(20)
              ),
              child: TextButton(
                  style: TextButton.styleFrom(
                    primary: Colors.white,
                  ),
                onPressed: () { },
                child: Text('Ingresar',
                  style: new TextStyle(
                    fontSize: 18.0,
                  ),
                )
              ),
            ),
            const Text("O", style: TextStyle(
              fontSize: 18.0,
              color: Colors.deepOrangeAccent,
            )),
            Container(
              margin: const EdgeInsets.only(bottom: 8.0, top: 10.0),
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.deepOrangeAccent, borderRadius: BorderRadius.circular(20)),
              child: TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.black,
                ),
                onPressed: () async{
                  User?  user = await Authenticator.initSession(
                    context: context
                  );
                  if(user != null)
                    print(user);
                },
                child: Image.asset('assets/images/google_icon.png'),
              ),
            ),
            Container(margin: const EdgeInsets.only(bottom: 8.0),
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.deepOrangeAccent, borderRadius: BorderRadius.circular(20)),
              child: TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.black,
                ),
                onPressed: () async{
                  User?  user = await Authenticator.initSessionFacebook(
                      context: context
                  );
                },
                child: Image.asset('assets/images/facebook_icon.png'),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            const Text('¿Usuario nuevo? Crear cuenta')
          ],
        ),
      ),
    );
  }
}
