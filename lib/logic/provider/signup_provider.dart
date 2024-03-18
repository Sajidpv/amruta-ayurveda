import 'dart:async';

import 'package:flutter/material.dart';

class SignUpProvider with ChangeNotifier {
  final BuildContext context;
  SignUpProvider(this.context) {}
  bool isLoading = false, isObscure = true, isAssigned = false;

  final formKey = GlobalKey<FormState>();

  final formKeyDialog = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final mailController = TextEditingController();
  final mobileController = TextEditingController();
  final panController = TextEditingController();
  final passController = TextEditingController();
  final salaryController = TextEditingController();
  final workingMonthController = TextEditingController();
  final workingDayController = TextEditingController();
  final femaleController = TextEditingController();
  final maeController = TextEditingController();
  final treatmentController = TextEditingController();

  String password = '', action = '', eId = '';
  StreamSubscription? _userSubscription;

  void clickedIsObscure() {
    isObscure = !isObscure;
    notifyListeners();
  }

  void createUser() async {
    if (!formKey.currentState!.validate()) return;
    formKey.currentState!.save();
    final empName = nameController.text;
    final empMail = mailController.text;
    final empPass = passController.text;
    final panNo = panController.text;
    final mobile = mobileController.text;
    final amount = double.tryParse(salaryController.text) ?? 0;
    final hour = double.tryParse(workingDayController.text) ?? 0;
    final day = double.tryParse(workingMonthController.text) ?? 0;

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
    print(empName);
    // action == 'Add'
    //     ? BlocProvider.of<UserCubit>(context).createUser(data: eData)
    //       : BlocProvider.of<UserCubit>(context).updateUser(data: eData, id: eId);
  }

  @override
  void dispose() {
    _userSubscription?.cancel();
    nameController.dispose();
    mailController.dispose();
    passController.dispose();
    salaryController.dispose();
    workingDayController.dispose();
    workingMonthController.dispose();

    super.dispose();
  }
}
