import '../schedule_page/widgets/schedule_item_widget.dart';
import 'bloc/schedule_bloc.dart';
import 'models/schedule_item_model.dart';
import 'models/schedule_model.dart';
import 'package:chike_s_application/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class SchedulePage extends StatefulWidget {
  const SchedulePage({Key? key})
      : super(
          key: key,
        );

  @override
  SchedulePageState createState() => SchedulePageState();
  static Widget builder(BuildContext context) {
    return BlocProvider<ScheduleBloc>(
      create: (context) => ScheduleBloc(ScheduleState(
        scheduleModelObj: ScheduleModel(),
      ))
        ..add(ScheduleInitialEvent()),
      child: SchedulePage(),
    );
  }
}

class SchedulePageState extends State<SchedulePage>
    with AutomaticKeepAliveClientMixin<SchedulePage> {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.colorScheme.primary,
        body: Container(
          width: double.maxFinite,
          decoration: AppDecoration.fillPrimary,
          child: Padding(
            padding: getPadding(
              left: 20,
              top: 30,
              right: 20,
            ),
            child: BlocSelector<ScheduleBloc, ScheduleState, ScheduleModel?>(
              selector: (state) => state.scheduleModelObj,
              builder: (context, scheduleModelObj) {
                return ListView.separated(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  separatorBuilder: (
                    context,
                    index,
                  ) {
                    return SizedBox(
                      height: getVerticalSize(20),
                    );
                  },
                  itemCount: scheduleModelObj?.scheduleItemList.length ?? 0,
                  itemBuilder: (context, index) {
                    ScheduleItemModel model =
                        scheduleModelObj?.scheduleItemList[index] ??
                            ScheduleItemModel();
                    return ScheduleItemWidget(
                      model,
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
