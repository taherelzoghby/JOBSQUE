import 'package:dartz/dartz.dart';
import 'package:jobsque/core/errors/failure_message.dart';
import 'package:jobsque/core/models/apply_user_model/apply_user_model.dart';

abstract class AppliedJobRepo {
  //get Jobs applied local
  Future<List<ApplyUser>> getJobsAppliedLocal();

  //get Jobs applied remote
  Future<Either<FailureServ, List<ApplyUser>>> getJobsAppliedRemote({
    required String userId,
  });
}
