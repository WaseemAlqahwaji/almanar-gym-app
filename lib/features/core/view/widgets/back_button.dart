import 'package:flutter/material.dart';

import '../../../../config/theming/theme.dart';

class KBackButton extends StatelessWidget {
  final void Function()? onTap;

  const KBackButton({
    super.key,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () => Navigator.of(context).pop(),
      child: CircleAvatar(
        backgroundColor: KTheme.greyButtonsColor,
        child: const Icon(
          Icons.arrow_back_ios_sharp,
          color: Colors.white,
        ),
      ),
    );    
  }
}
