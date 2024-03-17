import 'dart:convert';
import 'package:amruta_ayurveda/data/models/login_model.dart';
import 'package:http/http.dart' as http;

final baseUrl = 'https://flutter-amr.noviindus.in/api/';

class UserRepository {
  Future<login> signIn(Map<String, dynamic> lData) async {
    try {
      Map<String, String> formData = {
        'username': lData['email'],
        'password': lData['password'],
      };
      var response = await http.post(
        Uri.parse(baseUrl + 'Login'),
        body: formData,
      );

      if (response.statusCode == 200) {
        print('Form submitted successfully');
        print(response.body);
        Map<String, dynamic> responseBody = json.decode(response.body);
        return login.fromJson(responseBody);
      } else {
        print('Failed to submit form. Error: ${response.statusCode}');
        throw ('Login faild');
      }
    } catch (e) {
      rethrow;
    }
  }
}
