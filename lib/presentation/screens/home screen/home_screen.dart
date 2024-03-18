import 'package:amruta_ayurveda/cores/device_info.dart';
import 'package:amruta_ayurveda/logic/provider/home_provider.dart';
import 'package:amruta_ayurveda/presentation/screens/register%20screen/screen_add_user.dart';
import 'package:amruta_ayurveda/presentation/widgets/circular_loading_indicator.dart';
import 'package:amruta_ayurveda/presentation/widgets/notification_icon.dart';
import 'package:amruta_ayurveda/presentation/widgets/patient_list_tile.dart';
import 'package:amruta_ayurveda/presentation/widgets/primary_button.dart';
import 'package:amruta_ayurveda/presentation/widgets/spacer_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  static const String routeName = 'home-page';

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);

    print(homeProvider.patientData);
    return Scaffold(
      appBar: AppBar(
        actions: [bellIconWithBadge(homeProvider: homeProvider)],
      ),
      body: Column(
        children: [
          SizedBox(
            height: DeviceInfo(context).height! / 1.3,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: DeviceInfo(context).width! / 15,
                        vertical: 10),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Flexible(
                              flex: 4,
                              child: TextFormField(
                                textInputAction: TextInputAction.next,
                                style:
                                    const TextStyle(fontSize: 10, height: .3),
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(8.0),
                                    ),
                                  ),
                                  hintText: 'Search for treatments',
                                ),
                                onChanged: (value) {
                                  // filteredList = itemList
                                  //     .where((item) => getTitle(item)
                                  //         .toLowerCase()
                                  //         .contains(value.toLowerCase()))
                                  //     .toList();
                                  // setState(() {});
                                },
                              ),
                            ),
                            Devider(
                              width: 20,
                            ),
                            Flexible(
                              flex: 2,
                              child: PrimaryButton(
                                label: 'Search',
                                onPressed: () {},
                              ),
                            ),
                          ],
                        ),
                        Devider(
                          height: 35,
                        ),
                        Row(
                          children: [
                            Text(
                              'Sort by: ',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                        Devider(
                          height: 15,
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
                    padding: EdgeInsets.symmetric(
                      horizontal: DeviceInfo(context).width! / 22,
                      vertical: 10,
                    ),
                    child: homeProvider.isLoading
                        ? Circular_Loading_indicator()
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              homeProvider.patientData.isEmpty
                                  ? Text('No data found')
                                  : PatientListTile(homeProvider: homeProvider),
                            ],
                          ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: DeviceInfo(context).width! / 22,
            ),
            child: PrimaryButton(
              label: 'Register Now',
              onPressed: () {
                Navigator.pushNamed(context, SignUpPage.routeName);
              },
            ),
          ),
        ],
      ),
    );
  }
}
