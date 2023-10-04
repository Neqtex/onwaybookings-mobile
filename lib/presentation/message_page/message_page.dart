import '../message_page/widgets/message_item_widget.dart';
import 'bloc/message_bloc.dart';
import 'models/message_item_model.dart';
import 'models/message_model.dart';
import 'package:chike_s_application/core/app_export.dart';
import 'package:chike_s_application/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';

class MessagePage extends StatefulWidget {
  const MessagePage({Key? key}) : super(key: key);

  @override
  MessagePageState createState() => MessagePageState();
  static Widget builder(BuildContext context) {
    return BlocProvider<MessageBloc>(
        create: (context) =>
            MessageBloc(MessageState(messageModelObj: MessageModel()))
              ..add(MessageInitialEvent()),
        child: MessagePage());
  }
}

class MessagePageState extends State<MessagePage>
    with AutomaticKeepAliveClientMixin<MessagePage> {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            backgroundColor: theme.colorScheme.primary,
            body: SizedBox(
                width: mediaQueryData.size.width,
                child: SingleChildScrollView(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                      Expanded(
                          child: SizedBox(
                              width: double.maxFinite,
                              child: Padding(
                                  padding:
                                      getPadding(left: 20, top: 31, right: 20),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Expanded(
                                            child: BlocSelector<
                                                    MessageBloc,
                                                    MessageState,
                                                    MessageModel?>(
                                                selector: (state) =>
                                                    state.messageModelObj,
                                                builder:
                                                    (context, messageModelObj) {
                                                  return ListView.separated(
                                                      physics:
                                                          BouncingScrollPhysics(),
                                                      shrinkWrap: true,
                                                      separatorBuilder:
                                                          (context, index) {
                                                        return SizedBox(
                                                            height:
                                                                getVerticalSize(
                                                                    24));
                                                      },
                                                      itemCount: messageModelObj
                                                              ?.messageItemList
                                                              .length ??
                                                          0,
                                                      itemBuilder:
                                                          (context, index) {
                                                        MessageItemModel model =
                                                            messageModelObj
                                                                        ?.messageItemList[
                                                                    index] ??
                                                                MessageItemModel();
                                                        return MessageItemWidget(
                                                            model,
                                                            onTapChat: () {
                                                          onTapChat(context);
                                                        });
                                                      });
                                                })),
                                        CustomIconButton(
                                            height: getSize(55),
                                            width: getSize(55),
                                            margin: getMargin(top: 237),
                                            padding: getPadding(all: 15),
                                            decoration: IconButtonStyleHelper
                                                .outlineBlack,
                                            child: CustomImageView(
                                                svgPath: ImageConstant
                                                    .imgUserPrimary55x55))
                                      ]))))
                    ])))));
  }

  /// Navigates to the chatScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the chatScreen.
  onTapChat(BuildContext context) {
    NavigatorService.pushNamed(AppRoutes.chatScreen);
  }
}
