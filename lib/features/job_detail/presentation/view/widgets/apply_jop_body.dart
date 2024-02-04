import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/consts/style.dart';
import 'package:jobsque/core/helper/custom_snack.dart';
import 'package:jobsque/core/models/apply_user_model/apply_user_model.dart';
import 'package:jobsque/core/models/job_model/job_model.dart';
import 'package:jobsque/core/widgets/customButton.dart';
import 'package:jobsque/core/widgets/custom_app_bar.dart';
import 'package:jobsque/core/widgets/small_loading_widget.dart';
import 'package:jobsque/features/job_detail/presentation/view/widgets/blur_widget.dart';
import 'package:jobsque/features/job_detail/presentation/view/widgets/circles_bar_section.dart';
import 'package:jobsque/features/job_detail/presentation/view/widgets/info_section_jop_detail.dart';
import 'package:jobsque/features/job_detail/presentation/view/widgets/section_info.dart';
import 'package:jobsque/features/job_detail/presentation/view_models/apply_job_cubit/apply_job_cubit.dart';
import 'package:jobsque/features/job_detail/presentation/view_models/changed_page_cubit/changed_page_cubit.dart';

class ApplyJopBody extends StatefulWidget {
  const ApplyJopBody({super.key, required this.data});

  final Map<String, dynamic> data;

  @override
  State<ApplyJopBody> createState() => _ApplyJopBodyState();
}

class _ApplyJopBodyState extends State<ApplyJopBody> {
  int currentPage = 1;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocConsumer<ChangedPageCubit, ChangedPageState>(
      listener: (context, stateChangedPage) {
        ChangedPageCubit changedBloc = context.read<ChangedPageCubit>();
        if (stateChangedPage is ChangedSuccess) {
          isLoading = false;
          currentPage = changedBloc.currentPage;
        } else if (stateChangedPage is ChangedFailure) {
          isLoading = false;
          showSnack(
            context,
            message: stateChangedPage.message,
            background: AppConsts.danger500,
          );
        } else if (stateChangedPage is ChangedLoading) {
          isLoading = true;
        }
      },
      builder: (context, stateChangedPage) {
        return BlocConsumer<ApplyJobCubit, ApplyJobState>(
          listener: (context, state) {
            if (state is ApplyJobLoading) {
              isLoading = true;
            } else if (state is ApplyJobSuccess) {
              isLoading = false;
            } else if (state is ApplyJobFailure) {
              isLoading = false;
            }
          },
          builder: (context, state) {
            ///fields
            String status = widget.data[StringsEn.status];
            ApplyUser applyUser =
                widget.data[StringsEn.applyUser] ?? ApplyUser();
            Job job = widget.data[StringsEn.job] ?? Job();
            String jobId = status == StringsEn.notComplete
                ? job.id.toString()
                : widget.data[StringsEn.jobId];
            String ApplyUserStatus = applyUser.status ?? '';
            int currentPag = ApplyUserStatus == StringsEn.doing
                ? currentPage
                : status == StringsEn.notComplete
                    ? widget.data[StringsEn.currentStatus]
                    : currentPage;
            return Stack(
              children: [
                SizedBox(
                  height: size.height,
                  child: ListView(
                    children: [
                      SizedBox(height: size.height * .02.h),

                      //custom appBar
                      CustomAppBar(
                        leadingOnTap: () => GoRouter.of(context).pop(),
                        title: status == StringsEn.notComplete
                            ? StringsEn.appliedJob
                            : StringsEn.applyJob,
                        trailingWidget: Container(),
                      ),
                      //if apply not complete
                      status == StringsEn.notComplete
                          ? Column(
                              children: [
                                SizedBox(height: size.height * .02.h),
                                InfoSectionJopDetail(job: job),
                              ],
                            )
                          : Container(),
                      SizedBox(height: size.height * .02.h),
                      //1  2  3 (circles bar)
                      Center(
                        child: CirclesBarSection(currentPage: currentPag),
                      ),
                      SizedBox(height: size.height * .035.h),
                      //info
                      SectionInfo(currentPage: currentPag),
                    ],
                  ),
                ),
                //next or submit
                Positioned(
                  bottom: size.height * .06.h,
                  width: size.width,
                  child: Center(
                    child: SizedBox(
                      height: size.height * .055.h,
                      width: size.width * .9.w,
                      child: CustomButton(
                        text: currentPage == 3 || currentPag == 3
                            ? StringsEn.submit
                            : StringsEn.next,
                        onTap: () => status == StringsEn.notComplete
                            ? context.read<ChangedPageCubit>().buttonNextSubmit(
                                  context: context,
                                  currentPage: currentPag,
                                  jobId: jobId,
                                  status: status,
                                  applyUser: applyUser,
                                )
                            : context.read<ChangedPageCubit>().buttonNextSubmit(
                                  context: context,
                                  currentPage: currentPag,
                                  jobId: jobId,
                                  status: status,
                                ),
                      ),
                    ),
                  ),
                ),

                //
                Positioned(
                  bottom: 0,
                  width: size.width,
                  child: BlurWidget(),
                ),
                //loading
                isLoading
                    ? Positioned(
                        bottom: size.height * .5.h,
                        width: size.width,
                        child: Center(child: LoadingWidget()),
                      )
                    : Container(),
              ],
            );
          },
        );
      },
    );
  }
}
