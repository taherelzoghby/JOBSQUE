import 'package:flutter/material.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/consts/style.dart';
import 'package:jobsque/core/widgets/tile_widget.dart';
import 'package:jobsque/features/notification/data/models/notification.dart';
import 'package:jobsque/features/notification/presentation/view/widgets/notifications_listview.dart';

class SectionNotifications extends StatelessWidget {
  const SectionNotifications({
    super.key,
    required this.notificationModel,
  });

  final NotificationModel notificationModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TileWidget(label: StringsEn.notifications),

        ///notification
        Padding(
          padding: AppConsts.padding10Horiz,
          child: NotificationListView(notificationModel: notificationModel),
        ),
      ],
    );
  }
}
