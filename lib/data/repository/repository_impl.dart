import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:dreamlabs/data/mapper/mapper.dart';

import 'package:dreamlabs/data/network/failure.dart';
import 'package:dreamlabs/domain/model/model.dart';
import 'package:dreamlabs/domain/repository/repository.dart';

import '../data_source/remote_data_source.dart';
import '../network/network/network_info.dart';

class RepositoryImpl implements Repository {
  final RemoteDataSource _remoteDataSource;
  final NetworkInfo _networkInfo;
  RepositoryImpl(
    this._remoteDataSource,
    this._networkInfo,
  );
  @override
  Future<Either<Failure, HomeData>> getHome() async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource.getHome();
        return Right(response.toDomain());
      } on DioException catch (error) {
        log('$error');
        return Left(Failure(0, 'message'));
      }
    } else {
      return Left(Failure(0, 'message'));
      // No Internet
    }
  }
}
