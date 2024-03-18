import 'package:amruta_ayurveda/data/models/treatment_model.dart';
import 'package:amruta_ayurveda/logic/provider/signup_provider.dart';
import 'package:amruta_ayurveda/presentation/widgets/primary_button.dart';
import 'package:amruta_ayurveda/presentation/widgets/spacer_widgets.dart';
import 'package:amruta_ayurveda/presentation/widgets/text_box.dart';
import 'package:amruta_ayurveda/presentation/widgets/validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void showAddTreatmentDialog(
    {required BuildContext context, required SignUpProvider providers}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Consumer<SignUpProvider>(builder: (context, provider, child) {
        return AlertDialog(
          content: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Choose Treatment'),
                      Devider(
                        height: 5,
                      ),
                      DropdownButtonFormField(
                        decoration: InputDecoration(
                          hintText: 'Choose preferred treatment',
                          hintStyle: const TextStyle(fontSize: 10),
                          filled: true,
                          fillColor: Colors.grey.shade300,
                          border: OutlineInputBorder(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8.0)),
                          ),
                        ),
                        value: provider.selectedTreatment,
                        items: providers.treatments.map((e) {
                          return DropdownMenuItem<Treatments>(
                            value: e,
                            child: Text(
                              e.name.toString(),
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(fontSize: 10),
                            ),
                          );
                        }).toList(),
                        onChanged: (e) {
                          setState(() {
                            provider.selectedTreatment = e;
                          });
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: validateDropdown,
                        isExpanded: true,
                      ),
                      Devider(
                        height: 15,
                      ),
                      Text('Add Patients'),
                      Devider(
                        height: 5,
                      ),
                      Row(
                        children: [
                          numberBox(
                            height: 50,
                            width: 100,
                            text: 'Male',
                          ),
                          Devider(
                            width: 40,
                          ),
                          circularButton(
                            onClick: () {
                              setState(() {
                                provider.subCount('male');
                              });
                            },
                            context: context,
                            icon: Icons.minimize_outlined,
                          ),
                          numberBox(
                            height: 50,
                            text: provider.male.toString(),
                          ),
                          circularButton(
                            onClick: () {
                              setState(() {
                                provider.addCount('male');
                              });
                            },
                            context: context,
                            icon: Icons.add,
                          ),
                        ],
                      ),
                      Devider(
                        height: 15,
                      ),
                      Row(
                        children: [
                          numberBox(
                            height: 50,
                            width: 100,
                            text: 'Female',
                          ),
                          Devider(
                            width: 40,
                          ),
                          circularButton(
                            onClick: () {
                              setState(() {
                                provider.subCount('female');
                              });
                            },
                            context: context,
                            icon: Icons.minimize_outlined,
                          ),
                          numberBox(
                            height: 50,
                            text: provider.female.toString(),
                          ),
                          circularButton(
                            onClick: () {
                              setState(() {
                                provider.addCount('female');
                              });
                            },
                            context: context,
                            icon: Icons.add,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          ),
          actions: [
            PrimaryButton(
              label: 'Save',
              onPressed: () {},
            ),
          ],
        );
      });
    },
  );
}
