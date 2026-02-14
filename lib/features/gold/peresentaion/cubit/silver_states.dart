import 'package:goldex/features/gold/data/models/silvermodel.dart';

abstract class SilverStates {}

class SilverInitialState extends SilverStates {}

class SilverLoadingState extends SilverStates {}

class SilverSuccessState extends SilverStates {
  final SilverModel silverModel;
  SilverSuccessState(this.silverModel);
}

class SilverErrorState extends SilverStates {
  final String error;
  SilverErrorState(this.error);
}
