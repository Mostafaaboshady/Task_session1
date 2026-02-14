import 'package:dartz/dartz.dart';
import 'package:goldex/core/networking/api_constants.dart';
import 'package:goldex/core/networking/dio_helper.dart';
import 'package:goldex/features/gold/data/models/goldmodel.dart';

class GoldRepo {
  Future<Either<String, goldmodel>> getGold() async {
    try {
      final res = await DioHelper.getData(endpoint: ApiConstants.goldEndpoint);
      return Right(goldmodel.fromJson(res.data));
    } catch (e) {
      return Left(e.toString());
    }
  }
}
