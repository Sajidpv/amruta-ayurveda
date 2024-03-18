import 'dart:convert';
import 'package:amruta_ayurveda/data/models/login_model.dart';
import 'package:amruta_ayurveda/data/models/patient_model.dart';
import 'package:amruta_ayurveda/data/repository/user_repository.dart';
import 'package:amruta_ayurveda/presentation/screens/splash%20screen/splash_screen.dart';
import 'package:http/http.dart' as http;

class HomeRepository {
  Future<List<Patient>> getPatients() async {
    try {
      var response = await http.get(
        Uri.parse(baseUrl + 'PatientList'),
        headers: {
          'Authorization': 'Bearer ${pref.getString('token')}',
        },
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> responseBody = json.decode(response.body);
        List<dynamic> patientList = responseBody['patient'];
        return patientList.map((json) => Patient.fromJson(json)).toList();
      } else {
        throw ('Failed to load');
      }
    } catch (e) {
      rethrow;
    }
  }
}
