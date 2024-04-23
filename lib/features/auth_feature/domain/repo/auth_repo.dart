import 'package:dartz/dartz.dart';
import '../../../../app/error/failures.dart';
import '../../data/models/delete_model.dart';
import '../../data/models/user_model.dart';

abstract  class AuthRepo{
  Future<Either<Failure, UserModel>>login(Map<String,String> map);
  Future<Either<Failure, String>>resendOtp(Map<String,String> map);
  Future<Either<Failure, void>>resetPassword(Map<String,String> map);
  Future<Either<Failure, DeleteModel>>delete();
}