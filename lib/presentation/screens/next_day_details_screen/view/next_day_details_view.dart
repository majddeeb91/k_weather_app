import 'package:flutter/material.dart';
import 'package:k_weather_app/domain/entities/weather_details_entities/daily_data_entity.dart';
import 'package:k_weather_app/presentation/screens/next_day_details_screen/view_model/next_day_details_viewmodel.dart';

import 'local_widgets/body.dart';

class NextDayDetailsView extends StatelessWidget {
  final NextDayDetailsViewModel viewModel;
  const NextDayDetailsView({Key? key, required this.viewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DailyData currentNextDayDetails = viewModel.currentNextDayDetails;
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.black87,
        brightness: Brightness.dark,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            )),
      ),
      body: Body(currentNextDayDetails: currentNextDayDetails),
    );
  }
}
