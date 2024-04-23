
import '../../../../app/network/network_manager.dart';
import '../../../../app/utils/consts.dart';
import '../../../../app/utils/hanlders/remote_data_source_handler.dart';
import '../models/delete_model.dart';
import '../models/user_model.dart';


abstract class AuthRemoteDataSource {
  /// Calls the [POST] {auth/login} endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<UserModel> login(Map<String, String> map);
  Future<String> resendOtp(Map<String, String> map);
  Future<void> resetPassword(Map<String, String> map);
  Future<DeleteModel> delete();

}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final NetworkManager networkManager;

  AuthRemoteDataSourceImpl({required this.networkManager});

  @override
  Future<UserModel> login(Map<String, dynamic> map) async {
    final res = await networkManager.request(
      body: map,
      endPoint: kSignIn,
    );
    final data =  await RemoteDataSourceCallHandler()(res);
    return UserModel.fromJson(data);
  }

  @override
  Future<DeleteModel> delete() async {
    final res = await networkManager.request(
      endPoint: "kDelete",
    );
    final data =  await RemoteDataSourceCallHandler()(res);
    return DeleteModel.fromJson(data);
  }

  @override
  Future<String> resendOtp(Map<String, String> map)async {
    final res = await networkManager.request(
      body: map,
      endPoint: kResendOtp,
    );
    final data =  await RemoteDataSourceCallHandler()(res);
    return data.msg??"";
  }

  @override
  Future<void> resetPassword(Map<String, String> map) async {
    final res = await networkManager.request(
      body: map,
      endPoint: kResetPassword,
    );
    final data =  await RemoteDataSourceCallHandler()(res);
  }



}
