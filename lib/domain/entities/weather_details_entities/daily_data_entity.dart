class DailyData {
  final int id;
  final String date;
  final String icon;
  final String minTemp;
  final String maxTemp;
  final String description;
  final String humadity;

  final String windSpeed;

  DailyData({required this.humadity, required this.windSpeed, required this.description, required this.id, required this.date, required this.icon, required this.minTemp, required this.maxTemp});
}
