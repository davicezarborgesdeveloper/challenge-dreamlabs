import 'package:dartz/dartz.dart';
import 'package:dreamlabs/domain/model/model.dart';

import '../../data/network/failure.dart';

abstract class Repository {
  Future<Either<Failure, HomeData>> getHome();
}
