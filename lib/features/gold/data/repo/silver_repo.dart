import 'package:dartz/dartz.dart';
import 'package:goldex/core/networking/api_constants.dart';
import 'package:goldex/core/networking/dio_helper.dart';
import 'package:goldex/features/gold/data/models/silvermodel.dart';

class SilverRepo {
  Future<Either<String, SilverModel>> getSilver() async {
    try {
      final res = await DioHelper.getData(
        endpoint: ApiConstants.silverEndpoint,
      );
      return Right(SilverModel.fromJson(res.data));
    } catch (e) {
      return Left(e.toString());
    }
  }
}
