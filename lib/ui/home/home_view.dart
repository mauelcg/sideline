import 'package:animations/animations.dart';
import 'package:authentication/ui/address_selection/address_selection_view.dart';
import 'package:authentication/ui/job_search/job_search_view.dart';
import 'package:authentication/ui/job_results/job_results_view.dart';
import 'package:authentication/ui/profile/profile_view.dart';
import 'package:authentication/ui/shared/styles.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'home_viewmodel.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  Widget getViewForIndex(int index) {
    switch (index) {
      case 0:
        return AddressSelectionView();
      case 1:
        return JobSearchView();
      case 3:
        return ProfileView();
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, model, child) => Scaffold(
        body: PageTransitionSwitcher(
          duration: const Duration(milliseconds: 300),
          reverse: model.reverse,
          transitionBuilder: (
            Widget child,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) {
            return SharedAxisTransition(
              child: child,
              animation: animation,
              secondaryAnimation: secondaryAnimation,
              transitionType: SharedAxisTransitionType.horizontal,
            );
          },
          child: getViewForIndex(model.currentIndex),
        ),
        bottomNavigationBar: NavigationBar(
          onDestinationSelected: model.setIndex,
          indicatorColor: kcPrimaryColor,
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home_max_rounded),
              label: 'HOME',
            ),
            NavigationDestination(
              icon: Icon(Icons.search_rounded),
              label: 'SEARCH',
            ),
            NavigationDestination(
              icon: Icon(Icons.bookmark_border_rounded),
              label: 'MY ACTIVITY',
            ),
            NavigationDestination(
              icon: Icon(Icons.person_4_outlined),
              label: 'PROFILE',
            )
          ],
          selectedIndex: model.currentIndex,
          elevation: 0,
        ),
      ),
    );
  }
}
