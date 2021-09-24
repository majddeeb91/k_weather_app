import 'package:flutter/material.dart';
import 'package:k_weather_app/domain/entities/weather_details_entities/daily_data_entity.dart';
import 'package:k_weather_app/presentation/utils/helper.dart';

import 'next_day_weather_conditions.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
    required this.currentNextDayDetails,
  }) : super(key: key);

  final DailyData currentNextDayDetails;

  @override
  Widget build(BuildContext context) {
    String iconUrl = Helper.getWeatherIconUrlFromIconCode(code: currentNextDayDetails.icon, largeSize: true);
    return Container(
      margin: const EdgeInsets.only(top: 100.0),
      height: 280,
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        boxShadow: [
          BoxShadow(color: Colors.white, blurRadius: 30.0),
        ],
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.grey, Colors.white],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Hero(
                tag: "${currentNextDayDetails.id}+${currentNextDayDetails.date}",
                child: Text(
                  "${currentNextDayDetails.date}",
                  style: Theme.of(context).textTheme.headline4!.copyWith(color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
              Hero(tag: currentNextDayDetails.id, child: Image.network(iconUrl)),
            ],
          ),
          Text("${currentNextDayDetails.description}", style: TextStyle(fontSize: 18, color: Colors.black)),
          SizedBox(height: 30),
          NextDayWeahterConditionds(currentNextDayDetails: currentNextDayDetails),
        ],
      ),
    );
  }
}
