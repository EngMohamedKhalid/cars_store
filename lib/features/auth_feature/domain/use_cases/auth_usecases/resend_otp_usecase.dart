import 'package:dartz/dartz.dart';

import '../../../../../app/error/failures.dart';
import '../../../../../app/usecase/usecase.dart';
import '../../repo/auth_repo.dart';

class ResendOtpUseCase implements UseCase<String, ResendOtpUseCaseParams> {
  final AuthRepo repository;

  ResendOtpUseCase({required this.repository});

  @override
  Future<Either<Failure, String>> call(ResendOtpUseCaseParams params) async{
    return await repository.resendOtp(params.toMap());
  }
}

class ResendOtpUseCaseParams {
  final String email;
  final String otpType;

  ResendOtpUseCaseParams(
      {
        required this.email,
        required this.otpType,
      });

  Map<String, String> toMap() {
    final map = {
      "email": email,
      "otp_type": otpType,
    };
    return map;
  }
}
