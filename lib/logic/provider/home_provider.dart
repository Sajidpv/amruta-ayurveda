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

  void sortData(String period) {
    DateTime now = DateTime.now();
    DateTime startDate;
    switch (period) {
      case 'All':
        startDate = DateTime(now.year, now.month, now.day);
        break;
      case 'Today':
        startDate = DateTime(now.year, now.month, now.day);
        break;
      case 'Last Week':
        startDate = now.subtract(Duration(days: now.weekday));
        break;
      case 'Last Month':
        startDate = DateTime(now.year, now.month - 1, now.day);
        break;
      default:
        startDate = DateTime(1900); // Set a default start date
    }
    period == 'All'
        ? filterdData = patientData
        : filterdData = patientData.where((patient) {
            DateTime patientDate = patient.dateNdTime != null
                ? DateTime.parse(patient.dateNdTime!)
                : DateTime.now();
            return patientDate.isAfter(startDate) &&
                patientDate
                    .isBefore(DateTime(now.year, now.month, now.day + 1));
          }).toList();

    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
