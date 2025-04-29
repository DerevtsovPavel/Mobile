import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lab_6/cubit/NasaStates.dart';
import 'package:lab_6/models/nasa.dart';
import 'package:lab_6/requests/api.dart';

class Nasacubit extends Cubit<NasaState>{
  Nasacubit (): super(NasaLoadingState());

  Future<void> loadData(String sol) async{
    try{
      Map<String,dynamic> apiData = await getNasaData(sol);
      Nasa nasadata = Nasa.fromJson(apiData);
      emit(NasaLoadedState(data: nasadata));
      return;
    }
    catch(e){
      emit(NasaErrorState());
      return;
    }
  }
}