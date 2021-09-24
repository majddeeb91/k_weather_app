import 'package:flutter/material.dart';
import 'package:k_weather_app/domain/entities/weather_details_entities/hourly_data.dart';
import 'package:k_weather_app/presentation/utils/helper.dart';

class HourlyHorizontalListView extends StatelessWidget {
  final List<HourlyData> hourlyDataList;
  const HourlyHorizontalListView({
    Key? key,
    required this.hourlyDataList,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: hourlyDataList.length,
        itemBuilder: (context, index) {
          HourlyData currentHourlyData = hourlyDataList[index];
          String iconUrl = Helper.getWeatherIconUrlFromIconCode(code: currentHourlyData.icon);
          return Container(
              padding: const EdgeInsets.all(8.0),
              margin: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(color: Colors.white, blurRadius: 5.0),
                ],
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.white24, Colors.grey],
                ),
              ),
              child: Column(
                children: [
                  Text(currentHourlyData.time, style: TextStyle(color: Colors.grey)),
                  SizedBox(height: 6),
                  SizedBox(height: 30, width: 30, child: Image.network(iconUrl)),
                  SizedBox(height: 6),
                  Text("${currentHourlyData.temp}°", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500)),
                ],
              ));
        },
      ),
    );
  }
}
