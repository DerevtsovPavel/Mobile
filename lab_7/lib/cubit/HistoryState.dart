abstract class Historystate {}

class LoadHistoryState extends Historystate{}

class LoadedHistoryState extends Historystate{
  List<String> temp;
  List<String> windSpeed;
  List<String> time;
  LoadedHistoryState({required this.temp, required this.windSpeed, required this.time});
}