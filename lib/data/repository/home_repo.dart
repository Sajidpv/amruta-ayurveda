import 'dart:convert';
import 'package:amruta_ayurveda/data/models/patient_model.dart';
import 'package:amruta_ayurveda/data/models/treatment_model.dart';
import 'package:amruta_ayurveda/data/repository/user_repository.dart';
import 'package:amruta_ayurveda/presentation/screens/splash%20screen/splash_screen.dart';
import 'package:http/http.dart' as http;

class HomeRepository {
  Future<List<Patient>> registerPatients(Map<String, dynamic> eData) async {
    try {
      var response = await http.post(
        Uri.parse(baseUrl + 'PatientUpdate'),
        body: eData,
        headers: {
          'Authorization': 'Bearer ${pref.getString('token')}',
        },
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> responseBody = json.decode(response.body);
        List<dynamic> patientList = responseBody['patient'];
        print('success');
        return patientList.map((json) => Patient.fromJson(json)).toList();
      } else {
        print(response.body);
        throw ('Failed to register');
      }
    } catch (e, stacktrace) {
      print(stacktrace);
      rethrow;
    }
  }

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

  Future<List<Treatments>> getTreatments() async {
    try {
      var response = await http.get(
        Uri.parse(baseUrl + 'TreatmentList'),
        headers: {
          'Authorization': 'Bearer ${pref.getString('token')}',
        },
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> responseBody = json.decode(response.body);
        List<dynamic> treatments = responseBody['treatments'];
        return treatments.map((json) => Treatments.fromJson(json)).toList();
      } else {
        throw ('Failed to load');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Branch>> getBranches() async {
    try {
      var response = await http.get(
        Uri.parse(baseUrl + 'BranchList'),
        headers: {
          'Authorization': 'Bearer ${pref.getString('token')}',
        },
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> responseBody = json.decode(response.body);
        print(responseBody);
        List<dynamic> branches = responseBody['branches'];
        return branches.map((json) => Branch.fromJson(json)).toList();
      } else {
        throw ('Failed to load');
      }
    } catch (e) {
      rethrow;
    }
  }
}
