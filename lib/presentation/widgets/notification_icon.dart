import 'package:amruta_ayurveda/logic/provider/home_provider.dart';
import 'package:flutter/material.dart';

class bellIconWithBadge extends StatelessWidget {
  const bellIconWithBadge({
    super.key,
    required this.homeProvider,
  });

  final HomeProvider homeProvider;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: Stack(children: [
        Icon(
          Icons.notifications_none_outlined,
          size: 30,
        ),
        Positioned(
          right: 4,
          top: 4,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.red,
            ),
            width: 10,
            height: 10,
          ),
        ),
      ]),
    );
  }
}
