abstract class Processingstates {}

class ProcessedState extends Processingstates{
    num pascals;
    num mm;
    ProcessedState({required this.pascals, required this.mm});
}

class ProcessingState extends Processingstates{}