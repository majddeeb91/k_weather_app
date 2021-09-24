import 'package:flutter/material.dart';

class Spinner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: 80,
      child: Padding(
        padding: const EdgeInsets.all(0),
        child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(
          Colors.white,
        )),
      ),
    );
  }
}
