import 'package:amruta_ayurveda/data/models/patient_model.dart';
import 'package:amruta_ayurveda/data/repository/home_repo.dart';
import 'package:flutter/material.dart';

class HomeProvider with ChangeNotifier {
  final BuildContext context;
  HomeProvider(this.context) {
    getPatients();
  }
  bool isLoading = false;
  List<Patient> patientData = [];

  final searchController = TextEditingController();
  final dateController = TextEditingController();

  final HomeRepository _homeRepository = HomeRepository();
  void getPatients() async {
    isLoading = true;
    notifyListeners();
    patientData = await _homeRepository.getPatients();
    isLoading = false;
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
