import 'package:flutter/material.dart';

class Circular_Loading_indicator extends StatelessWidget {
  const Circular_Loading_indicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
