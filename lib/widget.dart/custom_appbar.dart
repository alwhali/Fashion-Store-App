import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppbar({
    super.key,
    required this.leading,
    required this.title,
    required this.trailing,
  });
  Widget leading;
  Widget title;
  Widget trailing;

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // toolbarHeight: preferredSize.height,
      toolbarHeight: 55,
      scrolledUnderElevation: 0,
      leading: SizedBox.shrink(),
      leadingWidth: 0,

      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          SizedBox(height: 24, width: 24, child: leading),
          SizedBox(height: 42, width: 91, child: Center(child: title)),
          SizedBox(height: 24, width: 24, child: trailing),
        ],
      ),
      centerTitle: true,
    );
  }
}
