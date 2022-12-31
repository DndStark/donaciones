import 'package:donaciones/main.dart';
import 'package:donaciones/ui/pages/main_page.dart';
import 'package:donaciones/ui/pages/dono_page.dart';
import 'package:donaciones/ui/pages/my_donations.dart';

class AllRoutes{
  getRoutes(){
    return {
      'login_page': (context) => LoginMain(),
      'main_page': (context) => MainPage(),
      'dono_page': (context) => DonoPage(),
      'my_donations': (context) => MyDonations(),
    };
  }
}