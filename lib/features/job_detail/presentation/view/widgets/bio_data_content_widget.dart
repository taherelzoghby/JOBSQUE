import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/consts/style.dart';
import 'package:jobsque/features/job_detail/presentation/view_models/bio_data_cubit/bio_data_cubit.dart';

import '../../../../../core/widgets/custom_filter_text_form_field.dart';

class BioDataContentWidget extends StatelessWidget {
  const BioDataContentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    BioDataCubit bloc = BlocProvider.of<BioDataCubit>(context);
    return Form(
      key: bloc.keyFormApplyJop1,
      child: Column(
        children: [
          //full name
          CustomFilterTextFormField(
            label: StringsEn.fullName,
            star: StringsEn.star,
            hint: StringsEn.fullName,
            perfixIcon: Icon(Icons.person, size: 16.sp),
            controller: bloc.name,
            autoFocus: true,
          ),
          const AspectRatio(aspectRatio: AppConsts.aspect16on1),

          //email
          CustomFilterTextFormField(
            label: StringsEn.email,
            star: StringsEn.star,
            hint: StringsEn.email,
            perfixIcon: Icon(Icons.mail, size: 16.sp),
            controller: bloc.email,
          ),
          const AspectRatio(aspectRatio: AppConsts.aspect16on1),

          //phone number
          CustomFilterTextFormField(
            label: StringsEn.noHandPhone,
            star: StringsEn.star,
            hint: StringsEn.phone,
            perfixIcon: CountryCodePicker(
              initialSelection: StringsEn.eg,
              flagWidth: 25,
              showDropDownButton: true,
              showCountryOnly: true,
              showOnlyCountryWhenClosed: true,
              showFlagDialog: true,
              hideMainText: true,
              showFlagMain: true,
              onChanged: (CountryCode code) =>
                  bloc.onChangedCountry(code: code),
            ),
            controller: bloc.phone,
            codeCountry: bloc.codeCountry,
          ),
          const AspectRatio(aspectRatio: AppConsts.aspect16on1),
        ],
      ),
    );
  }
}
