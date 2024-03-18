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

    List<String> options = ['All', 'Today', "Last Week", 'Last Month'];
    String? selectedValue = options[0];
    return Scaffold(
      appBar: AppBar(
        actions: [bellIconWithBadge(homeProvider: homeProvider)],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: DeviceInfo(context).height! / 1.3,
              child: RefreshIndicator(
                onRefresh: () async {
                  homeProvider.refreshData();
                },
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
                                    controller: homeProvider.searchController,
                                    textInputAction: TextInputAction.next,
                                    style: const TextStyle(
                                        fontSize: 10, height: .3),
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(8.0),
                                        ),
                                      ),
                                      hintText: 'Search for treatments',
                                    ),
                                    onChanged: (value) {},
                                  ),
                                ),
                                Devider(
                                  width: 20,
                                ),
                                Flexible(
                                  flex: 2,
                                  child: PrimaryButton(
                                    label: 'Search',
                                    onPressed: () {
                                      homeProvider.filterData();
                                    },
                                  ),
                                ),
                              ],
                            ),
                            Devider(
                              height: 35,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Sort by: ',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700),
                                ),
                                SizedBox(
                                  width: 150,
                                  height: 50,
                                  child: DropdownButtonFormField<String>(
                                    hint: Text('Date'),
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                    ),
                                    value: selectedValue,
                                    style: TextStyle(fontSize: 12),
                                    items: options.map((String option) {
                                      return DropdownMenuItem<String>(
                                        value: option,
                                        child: Text(
                                          option,
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.black),
                                        ),
                                      );
                                    }).toList(),
                                    onChanged: (String? value) {
                                      homeProvider.sortData(value!);
                                    },
                                  ),
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
                                  homeProvider.filterdData.isEmpty
                                      ? Center(child: Text('No data found'))
                                      : PatientListTile(
                                          patientData:
                                              homeProvider.filterdData),
                                ],
                              ),
                      ),
                    ],
                  ),
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
      ),
    );
  }
}
