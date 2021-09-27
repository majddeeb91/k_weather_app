import 'package:flutter/material.dart';
import 'package:k_weather_app/domain/entities/weather_details_entities/daily_data_entity.dart';
import 'package:k_weather_app/presentation/screens/next_day_details_screen/view/next_day_details_view.dart';
import 'package:k_weather_app/presentation/screens/next_day_details_screen/view_model/next_day_details_viewmodel.dart';
import 'package:k_weather_app/presentation/utils/helper.dart';

class NexgDaysVerticalListView extends StatelessWidget {
  final List<DailyData> dailyDataList;

  const NexgDaysVerticalListView({
    Key? key,
    required this.dailyDataList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: ListView.separated(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: dailyDataList.length,
          separatorBuilder: (context, index) => SizedBox(height: 5),
          itemBuilder: (context, index) {
            DailyData currentDailyData = dailyDataList[index];
            String iconUrl = Helper.getWeatherIconUrlFromIconCode(code: currentDailyData.icon);
            return GestureDetector(
              onTap: () {
                NextDayDetailsViewModel nextDayDetailsViewModel = NextDayDetailsViewModel(currentDailyData);
                Navigator.push(context, MaterialPageRoute(builder: (context) => NextDayDetailsView(viewModel: nextDayDetailsViewModel)));
              },
              child: Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(border: Border.all(color: Colors.grey.withOpacity(0.5), width: 1), borderRadius: BorderRadius.circular(15)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(width: 80, child: Hero(tag: "${currentDailyData.id}+${currentDailyData.date}", child: Text(currentDailyData.date, style: TextStyle(color: Colors.grey.withOpacity(0.7))))),
                      SizedBox(height: 35, width: 35, child: Hero(tag: currentDailyData.id, child: Image.network(iconUrl))),
                      Text("${currentDailyData.minTemp}°  ${currentDailyData.maxTemp}°", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500)),
                    ],
                  )),
            );
          },
        ),
      ),
    );
  }
}
