import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../flutter_utils/architecture/presentation/navigation/targets/queue/queue_target_widget.dart';
import '../../../../architecture/presentation/navigation/route_bundle.dart';
import '../../../../flutter_utils/architecture/presentation/scope/scope_bundle.dart';
import '../../../../flutter_utils/architecture/presentation/view/widget_state.dart';
import '../../../../flutter_utils/architecture/presentation/view/widget_model_bundle.dart';
import '../../app/yo_app_scope.dart';
import '../../resources/app_colors.dart';
import '../../resources/app_images.dart';
import 'models/main_tab_type.dart';
import 'main_model.dart';
import 'main_scope.dart';

class MainState extends WidgetState<YoAppScope, MainScope, MainModel, void, void> {

  MainState(RouteBundle<YoAppScope, void, void> bundle) : super(bundle);

  @override
  MainScope createScope(ScopeBundle<YoAppScope, MainModel, void, void> bundle) => MainScope(bundle);

  @override
  MainModel createViewModel(WidgetModelBundle<void> bundle) => MainModel(bundle);

  @override
  void initState() {
    super.initState();
    scope.onInitReaction.excite(null);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      body: QueueTargetWidget(scope.queueTarget),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _tabToIndex(model.tabType),
          items: [
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(AppImages.icPerson, color: AppColors.darkGray),
                  title: Text("asd"),
                  activeIcon: SvgPicture.asset(AppImages.icPersonFilled, color: theme.primaryColor)
              ),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(AppImages.icMessage, color: AppColors.darkGray),
                  title: Text("asd"),
                  activeIcon: SvgPicture.asset(AppImages.icMessageFilled, color: theme.primaryColor)
              ),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(AppImages.icList, color: AppColors.darkGray),
                  title: Text("asd"),
                  activeIcon: SvgPicture.asset(AppImages.icListFilled, color: theme.primaryColor)
              )
          ],
          onTap: (index) => scope.onSwitchTabReaction.excite(_indexToTab(index))
      )
  );
  
  MainTabType _indexToTab(int index) {
    switch (index) {
      case 0: return MainTabType.profile;
      case 1: return MainTabType.chatList;
      default: return MainTabType.contactList;
    }
  }

  int _tabToIndex(MainTabType tabType) {
    switch(tabType) {
      case MainTabType.profile: return 0;
      case MainTabType.chatList: return 1;
      default: return 2;
    }
  }
}
