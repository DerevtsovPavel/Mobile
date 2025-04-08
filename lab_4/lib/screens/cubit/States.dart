abstract class MainScreenState{}

class ProcessedState extends MainScreenState{
  double a,b;
  num value;
  ProcessedState({required this.a, required this.b, required this.value});
}

class NullState extends MainScreenState{}