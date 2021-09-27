import 'package:flutter/material.dart';
import 'package:k_weather_app/presentation/screens/weather_details_screen/view/weather_details_view.dart';
import 'package:k_weather_app/presentation/screens/weather_details_screen/view_model/weather_details_viewmodel.dart';
import 'package:provider/provider.dart';
import 'core/dependencies_injection/injection_container.dart' as DI;

void main() async {
  // This is our global ServiceLocator
  await DI.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider<WeatherDetailsViewModel>(create: (context) => WeatherDetailsViewModel())],
      child: MaterialApp(
        themeMode: ThemeMode.dark,
        debugShowCheckedModeBanner: false,
        home: WeatherDetailsView(),
      ),
    );
  }
}
