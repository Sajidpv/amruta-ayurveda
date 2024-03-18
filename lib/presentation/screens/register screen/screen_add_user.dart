import 'package:amruta_ayurveda/cores/device_info.dart';
import 'package:amruta_ayurveda/data/models/patient_model.dart';
import 'package:amruta_ayurveda/logic/provider/home_provider.dart';
import 'package:amruta_ayurveda/logic/provider/signup_provider.dart';
import 'package:amruta_ayurveda/presentation/screens/register%20screen/alert_dialog_add_category.dart';
import 'package:amruta_ayurveda/presentation/widgets/circular_loading_indicator.dart';
import 'package:amruta_ayurveda/presentation/widgets/notification_icon.dart';
import 'package:amruta_ayurveda/presentation/widgets/primary_button.dart';
import 'package:amruta_ayurveda/presentation/widgets/spacer_widgets.dart';
import 'package:amruta_ayurveda/presentation/widgets/text_box.dart';
import 'package:amruta_ayurveda/presentation/widgets/text_fields.dart';
import 'package:amruta_ayurveda/presentation/widgets/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({
    Key? key,
  }) : super(key: key);
  static const String routeName = 'create-patient';

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SignUpProvider>(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          bellIconWithBadge(homeProvider: Provider.of<HomeProvider>(context))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: DeviceInfo(context).width! / 15, bottom: 10),
              child: Text(
                'Register',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              width: DeviceInfo(context).width,
              height: 1,
              color: Colors.grey,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: DeviceInfo(context).width! / 20, vertical: 20),
              child: Form(
                key: provider.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text('  Name'),
                    Devider(
                      height: 5,
                    ),
                    DefaultTextFormField(
                      textController: provider.nameController,
                      label: 'Name',
                      validator: validaterMandatory,
                    ),
                    Devider(
                      height: 15,
                    ),
                    Text('  WhatsApp Number'),
                    Devider(
                      height: 5,
                    ),
                    DefaultTextFormField(
                      textInputType: TextInputType.number,
                      textController: provider.whatsappController,
                      label: 'WhatsApp number',
                      validator: validaterMandatory,
                    ),
                    Devider(
                      height: 15,
                    ),
                    Text('  Address'),
                    Devider(
                      height: 5,
                    ),
                    DefaultTextFormField(
                      textController: provider.addressController,
                      label: 'full address',
                      validator: validaterMandatory,
                    ),
                    Devider(
                      height: 15,
                    ),
                    Text('  Location'),
                    Devider(
                      height: 5,
                    ),
                    DropdownButtonFormField(
                      decoration: InputDecoration(
                        hintText: 'Choose your Location',
                        hintStyle: const TextStyle(fontSize: 10),
                        filled: true,
                        fillColor: Colors.grey.shade200,
                        border: OutlineInputBorder(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8.0)),
                        ),
                      ),
                      value: provider.selectedLocation,
                      items: provider.locations.map((e) {
                        return DropdownMenuItem<String>(
                          value: e,
                          child: Text(
                            e.toString(),
                            style: const TextStyle(fontSize: 10),
                          ),
                        );
                      }).toList(),
                      onChanged: (e) {
                        provider.selectedLocation = e;
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: validateDropdown,
                    ),
                    Devider(
                      height: 15,
                    ),
                    Text('  Branch'),
                    Devider(
                      height: 5,
                    ),
                    DropdownButtonFormField(
                      decoration: InputDecoration(
                        hintText: 'Select the branch',
                        hintStyle: const TextStyle(fontSize: 10),
                        filled: true,
                        fillColor: Colors.grey.shade200,
                        border: OutlineInputBorder(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8.0)),
                        ),
                      ),
                      value: provider.branch,
                      items: provider.branches.map((e) {
                        return DropdownMenuItem<Branch>(
                          value: e,
                          child: Text(
                            e.name.toString(),
                            style: const TextStyle(fontSize: 10),
                          ),
                        );
                      }).toList(),
                      onChanged: (e) {
                        provider.branch = e;
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: validateDropdown,
                    ),
                    Devider(
                      height: 15,
                    ),
                    Text('  Treatments'),
                    Devider(
                      height: 5,
                    ),
                    Consumer<SignUpProvider>(
                        builder: (context, providers, child) {
                      print('in page: ${provider.treatmentsets}');
                      return Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(8)),
                        child: providers.treatmentsets.isEmpty
                            ? Center(child: Text('  No treatments added yet! '))
                            : ListView.builder(
                                shrinkWrap: true,
                                itemCount: providers.treatmentsets.length,
                                itemBuilder: (BuildContext context, int index) {
                                  final item = providers.treatmentsets[index];
                                  return Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            item.treatmentName != null
                                                ? '${index + 1}.  ${item.treatmentName!}'
                                                : '',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              provider.removeItem(item);
                                            },
                                            child: CircleAvatar(
                                              backgroundColor: Color.fromARGB(
                                                  146, 231, 35, 35),
                                              radius: 13,
                                              child: Icon(
                                                Icons.close,
                                                color: Colors.white,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      Devider(
                                        height: 5,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Devider(
                                            width: 25,
                                          ),
                                          Flexible(
                                            child: Row(
                                              children: [
                                                Text('Male  '),
                                                Consumer<SignUpProvider>(
                                                  builder: (context, provider,
                                                      child) {
                                                    return numberBox(
                                                      text:
                                                          item.male.toString(),
                                                    );
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                          Devider(
                                            width: 50,
                                          ),
                                          Flexible(
                                            child: Row(
                                              children: [
                                                Text('Female  '),
                                                Consumer<SignUpProvider>(
                                                  builder: (context, provider,
                                                      child) {
                                                    return numberBox(
                                                      text: item.female
                                                          .toString(),
                                                    );
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                          Devider(
                                            width: 20,
                                          ),
                                          GestureDetector(
                                              onTap: () =>
                                                  showAddTreatmentDialog(
                                                      action: 'Edit',
                                                      context: context,
                                                      provider: provider),
                                              child: Icon(Icons.edit_outlined))
                                        ],
                                      ),
                                      Devider(
                                        width: 20,
                                      ),
                                    ],
                                  );
                                }),
                      );
                    }),
                    Devider(
                      height: 15,
                    ),
                    Consumer<SignUpProvider>(
                        builder: (context, provider, child) {
                      return provider.isLoading
                          ? Circular_Loading_indicator()
                          : PrimaryButton(
                              textColor: Colors.black,
                              color: Color.fromRGBO(0, 104, 55, 0.226),
                              label: '+ Add Treatments',
                              onPressed: () => showAddTreatmentDialog(
                                  context: context, provider: provider),
                            );
                    }),
                    Devider(
                      height: 15,
                    ),
                    Text('  Total amount'),
                    Devider(
                      height: 5,
                    ),
                    DefaultTextFormField(
                      textController: provider.totalController,
                      validator: validaterMandatory,
                    ),
                    Devider(
                      height: 15,
                    ),
                    Text('  Discount Amount'),
                    Devider(
                      height: 5,
                    ),
                    DefaultTextFormField(
                      textController: provider.discountController,
                      validator: validaterMandatory,
                    ),
                    Devider(
                      height: 15,
                    ),
                    Text('  Payment Options'),
                    Consumer<SignUpProvider>(
                        builder: (context, provider, child) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Radio(
                                groupValue: provider.groupValue,
                                onChanged: (value) => provider.changed(value),
                                value: 0,
                              ),
                              Text('Cash',
                                  style: TextStyle(
                                    fontSize: 16,
                                  ))
                            ],
                          ),
                          Row(
                            children: [
                              Radio(
                                groupValue: provider.groupValue,
                                onChanged: (value) => provider.changed(value),
                                value: 1,
                              ),
                              Text('Card',
                                  style: TextStyle(
                                    fontSize: 16,
                                  )),
                            ],
                          ),
                          Row(
                            children: [
                              Radio(
                                groupValue: provider.groupValue,
                                onChanged: (value) => provider.changed(value),
                                value: 2,
                              ),
                              Text('UPI',
                                  style: TextStyle(
                                    fontSize: 16,
                                  )),
                            ],
                          ),
                        ],
                      );
                    }),
                    Text('  Advance Amount'),
                    Devider(
                      height: 5,
                    ),
                    DefaultTextFormField(
                      textController: provider.advancedController,
                      validator: validaterMandatory,
                    ),
                    Devider(
                      height: 15,
                    ),
                    Text('  Balance Amount'),
                    Devider(
                      height: 5,
                    ),
                    DefaultTextFormField(
                      textController: provider.balanceController,
                      validator: validaterMandatory,
                    ),
                    Devider(
                      height: 15,
                    ),
                    Text('  Treatement Date'),
                    Devider(
                      height: 5,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextButton.icon(
                              onPressed: () =>
                                  provider.selectDateFunction(context),
                              label: Text(
                                provider.selectedDate.toString(),
                                style: const TextStyle(
                                    fontSize: 10, color: Colors.black),
                              ),
                            ),
                          ),
                          Align(
                              alignment: Alignment.topRight,
                              child: Icon(
                                Icons.arrow_drop_down_rounded,
                                color: Theme.of(context).primaryColor,
                              )),
                          Devider(
                            width: 10,
                          )
                        ],
                      ),
                    ),
                    Devider(
                      height: 15,
                    ),
                    Text('  Treatment Time'),
                    Devider(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Flexible(
                          child: DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.grey.shade200,
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8))),
                                hintText: 'Select Hour'),
                            value: provider.selectedHour,
                            onChanged: (newValue) {
                              provider.selectedHour = newValue!;
                            },
                            items: provider.hours.map((hour) {
                              return DropdownMenuItem<String>(
                                value: hour,
                                child: Text(
                                  hour,
                                  style: TextStyle(fontSize: 12),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                        Devider(
                          width: 15,
                        ),
                        Flexible(
                          child: DropdownButtonFormField<String>(
                              value: provider.selectedMinuts,
                              onChanged: (newValue) {
                                provider.selectedMinuts = newValue!;
                              },
                              items: provider.minutes.map((minut) {
                                return DropdownMenuItem<String>(
                                  value: minut,
                                  child: Text(
                                    minut,
                                    style: TextStyle(fontSize: 12),
                                  ),
                                );
                              }).toList(),
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.grey.shade200,
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(8))),
                                  hintText: 'Select Minut')),
                        ),
                      ],
                    ),
                    Devider(
                      height: 35,
                    ),
                    Consumer<SignUpProvider>(
                        builder: (context, provider, child) {
                      return provider.isLoading
                          ? Circular_Loading_indicator()
                          : PrimaryButton(
                              label: 'Save',
                              onPressed: provider.createPatient,
                            );
                    }),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
