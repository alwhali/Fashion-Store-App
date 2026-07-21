import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ToolBarWidget extends StatelessWidget {
  const ToolBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      height: 52,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.black, width: 0.5),
          top: BorderSide(color: Colors.black, width: 0.5),
        ),
      ),
      child: Row(
        children: [
          //sort and icon
          Expanded(
            flex: 1,
            child: Row(
              children: [
                Text(
                  "Sort by",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
                SizedBox(width: 23),
                SizedBox(
                  height: 24,
                  width: 24,
                  child: SvgPicture.asset("assets/svg/arrow_up_down.svg"),
                ),
              ],
            ),
          ),
          //filter and group icon
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //filterand icon
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 24,
                      width: 24,
                      child: SvgPicture.asset(
                        "assets/svg/lucide_settings-2.svg",
                      ),
                    ),
                    SizedBox(width: 5),
                    Text(
                      "Filter",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 20),
                //box icon or group icon
                SizedBox(
                  height: 24,
                  width: 24,
                  child: SvgPicture.asset("assets/svg/ion_grid-outline.svg"),
                ),
                SizedBox(width: 20),
                //person icon
                SizedBox(
                  height: 24,
                  width: 24,
                  child: SvgPicture.asset(
                    "assets/svg/solar_users-group-rounded-outline.svg",
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
