import 'package:bloc/bloc.dart';
import 'package:lab_7/cubit/ProcessingStates.dart';

class Processingcubit extends Cubit<Processingstates>{
  Processingcubit():super (ProcessingState());

  void convert(num pascals){
    num mm = pascals/133.3;
    emit(ProcessedState(pascals: pascals, mm: mm));
    return;
  }
  void remove(){
    emit(ProcessingState());
  }
}