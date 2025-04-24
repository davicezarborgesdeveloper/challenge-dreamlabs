import '../network/app_api.dart';
import '../responses/responses.dart';

abstract class RemoteDataSource {
  Future<HomeResponse> getHome();
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final AppServiceClient _appServiceClient;
  RemoteDataSourceImpl(this._appServiceClient);
  @override
  Future<HomeResponse> getHome() async {
    return await _appServiceClient.getPosts();
  }
}
