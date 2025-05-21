import 'package:lab_7/models/Weather.dart';

abstract class ApiStates{}

class LoadingState extends ApiStates{}

class LoadedStates extends ApiStates{
    weather data;
    LoadedStates({required this.data});
}

class ErrorState extends ApiStates{}

