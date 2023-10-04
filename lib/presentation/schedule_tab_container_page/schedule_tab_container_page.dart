import 'bloc/schedule_tab_container_bloc.dart';
import 'models/schedule_tab_container_model.dart';
import 'package:chike_s_application/core/app_export.dart';
import 'package:chike_s_application/presentation/schedule_page/schedule_page.dart';
import 'package:chike_s_application/widgets/app_bar/appbar_title.dart';
import 'package:chike_s_application/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class ScheduleTabContainerPage extends StatefulWidget {
  const ScheduleTabContainerPage({Key? key})
      : super(
          key: key,
        );

  @override
  ScheduleTabContainerPageState createState() =>
      ScheduleTabContainerPageState();
  static Widget builder(BuildContext context) {
    return BlocProvider<ScheduleTabContainerBloc>(
      create: (context) => ScheduleTabContainerBloc(ScheduleTabContainerState(
        scheduleTabContainerModelObj: ScheduleTabContainerModel(),
      ))
        ..add(ScheduleTabContainerInitialEvent()),
      child: ScheduleTabContainerPage(),
    );
  }
}

class ScheduleTabContainerPageState extends State<ScheduleTabContainerPage>
    with TickerProviderStateMixin {
  late TabController tabviewController;

  @override
  void initState() {
    super.initState();
    tabviewController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return BlocBuilder<ScheduleTabContainerBloc, ScheduleTabContainerState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: theme.colorScheme.primary,
            appBar: CustomAppBar(
              title: AppbarTitle(
                text: "lbl_schedule".tr,
                margin: getMargin(
                  left: 21,
                ),
              ),
              actions: [
                Container(
                  height: getVerticalSize(27),
                  width: getHorizontalSize(24),
                  margin: getMargin(
                    left: 20,
                    top: 13,
                    right: 20,
                    bottom: 16,
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      CustomImageView(
                        svgPath: ImageConstant.imgMoreicon,
                        height: getVerticalSize(16),
                        width: getHorizontalSize(4),
                        alignment: Alignment.topRight,
                        margin: getMargin(
                          left: 20,
                          bottom: 11,
                        ),
                      ),
                      CustomImageView(
                        svgPath: ImageConstant.imgIconlylightnotification,
                        height: getSize(24),
                        width: getSize(24),
                        alignment: Alignment.center,
                        margin: getMargin(
                          top: 3,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            body: SizedBox(
              width: double.maxFinite,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: getVerticalSize(46),
                    width: getHorizontalSize(335),
                    margin: getMargin(
                      top: 29,
                    ),
                    decoration: BoxDecoration(
                      color: appTheme.blueGray50,
                      borderRadius: BorderRadius.circular(
                        getHorizontalSize(8),
                      ),
                    ),
                    child: TabBar(
                      controller: tabviewController,
                      isScrollable: true,
                      labelColor: theme.colorScheme.primary,
                      labelStyle: TextStyle(
                        fontSize: getFontSize(14),
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                      ),
                      unselectedLabelColor: theme.colorScheme.primaryContainer,
                      unselectedLabelStyle: TextStyle(
                        fontSize: getFontSize(14),
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                      ),
                      indicator: BoxDecoration(
                        color: appTheme.cyan300,
                        borderRadius: BorderRadius.circular(
                          getHorizontalSize(8),
                        ),
                      ),
                      tabs: [
                        Tab(
                          child: Text(
                            "lbl_upcoming".tr,
                          ),
                        ),
                        Tab(
                          child: Text(
                            "lbl_completed".tr,
                          ),
                        ),
                        Tab(
                          child: Text(
                            "lbl_canceled".tr,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      height: getVerticalSize(575),
                      child: TabBarView(
                        controller: tabviewController,
                        children: [
                          SchedulePage.builder(context),
                          SchedulePage.builder(context),
                          SchedulePage.builder(context),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
