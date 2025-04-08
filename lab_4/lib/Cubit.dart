import 'dart:math';

import 'States.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreenCubit extends Cubit<MainScreenState>{

  MainScreenCubit(): super(NullState());

  void calc(double a, double b){
    num val = pow(a, 3) + pow(b, 3);
    emit(ProcessedState(a: a, b: b, value: val));
  }

  void remove(){
    emit(NullState());
  }
}