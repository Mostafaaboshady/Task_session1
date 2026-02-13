import 'package:bloc/bloc.dart';
import 'package:goldex/features/gold/data/repo/goldrepo.dart';
import 'package:goldex/features/gold/persentation/cubit/gold_state.dart';

class GoldCubit extends Cubit <GoldState>{
  final Goldrepo goldrepo;
  GoldCubit( this.goldrepo) : super(GoldInitial()); 

  Future<void> getGold() async {
    emit(GoldLoading());
    final res = await goldrepo.getgold();
    res.fold ((error){
      emit(GoldError(mserror : error));
    }, (Goldmodel){
      emit(GoldSuccess(goldmodel: Goldmodel));
    });
  }

}