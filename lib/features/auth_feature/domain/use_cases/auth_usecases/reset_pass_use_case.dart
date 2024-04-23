import 'package:dartz/dartz.dart';

import '../../../../../app/error/failures.dart';
import '../../../../../app/usecase/usecase.dart';
import '../../repo/auth_repo.dart';

class ResetPassUseCase implements UseCase<void, ResetPassUseCaseParams> {
  final AuthRepo repository;

  ResetPassUseCase({required this.repository});

  @override
  Future<Either<Failure, void>> call(ResetPassUseCaseParams params) async{
    return await repository.resetPassword(params.toMap());
  }
}

class ResetPassUseCaseParams {
  final String email;
  final String password;
  final String password_confirmation;
  final String otp;

  ResetPassUseCaseParams(
      {
        required this.email,
        required this.otp,
        required this.password,
        required this.password_confirmation,
      });

  Map<String, String> toMap() {
    final map = {
      "email": email,
      "otp": otp,
      "password": password,
      "password_confirmation": password_confirmation,
    };
    return map;
  }
}
