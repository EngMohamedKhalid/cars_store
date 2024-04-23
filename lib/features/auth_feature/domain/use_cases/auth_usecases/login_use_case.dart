import 'package:dartz/dartz.dart';

import '../../../../../app/error/failures.dart';
import '../../../../../app/usecase/usecase.dart';
import '../../../data/models/user_model.dart';
import '../../repo/auth_repo.dart';

class LoginUseCase implements UseCase<UserModel, LoginUSeCaseParams> {
  final AuthRepo repository;

  LoginUseCase({required this.repository});

  @override
  Future<Either<Failure, UserModel>> call(LoginUSeCaseParams params) async{
    return await repository.login(params.toMap());
  }

}

class LoginUSeCaseParams {
  final String email;
  final String password;
  final String platform;
  //fcm_token
  // final String deviceId;
  //ios or Android
  // final String deviceType;

  LoginUSeCaseParams(
      {
        required this.email,
        required this.password,
        required this.platform,
        // required this.deviceId,
        // required this.deviceType,
      });

  Map<String, String> toMap() {
    final map = {
      "email": email,
      "password": password,
      "platform": platform,
      // "device_id": deviceId,
      // "device_type": deviceType,
    };
    return map;
  }
}
