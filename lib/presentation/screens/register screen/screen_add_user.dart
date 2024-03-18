import 'package:amruta_ayurveda/cores/device_info.dart';
import 'package:amruta_ayurveda/data/models/branch_model.dart';
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

class SignUpPage extends StatefulWidget {
  SignUpPage({
    Key? key,
  }) : super(key: key);
  static const String routeName = 'create-patient';

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SignUpProvider>(context, listen: false);

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
              width: DeviceInfo(context)
                  .width, // Adjust the width of the line as needed
              height: 1, // Set the height to fill the available vertical space
              color: Colors.grey, // Set the color of the line
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: DeviceInfo(context).width! / 15, vertical: 20),
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
                      textController: provider.nameController,
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
                      textController: provider.nameController,
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
                        fillColor: Colors.grey.shade300,
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
                        fillColor: Colors.grey.shade300,
                        border: OutlineInputBorder(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8.0)),
                        ),
                      ),
                      value: provider.branch,
                      items: provider.branches.map((e) {
                        return DropdownMenuItem<Branchess>(
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
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(8)),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '  1. Couple Combo package i...',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              CircleAvatar(
                                  backgroundColor:
                                      Color.fromARGB(146, 231, 35, 35),
                                  radius: 13,
                                  child: Icon(
                                    Icons.close,
                                    color: Colors.white,
                                  ))
                            ],
                          ),
                          Devider(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Devider(
                                width: 25,
                              ),
                              Flexible(
                                child: Row(
                                  children: [
                                    Text('Male  '),
                                    Consumer<SignUpProvider>(
                                      builder: (context, provider, child) {
                                        return numberBox(
                                          text: provider.male.toString(),
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
                                      builder: (context, provider, child) {
                                        return numberBox(
                                          text: provider.female.toString(),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              Devider(
                                width: 20,
                              ),
                              Icon(Icons.edit_outlined)
                            ],
                          ),
                        ],
                      ),
                    ),
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
                                  context: context, providers: provider),
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
                      textController: provider.nameController,
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
                      textController: provider.nameController,
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
                      textController: provider.nameController,
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
                      textController: provider.nameController,
                      validator: validaterMandatory,
                    ),
                    Devider(
                      height: 15,
                    ),
                    Text('  Treatement Date'),
                    Devider(
                      height: 5,
                    ),
                    SizedBox(
                      height: 50,
                      child: DefaultTextFormField(
                        suffix: Icons.date_range_rounded,
                        textController: provider.nameController,
                        validator: validaterMandatory,
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
                                fillColor: Colors.grey.shade300,
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8))),
                                hintText: 'Select Hour'),
                            value: provider.selectedHour,
                            onChanged: (newValue) {
                              setState(() {
                                provider.selectedHour = newValue!;
                              });
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
                                setState(() {
                                  provider.selectedMinuts = newValue!;
                                });
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
                                  fillColor: Colors.grey.shade300,
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
                              onPressed: provider.createUser,
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
