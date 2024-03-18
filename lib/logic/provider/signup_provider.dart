import 'package:amruta_ayurveda/data/models/patient_model.dart';
import 'package:amruta_ayurveda/data/models/treatment_model.dart';
import 'package:amruta_ayurveda/data/repository/home_repo.dart';
import 'package:amruta_ayurveda/presentation/widgets/show_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SignUpProvider with ChangeNotifier {
  final BuildContext context;
  SignUpProvider(this.context) {
    _initialize();
  }
  bool isLoading = false, isError = false;

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
  List<PatientdetailsSet> treatmentsets = [];
  String selectedDate = '';
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
  List<Branch> branches = [];
  HomeRepository _homeRepository = HomeRepository();
  int groupValue = 0;
  String selectedHour = '', selectedMinuts = '';
  Branch? branch;
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
      notifyListeners();
    } else {
      female++;
      notifyListeners();
    }
  }

  void subCount(val) {
    if (val == 'male') {
      male > 0 ? male-- : null;
      notifyListeners();
    } else {
      female > 0 ? female-- : null;
      notifyListeners();
    }
  }

  void addTreatmentset() {
    isError = false;
    formKeyDialog.currentState!.save();
    treatmentsets.add(PatientdetailsSet(
        male: male.toString(),
        female: female.toString(),
        treatment: selectedTreatment!.id));
    notifyListeners(); // Notify listeners after adding a new treatment set
    customSnackbar(
        message: '${male + female} Patient added', color: Colors.grey.shade700);
    print('in provider $treatmentsets');
  }

  Future<void> selectDateFunction(BuildContext context) async {
    final DateTime? pickedDate = await selectDate(context);

    if (pickedDate != null) {
      selectedDate = formatDate(pickedDate);
    }
    notifyListeners();
  }

  Future<DateTime?> selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      firstDate: DateTime.now().subtract(const Duration(days: 30)),
      lastDate: DateTime(DateTime.now().year, 12, 31),
      initialDate: DateTime.now(),
    );
    return pickedDate;
  }

  String formatDate(DateTime date) => DateFormat('yyyy-MM-dd').format(date);

  void createPatient() async {
    if (!formKey.currentState!.validate()) return;
    formKey.currentState!.save();
    final name = nameController.text;
    final whatsapp = whatsappController.text;
    final address = addressController.text;
    final total = double.tryParse(totalController.text) ?? 0.0;
    final discount = double.tryParse(discountController.text) ?? 0.0;
    final advance = double.tryParse(advancedController.text) ?? 0.0;
    final balance = double.tryParse(balanceController.text) ?? 0.0;
    final payment = groupValue == 0
        ? 'Cash'
        : groupValue == 1
            ? 'Card'
            : 'UPI';
    Map<String, dynamic> formData = {
      'name': name,
      'excecutive': '',
      'payment': payment,
      'phone': whatsapp,
      'address': address,
      'totalAmount': total,
      'discountAmount': discount,
      'advanceAmount': advance,
      'balanceAmount': balance,
      'dateNdTime': selectedDate,
      'id': '',
      'male': [1, 2, 3],
      'female': [1, 2, 3],
      'treatments': [2, 3, 4]
    };

    await _homeRepository.registerPatients(formData);
  }

  Map<String, dynamic> patientToFormData(Patient eData) {
    try {
      return {
        'name': eData.name,
        'patientdetailsSet': eData.patientdetailsSet!
            .map((patientSet) => {
                  'male': 11,
                  'female': 11,
                  'treatment': 1131,
                })
            .toList(),
      };
    } catch (e) {
      print(e);
      rethrow;
    }
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
