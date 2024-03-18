import 'package:amruta_ayurveda/data/models/patient_model.dart';
import 'package:amruta_ayurveda/data/repository/home_repo.dart';
import 'package:flutter/material.dart';

class HomeProvider with ChangeNotifier {
  final BuildContext context;
  HomeProvider(this.context) {
    _initialize();
  }
  bool isLoading = false;
  List<Patient> patientData = [];
  List<Patient> filterdData = [];

  final searchController = TextEditingController();
  final dateController = TextEditingController();

  final HomeRepository _homeRepository = HomeRepository();
  void _initialize() {
    getPatients();
  }

  void getPatients() async {
    isLoading = true;
    notifyListeners();
    patientData = await _homeRepository.getPatients();
    filterdData = patientData;
    isLoading = false;
    notifyListeners();
  }

  void refreshData() {
    getPatients();
  }

  void filterData() {
    filterdData = patientData
        .where((patient) => patient.name!
            .toLowerCase()
            .contains(searchController.text.toLowerCase()))
        .toList();
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
