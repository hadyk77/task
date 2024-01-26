import 'package:task/src/core/services/networking/network_service.dart';
import 'package:task/src/features/home/data/datasources/home_datasource.dart';

class RemoteHomeDatasource extends HomeDatasource {
  final NetworkService service;

  RemoteHomeDatasource(this.service);
  @override
  Future<void> getHomeData() {
    return service.get("/admin/get-all-major");
  }
}
