import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

import '../../../../config/theming/text_style.dart';
import '../../../core/view/widgets/scrollable_expanded_column.dart';

class UserDetailsWidget extends StatelessWidget {
  final String title;
  final String description;
  final Widget bodyWidget;

  const UserDetailsWidget({
    super.key,
    required this.title,
    required this.description,
    required this.bodyWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.0.w),
      child: ScrollColumnExpandable(
        children: [
          WidgetAnimator(
            incomingEffect: WidgetTransitionEffects.outgoingSlideOutToRight(
              duration: const Duration(
                milliseconds: 150,
              ),
              delay: const Duration(
                milliseconds: 100,
              ),
            ),
            child: Text(
              title,
              style: TextStyled.font22White600,
            ),
          ),
          const Gap(5.0),
          WidgetAnimator(
            incomingEffect: WidgetTransitionEffects.outgoingSlideOutToRight(
              duration: const Duration(
                milliseconds: 150,
              ),
              delay: const Duration(
                milliseconds: 200,
              ),
            ),
            child: Text(
              description,
              style: TextStyled.font16Grey400,
              textAlign: TextAlign.center,
            ),
          ),
          const Spacer(),
          bodyWidget,
          const Spacer(),
        ],
      ),
    );
  }
}
