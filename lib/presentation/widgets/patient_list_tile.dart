import 'package:amruta_ayurveda/cores/device_info.dart';
import 'package:amruta_ayurveda/data/models/patient_model.dart';
import 'package:amruta_ayurveda/presentation/widgets/spacer_widgets.dart';
import 'package:flutter/material.dart';

class PatientListTile extends StatelessWidget {
  const PatientListTile({
    super.key,
    required this.patientData,
  });

  final List<Patient> patientData;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: patientData.length,
      itemBuilder: (context, index) {
        print(patientData[index]);
        return Card(
          elevation: 0,
          color: const Color.fromRGBO(238, 238, 238, 1),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${index + 1}.',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                    Devider(
                      width: 5,
                    ),
                    Flexible(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              patientData[index].name!,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14),
                            ),
                            Devider(
                              height: 5,
                            ),
                            Text(
                              patientData[index].address!,
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 14),
                            ),
                            Devider(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.date_range,
                                      color: Colors.red,
                                    ),
                                    Devider(
                                      width: 5,
                                    ),
                                    Text(
                                      patientData[index].dateNdTime != null
                                          ? patientData[index].dateNdTime!
                                          : '',
                                      style: TextStyle(fontSize: 14),
                                    ),
                                  ],
                                ),
                                Devider(
                                  width: 20,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.people_outline,
                                      color: Colors.red,
                                    ),
                                    Devider(
                                      width: 5,
                                    ),
                                    Text(
                                      patientData[index].payment!,
                                      style: TextStyle(fontSize: 14),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ]),
                    ),
                  ],
                ),
              ),
              Container(
                width: DeviceInfo(context).width,
                height: 1,
                color: Colors.grey,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, bottom: 12, top: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'View Booking details',
                      style: TextStyle(fontSize: 14),
                    ),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Theme.of(context).primaryColor,
                      size: 20,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
