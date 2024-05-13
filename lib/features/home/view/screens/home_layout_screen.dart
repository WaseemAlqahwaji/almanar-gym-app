import 'package:almanar_application/config/theming/text_style.dart';
import 'package:almanar_application/features/food/view/screens/food_screen.dart';
import 'package:almanar_application/features/home/view/cubit/home_cubit.dart';
import 'package:almanar_application/features/home/view/screens/home_screen.dart';
import 'package:almanar_application/features/profile/view/screens/profile_screen.dart';
import 'package:almanar_application/features/training/view/screens/training_screen.dart';
import 'package:almanar_application/utils/custom_icons/my_icons_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          appBarTitle[context.read<HomeCubit>().currentIndex],
          style: TextStyled.font16White400,
        ),
      ),
      body: Directionality(
        textDirection: TextDirection.ltr,
        child: PageView(
          controller: controller,
          onPageChanged: (index) {
            setState(() {
              context.read<HomeCubit>().currentIndex = index;
            });
          },
          children: const [
            HomeScreen(),
            TrainingScreen(),
            FoodScreen(),
            ProfileScreen(),
          ],
        ),
      ),
      bottomNavigationBar: bottomNavigationBar(context),
    );
  }

  List<String> appBarTitle = [
    "الصفحة الرئيسية",
    "صفحة التمارين",
    "صفحة الأغذية",
    "معلوماتك",
  ];

  Widget bottomNavigationBar(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            context.read<HomeCubit>().currentIndex = index;
            controller.jumpToPage(index);
          });
        },
        currentIndex: context.read<HomeCubit>().currentIndex,
        items: [
          const BottomNavigationBarItem(
            icon: Icon(
              MyIcons.vector,
            ),
            label: "Home",
          ),
          const BottomNavigationBarItem(
            icon: Icon(
              MyIcons.vector__1_,
            ),
            label: "Training",
          ),
          const BottomNavigationBarItem(
            icon: Icon(
              MyIcons.vector__2_,
            ),
            label: "food",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_rounded,
              size: 25.sp,
            ),
            label: "profile",
          ),
        ],
      ),
    );
  }
}
