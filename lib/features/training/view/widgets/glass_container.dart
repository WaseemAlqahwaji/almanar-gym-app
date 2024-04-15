import 'package:almanar_application/config/theming/theme.dart';
import 'package:flutter/material.dart';

class GlassContainer extends StatefulWidget {
  final double glassHeight;
  final double? bottomCircalRadius;
  final Widget glassWidget;
  const GlassContainer({
    super.key,
    required this.glassHeight,
    required this.glassWidget,
    this.bottomCircalRadius = 10.0,
  });

  @override
  State<GlassContainer> createState() => _GlassContainerState();
}

class _GlassContainerState extends State<GlassContainer> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: widget.glassHeight,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(widget.bottomCircalRadius!),
              bottomRight: Radius.circular(widget.bottomCircalRadius!),
            ),
            color: KTheme.greyColor.withOpacity(.3)
          ),
        ),
        Center(
          child: SizedBox(
            height: widget.glassHeight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                widget.glassWidget,
              ],
            ),
          ),
        ),
      ],
    );
  }
}
