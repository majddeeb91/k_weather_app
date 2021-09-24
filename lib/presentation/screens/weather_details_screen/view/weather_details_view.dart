import 'package:flutter/material.dart';
import 'package:k_weather_app/core/app_enums.dart';
import 'package:k_weather_app/presentation/components/spinner/spinner.dart';
import 'package:k_weather_app/presentation/screens/weather_details_screen/view_model/weather_details_viewmodel.dart';
import 'package:k_weather_app/presentation/utils/helper.dart';
import 'package:provider/provider.dart';

import 'local_widgets/body.dart';

class WeatherDetailsView extends StatelessWidget {
  const WeatherDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: new AppBar(
        toolbarHeight: 0,
        backgroundColor: Colors.black87,
        brightness: Brightness.dark,
      ),
      body: Consumer<WeatherDetailsViewModel>(builder: (context, viewmodel, child) {
        switch (viewmodel.currentState) {
          case ProviderState.isLoading:
            return Center(
              child: Container(
                child: Spinner(),
              ),
            );
          case ProviderState.error:
            return Container(
              color: Colors.black87,
              child: Center(
                child: Text(
                  Helper.mapFailureToMessage(viewmodel.error),
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            );
          case ProviderState.loaded:
            return Body(viewModel: viewmodel);
          default:
            return Container(
              color: Colors.black87,
            );
        }
      }),
    );
  }
}
