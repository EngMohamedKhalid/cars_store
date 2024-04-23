import 'dart:developer';
import 'package:http/http.dart';
import '../../../features/auth_feature/presentation/screens/login_screen.dart';
import '../../error/exceptions.dart';
import '../../model/global_response_model.dart';
import '../../services/cache_service.dart';
import '../get_it_injection.dart';
import '../helper.dart';

class RemoteDataSourceCallHandler {
  RemoteDataSourceCallHandler();

  Future<GlobalResponseModel> call(Response res,) async {
    log(res.statusCode.toString(),name: "status code");
    final response = GlobalResponseModel.fromJson(res.body);
    if (response.errors == null) {
      if(response.authError==true){
        await getIt<CacheService>().clear();
        navigateTo(LoginScreen(),removeAll: true);
        throw ServerException(response.msg ?? "unknown Error");
      }
      else if(response.success==false) {
        throw ServerException(response.msg ?? "unknown Error");
      }
      return response;
    } else {
      String error="";
      response.errors?.values.forEach((e) => error+="$e\n");
      throw ServerException(error.isEmpty?"unknown error${res.statusCode}":error);
    }
  }

  Future<GlobalResponseModel> handleFormData(StreamedResponse res,) async {
    log(res.statusCode.toString(),name: "status code");
    String responseData = await res.stream.bytesToString();
    final response = GlobalResponseModel.fromJson(responseData);
    if (response.errors == null) {
      if(response.authError==true){
        await getIt<CacheService>().clear();
        navigateTo(LoginScreen(),removeAll: true);
        throw ServerException(response.msg ?? "unknown Error");
      }
      else if(response.success==false) {
        throw ServerException(response.msg ?? "unknown Error");
      }
      return response;
    } else {
      String error="";
      response.errors?.values.forEach((e) => error+="$e\n");
      throw ServerException(error.isEmpty?"unknown error${res.statusCode}":error);
    }
  }
}
