import 'package:donaciones/ui/widgets/static_widgets.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:donaciones/controllers/AllRoutes.dart';
import 'package:donaciones/ui/pages/nav_menu.dart';

final List<String> imageList = [
  "https://cdn.pixabay.com/photo/2017/12/03/18/04/christmas-balls-2995437_960_720.jpg",
  "https://cdn.pixabay.com/photo/2017/12/13/00/23/christmas-3015776_960_720.jpg",
  "https://cdn.pixabay.com/photo/2019/12/19/10/55/christmas-market-4705877_960_720.jpg",
  "https://cdn.pixabay.com/photo/2019/12/20/00/03/road-4707345_960_720.jpg",
  "https://cdn.pixabay.com/photo/2019/12/22/04/18/x-mas-4711785__340.jpg",
  "https://cdn.pixabay.com/photo/2016/11/22/07/09/spruce-1848543__340.jpg"
];

class MainPage extends StatefulWidget{
  HomePage createState()=> HomePage();
}

class HomePage  extends State<MainPage> with TickerProviderStateMixin{

  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 5), vsync: this);
    animation = new CurvedAnimation(parent: controller, curve: Curves.linear);
    controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
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
        body: SingleChildScrollView(
          child: getBody(),
        ),
        drawer: NavMenu().getNavMenu(context),
        floatingActionButton: StaticWidgets.getFloatingActionButton(context)
      )
    );
  }

  Widget getBody(){
    return Padding(
      padding: EdgeInsets.only(right: 10.0, left: 10.0),
      child: Column(
        children: <Widget> [
          Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  StaticWidgets.addTittle("Los mejores donadores"),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget> [
                        addPBestPointerAnimation("Miguel", 45, 'primer_puesto.jpg'),
                        StaticWidgets.addText("Miguel Medina")
                      ]
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget> [
                        addPBestPointerAnimation("José", 70, 'segundo_puesto.jpg'),
                        StaticWidgets.addText("Milagros casas")
                      ]
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget> [
                        addPBestPointerAnimation("Samuel", 25, 'tercer_puesto.jpg'),
                        StaticWidgets.addText("Freddy Guzman")
                      ]
                  ),
                ],
              )
          ),
          Divider(color: Colors.black,),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: StaticWidgets.addTittle("Campañas de la semana"),
          ),
          Padding(
            padding:  EdgeInsets.only(right: 15.0, left: 15.0),
            child: Column(
                children: <Widget>[
                  addProgresBarAnimation(80),
                  addCampaign(
                      'Navidad',
                      'Creado por Miguel Medina',
                      'Esta campaña está dirigido para el distrito de Paucarpata - Miguel Grau'),
                  addProgresBarAnimation(20),
                  addCampaign(
                      'Ayuda',
                      'Creado por Juan Guzman',
                      'Esta campaña está dirigido para el distrito de ASA - Independencia'),
                ]
            ),
          ),
        ],
      ),
    );
  }

  Widget addPBestPointerAnimation(String name, double textSize, String image){
    return
      Column(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              controller.repeat();
            },
            child: GFAnimation(
              duration: Duration(seconds: 1),
              controller: controller,
              type: GFAnimationType.scaleTransition,
              child: Image.asset(
                'assets/images/'+ image,
                width: 60,
                height: 60,
              ),
            ),
          ),
        ],
      );
  }

  Widget addProgresBarAnimation(int porcentaje){
     return GFProgressBar(
       percentage: 0.01 * porcentaje,
       lineHeight: 30,
       alignment: MainAxisAlignment.spaceBetween,
       child: Text('meta al '+porcentaje.toString() + '%', textAlign: TextAlign.end,
         style: TextStyle(fontSize: 25, color: Colors.white),
       ),
       leading : Icon( Icons.sentiment_dissatisfied, color: GFColors.DANGER),
       trailing: Icon( Icons.sentiment_satisfied, color: GFColors.SUCCESS),
       backgroundColor: Colors.black26,
       progressBarColor: GFColors.INFO,
     );
  }

  Widget addCampaign(tittle, subtitle, description){
    return GFCard(
      boxFit: BoxFit.cover,
      image: Image.asset('assets/images/image001.jpg'),
      title: GFListTile(
        avatar: GFAvatar(
          backgroundImage: AssetImage('assets/images/image001.jpg'),
        ),
        title: StaticWidgets.addTittle(tittle),
        subTitle: Text(subtitle),
      ),
      content: Text(description),
      buttonBar: GFButtonBar(
        children: <Widget>[
          GFButton(
            onPressed: () {
              Navigator.pushNamed(context,'dono_page');
              //ApiClient a = ApiClient();
              //getUsuario
            },
            text: 'Participar',
          ),
        ],
      ),
    );
  }
}