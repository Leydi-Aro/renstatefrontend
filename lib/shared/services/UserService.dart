
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:renstatefrontend/models/User.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserService {

  //final String baseUrl= "http://192.168.135.66:8080/api/users";
  final String baseUrl= "https://roomrest.azurewebsites.net/api/users";

  Future<int?> registerUser(String name, String lastName, String email, String password) async {
    try {
      final apiUrl = baseUrl;

      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'name': name,
          'lastName': lastName,
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 201) {
        final dynamic responseData = json.decode(response.body);

        if (responseData is int && responseData != 0) {
          return responseData;

        }
      } else {
        print('Error en la solicitud HTTP: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error en la solicitud HTTP: $e');
      return null;
    }
  }


  Future<User> getUserById(int userId) async {
      final apiUrl = '$baseUrl/$userId';

      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final dynamic jsonData = json.decode(utf8.decode(response.bodyBytes));
          return User.fromJson(jsonData);
      } else {
        throw Exception('Error en la solicitud HTTP: ${response.statusCode}');
      }
  }


  Future<int?> loginUser(String email, String password) async {
    try {
      final apiUrl = '$baseUrl/login';

      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        final dynamic responseData = json.decode(response.body);

        if (responseData is int && responseData != 0) {
          saveUserId(responseData);
          return responseData;
        } else {
          return null; // Usuario no encontrado
        }
      } else {
        print('Error en la solicitud HTTP: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error en la solicitud HTTP: $e');
      return null;
    }
  }



  Future<void> saveUserId(int userId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('user_id', userId);
  }

  Future<int?> getUserLogedId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt('user_id');
  }

  Future<void> removeUserLogedId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('user_id');
  }
}
