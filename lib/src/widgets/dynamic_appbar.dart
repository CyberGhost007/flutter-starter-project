import 'package:flutter/material.dart';
import 'package:flutter_app/src/resources/colors.dart';
import 'package:flutter_app/src/resources/dimens.dart';

import 'dynamicText/dynamic_text.dart';

class DynamicAppbar extends StatelessWidget {
  final Widget? child;
  final String? title;
  final bool hasBackButton;
  final bool hasFrontButton;
  const DynamicAppbar({
    Key? key,
    this.child,
    this.title,
    this.hasBackButton = true,
    this.hasFrontButton = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      height: Dimens.appbarHeight,
      width: size.width,
      decoration: const BoxDecoration(
        color: Colors.transparent,
        border: Border(
          bottom: BorderSide(
            width: Dimens.borderHeight,
            color: ColorStyle.grey3,
          ),
        ),
      ),
      child: Stack(
        children: [
          if (hasBackButton)
            IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back)),
          if (child != null) Center(child: child),
          if (child == null)
            Center(
              child: DynamicText(
                text: "$title",
                color: ColorStyle.black3,
                fontSize: Dimens.fontSize18,
              ),
            ),
        ],
      ),
    );
  }
}
