import 'package:goldex/features/gold/data/models/goldmodel.dart';

abstract class GoldState {}
class GoldInitial extends GoldState {

}
class GoldLoading extends GoldState {
  
}
class GoldSuccess extends GoldState {
  final Goldmodel goldmodel;
  GoldSuccess({ required this.goldmodel});
}
class GoldError extends GoldState {
  final String mserror;
  GoldError({required this.mserror});
}