import 'package:almanar_application/features/home_not_subscribe/view/cubit/cubit/home_not_subscribed_cubit.dart';
import 'package:almanar_application/features/home_not_subscribe/view/screens/application_info_screen.dart';
import 'package:almanar_application/features/home_not_subscribe/view/screens/home_not_subscribed_screen.dart';
import 'package:almanar_application/features/home_not_subscribe/view/screens/motivation_screen.dart';
import 'package:almanar_application/utils/custom_icons/my_icons_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeNotSubscribedLayoutScreen extends StatefulWidget {
  const HomeNotSubscribedLayoutScreen({super.key});

  @override
  State<HomeNotSubscribedLayoutScreen> createState() =>
      _HomeNotSubscribedLayoutScreenState();
}

class _HomeNotSubscribedLayoutScreenState
    extends State<HomeNotSubscribedLayoutScreen> {
  PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Directionality(
        textDirection: TextDirection.ltr,
        child: BottomNavigationBar(
          currentIndex: context.read<HomeNotSubscribedCubit>().currentIndex,
          onTap: (index) {
            if (index != context.read<HomeNotSubscribedCubit>().currentIndex) {
              setState(() {
                context.read<HomeNotSubscribedCubit>().currentIndex = index;
                controller.jumpToPage(index);
              });
            }
          },
          items: const [
            BottomNavigationBarItem(
              label: "Home",
              icon: Icon(MyIcons.vector),
            ),
            BottomNavigationBarItem(
              label: "Motivation",
              icon: Icon(Icons.flash_on),
            ),
            BottomNavigationBarItem(
              label: "Info",
              icon: Icon(
                MyIcons.vector__3_,
              ),
            ),
          ],
        ),
      ),
      body: Directionality(
        textDirection: TextDirection.ltr,
        child: PageView(
          controller: controller,
          children: const <Widget>[
            Directionality(
              textDirection: TextDirection.rtl,
              child: HomeNotSubscribedScreen(),
            ),
            MotivationScreen(),
            ApplicationInfoScreen(),
          ],
          onPageChanged: (value) {
            setState(() {
              context.read<HomeNotSubscribedCubit>().currentIndex = value;
            });
          },
        ),
      ),
    );
  }
}
