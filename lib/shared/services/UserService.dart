
import 'dart:convert';
import 'package:http/http.dart' as http;


class UserService {
  final String baseUrl= "http://192.168.18.15:8080/api/users";



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
}
