abstract class HistoryScreenState{}

class LoadHistoryState extends HistoryScreenState{
  List<String> history_a;
  List<String> history_b;
  List<String> history_res;
  LoadHistoryState({required this.history_a,required this.history_b,required this.history_res});
}

class NullHist extends HistoryScreenState{}