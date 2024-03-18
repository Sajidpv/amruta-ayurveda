import 'dart:async';

import 'package:amruta_ayurveda/data/models/branch_model.dart';
import 'package:amruta_ayurveda/data/models/treatment_model.dart';
import 'package:amruta_ayurveda/data/repository/home_repo.dart';
import 'package:flutter/material.dart';

class SignUpProvider with ChangeNotifier {
  final BuildContext context;
  SignUpProvider(this.context) {
    _initialize();
  }
  bool isLoading = false, isObscure = true, isAssigned = false;

  final formKey = GlobalKey<FormState>();

  final formKeyDialog = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final whatsappController = TextEditingController();
  final addressController = TextEditingController();
  final totalController = TextEditingController();
  final discountController = TextEditingController();
  final advancedController = TextEditingController();
  final balanceController = TextEditingController();

  String password = '', action = '', eId = '';
  List<Treatments> treatments = [];
  List<String> minutes =
      List.generate(60, (index) => index.toString().padLeft(2, '0'));
  String? selectedLocation;
  final List<String> locations = [
    'Thiruvananthapuram',
    'Kochi',
    'Kozhikode',
    'Thrissur',
    'Kollam',
    'Alappuzha',
    'Palakkad',
    'Kannur',
    'Kottayam',
    'Malappuram',
    'Pathanamthitta',
    'Idukki',
    'Wayanad',
    'Ernakulam',
    'Kasaragod',
  ];
  List<String> hours =
      List.generate(24, (index) => '${index.toString().padLeft(2, '0')}:00');
  List<Branchess> branches = [];
  HomeRepository _homeRepository = HomeRepository();
  int groupValue = 0;
  String selectedHour = '', selectedMinuts = '';
  Branchess? branch;
  Treatments? selectedTreatment;
  int male = 0, female = 0;

  void _initialize() {
    getBranches();
    getTreatments();
    selectedHour = hours[0];
    selectedMinuts = minutes[0];
  }

  void changed(int? value) {
    if (value != null) {
      groupValue = value;
      notifyListeners();
    }
  }

  void addCount(val) {
    if (val == 'male') {
      male++;
      print("male add $male");
      notifyListeners();
    } else {
      female++;
      print("female add $female");
      notifyListeners();
    }
  }

  void subCount(val) {
    if (val == 'male') {
      male > 0 ? male-- : null;
      notifyListeners();
      print("male sub $male");
    } else {
      female > 0 ? female-- : null;
      notifyListeners();
      print("female sub $female");
    }
  }

  void createUser() async {
    if (!formKey.currentState!.validate()) return;
    formKey.currentState!.save();
    // final empName = nameController.text;
    // final empMail = mailController.text;
    // final empPass = passController.text;
    // final panNo = panController.text;
    // final mobile = mobileController.text;
    // final amount = double.tryParse(salaryController.text) ?? 0;
    // final hour = double.tryParse(workingDayController.text) ?? 0;
    // final day = double.tryParse(workingMonthController.text) ?? 0;

    // final eData = EmployeeModel(
    //   '',
    //   SalaryModel(amount: amount, hours: hour, days: day),
    //   BankDetails(bank: bank, ifsc: ifsc, accNo: accNo, panNo: panNo),
    //   mobile,
    //   email: empMail,
    //   password: empPass,
    //   empID: '',
    //   name: empName,
    //   userType: selectedUserType!,
    //   status: Status.Active,
    //   gender: gender!,
    //   jobType: jobType!,
    //   resourcePermissions: [],
    //   godownAccess: [],
    // );
    //  print(empName);
    // action == 'Add'
    //     ? BlocProvider.of<UserCubit>(context).createUser(data: eData)
    //       : BlocProvider.of<UserCubit>(context).updateUser(data: eData, id: eId);
  }

  void getTreatments() async {
    isLoading = true;
    notifyListeners();
    treatments = await _homeRepository.getTreatments();
    print(treatments);
    isLoading = false;
    notifyListeners();
  }

  void getBranches() async {
    isLoading = true;
    notifyListeners();
    branches = await _homeRepository.getBranches();
    print(branches);
    isLoading = false;
    notifyListeners();
  }

  @override
  void dispose() {
    nameController.dispose();
    whatsappController.dispose();
    discountController.dispose();
    advancedController.dispose();
    balanceController.dispose();
    addressController.dispose();
    totalController.dispose();
    super.dispose();
  }
}
