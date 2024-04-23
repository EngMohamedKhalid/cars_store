import 'dart:convert';
import 'package:dartz/dartz.dart';
import '../../../../app/error/failures.dart';
import '../../../../app/network/network_info.dart';
import '../../../../app/services/cache_service.dart';
import '../../../../app/utils/get_it_injection.dart';
import '../../../../app/utils/hanlders/repo_impl_callhandler.dart';
import '../../domain/repo/auth_repo.dart';
import '../data_source/auth_remote_data_source.dart';
import '../models/delete_model.dart';
import '../models/user_model.dart';

class AuthRepoImpl extends AuthRepo{
  final AuthRemoteDataSource authRemoteDataSource;
  final NetworkInfo networkInfo;
  AuthRepoImpl({required this.authRemoteDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, UserModel>> login(Map<String,String> map)async {
    return await RepoImplCallHandler<UserModel>(networkInfo)(() async {
      final result= await authRemoteDataSource.login(map);
      await getIt<CacheService>().setUserToken(token: result.token??"null");
      await getIt<CacheService>().saveUserData(encodedUser: json.encode(result.toJson()));
      return  result;
    });
  }

  @override
  Future<Either<Failure, DeleteModel>> delete() async {
    return await RepoImplCallHandler<DeleteModel>(networkInfo)(() async {
      final result= await authRemoteDataSource.delete();
      return  result;
    });
  }

  @override
  Future<Either<Failure, String>> resendOtp(Map<String, String> map)async {
    return await RepoImplCallHandler<String>(networkInfo)(() async {
      return await authRemoteDataSource.resendOtp(map);
    });
  }

  @override
  Future<Either<Failure, void>> resetPassword(Map<String, String> map) async {
    return await RepoImplCallHandler<void>(networkInfo)(() async {
      return await authRemoteDataSource.resetPassword(map);
    });
  }

}