import 'package:flutter/cupertino.dart';
import 'package:jobsque/core/consts/style.dart';
import 'package:jobsque/features/two_step_verifi/presentation/view/widgets/section_otp.dart';

import '../../../../../../../../core/consts/strings.dart';
import 'custom_heading_two_step_verifi.dart';

class VerifyMethod extends StatelessWidget {
  const VerifyMethod({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //Enter the 6 digit code
        CustomHeadingTwoStepVerifi(
          head: StringsEn.enter6Digit,
          subHead: StringsEn.pleaseConfirmCode,
        ),
        const AspectRatio(aspectRatio: AppConsts.aspect16on1),

        //pin
        const SectionOtp(),
        //resend
        Row(
          children: [
            Text(
              StringsEn.resendCode,
              style: AppConsts.style14.copyWith(fontSize: 16),
            ),
            Text(
              ' 45s',
              style: AppConsts.style16White.copyWith(
                color: AppConsts.primary500,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
