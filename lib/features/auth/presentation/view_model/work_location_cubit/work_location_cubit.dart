// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/helper/cache_helper.dart';
import 'package:jobsque/features/auth/data/repos/auth_repo.dart';

part 'work_location_state.dart';

class WorkLocationCubit extends Cubit<WorkLocationState> {
  AuthRepo authRepo;

  WorkLocationCubit({required this.authRepo}) : super(WorkLocationInitial());
  Map<String, bool> workLocation = {
    StringsEn.malaysia: false,
    StringsEn.unitedStates: false,
    StringsEn.singapore: false,
    StringsEn.indonesia: false,
    StringsEn.philiphines: false,
    StringsEn.polandia: false,
    StringsEn.vietnam: false,
    StringsEn.china: false,
    StringsEn.india: false,
    StringsEn.saudiArabia: false,
    StringsEn.canada: false,
    StringsEn.brazil: false,
    StringsEn.argentina: false,
    StringsEn.egypt: false,
  };

//set value
  void toggleWorkInterest({required String key, required bool status}) {
    workLocation[key] = status;
    emit(InterestedInWorkState());
  }

//get status
  bool getStatus({required String key}) => workLocation[key]!;

  //change work type
  changeWorkType({required String type}) {
    if (type == StringsEn.remoteWork) {
      emit(WorkLocationType(typeWork: StringsEn.remoteWork));
    } else {
      emit(WorkLocationType(typeWork: StringsEn.workFromOffice));
    }
  }

//if any true return true
  bool get hasSelectedWorkInterest =>
      workLocation.values.any((status) => status);

//handle Next action
  handleNextAction() async {
    if (hasSelectedWorkInterest) {
      await saveWorkInterests();
    } else {
      emit(InterestedInWorkFailure());
    }
  }

  Future<void> saveWorkInterests() async {
    final List<String> selectedWorkLocation = workLocation.entries
        .where((entry) => entry.value)
        .map((entry) => entry.key)
        .toList();

    final String joinedWorksLocation = selectedWorkLocation.join(' ');
    await save(workLocation: joinedWorksLocation);
  }

//edit user profile
  save({required workLocation}) async {
    emit(InterestedInWorkLoading());
    Future.delayed(Duration(seconds: 2));
    await CacheHelper.saveData(
      key: StringsEn.workLocationK,
      value: workLocation,
    );
    emit(InterestedInWorkSuccess());
  }
}
