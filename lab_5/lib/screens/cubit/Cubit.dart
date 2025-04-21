import 'dart:math';

import 'States.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainScreenCubit extends Cubit<MainScreenState>{

  MainScreenCubit(): super(NullState());

  void calc(double a, double b){
    num val = pow(a, 3) + pow(b, 3);
    emit(ProcessedState(a: a, b: b, value: val));
  }

  void save(double a, double b, num result) async{
    final prefs = await SharedPreferences.getInstance();

    if(prefs.get("a_list") == null){
        List<String> a_list = [];
        a_list.add(a.toString());
        prefs.setStringList("a_list", a_list);
    }
    else{
        final List<String>? a_list = prefs.getStringList('a_list');
        a_list!.add(a.toString());
        prefs.setStringList("a_list", a_list);
    }

    if(prefs.get("b_list")==null){
      List<String> b_list = [];
      b_list.add(b.toString());
      prefs.setStringList("b_list", b_list);
    }
    else{
      final List<String>? b_list = prefs.getStringList("b_list");
      b_list!.add(b.toString());
      prefs.setStringList("b_list", b_list);
    }

    if(prefs.get("res_list") == null){
        List<String> res_list = [];
        res_list.add(result.toString());
        prefs.setStringList("res_list", res_list);
    }
    else{
        final List<String>? res_list = prefs.getStringList('res_list');
        res_list!.add(result.toString());
        prefs.setStringList("res_list", res_list);
    }

  }

  void remove(){
    emit(NullState());
  }
}