import 'dart:convert';
import 'dart:io';
import 'package:donaciones/models/Donation.dart';
import 'package:http/http.dart' as http;

class ApiClient {

  String baseUrl = 'http://192.168.1.13:8000';

  Future<List> getUsuarios() async{
    try{
      var response = await http.get(Uri.parse(baseUrl + '/api/people'));
      if(response.statusCode==200){
        print(response.body);
        print("------------------------------------");
        print(jsonDecode(response.body));
        return jsonDecode(response.body);
      }else{
        return Future.error("Error de conexión");
      }
    }catch(e){
      return Future.error(e);
    }
  }

  Future setDonation(Map<String, dynamic>  donation) async{
    try{
      var response = await http.post(Uri.parse(baseUrl + '/api/donations/'),
          body: json.encode(donation),
          headers: {'content-type': 'application/json'}
      );
      if(response.statusCode==200){
        return jsonDecode(response.body);
      }else{
        return Future.error("Error de conexión");
      }
    }catch(e){
      return Future.error(e);
    }
  }
}