import 'package:dartz/dartz.dart';

import '../../../../../app/error/failures.dart';
import '../../../../../app/usecase/usecase.dart';
import '../../../data/models/delete_model.dart';
import '../../../data/models/user_model.dart';
import '../../repo/auth_repo.dart';

class DeleteUseCase implements UseCase<DeleteModel, NoParams> {
  final AuthRepo repository;

  DeleteUseCase({required this.repository});

  @override
  Future<Either<Failure, DeleteModel>> call(NoParams params) async{
    return await repository.delete();
  }

}
