import 'HistoryState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HistoryScreenCubit extends Cubit<HistoryScreenState>{
    HistoryScreenCubit(): super (NullHist());

    void load() async{
        final prefs = await SharedPreferences.getInstance();

        final List<String>? a_list = prefs.getStringList("a_list");
        final List<String>? b_list = prefs.getStringList("b_list");
        final List<String>? results = prefs.getStringList("res_list");

       emit(LoadHistoryState(history_a: a_list!, history_b: b_list!, history_res: results!));

    }
}