import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goldex/features/gold/data/repo/silver_repo.dart';
import 'package:goldex/features/gold/peresentaion/cubit/silver_states.dart';

class SilverCubit extends Cubit<SilverStates> {
  final SilverRepo silverRepo;
  SilverCubit({required this.silverRepo}) : super(SilverInitialState());
  Future<void> getSilver() async {
    emit(SilverLoadingState());
    final res = await silverRepo.getSilver();
    res.fold(
      (Error) {
        emit(SilverErrorState(Error));
      },
      (SilverModel) {
        emit(SilverSuccessState(SilverModel));
      },
    );
  }
}
