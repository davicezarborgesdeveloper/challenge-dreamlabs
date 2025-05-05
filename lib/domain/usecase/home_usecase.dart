// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:dreamlabs/data/network/failure.dart';
import 'package:dreamlabs/domain/model/model.dart';
import 'package:dreamlabs/domain/usecase/base_usecase.dart';

import '../repository/repository.dart';

class HomeUseCase extends BaseUseCase<void, HomeData> {
  final Repository _repository;
  HomeUseCase(this._repository);

  @override
  Future<Either<Failure, HomeData>> execute(void input) async {
    return await _repository.getHome();
  }
}
