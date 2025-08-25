import 'package:flutter/material.dart';
import 'package:unit_widgets_display/display_ability.dart';

/// create by 张风捷特烈 on 2020/4/27
/// contact me by email 1981462002@qq.com

class MyIcon extends StatelessWidget {
  const MyIcon({super.key});

  @override
  Widget build(BuildContext context) {
    List<IconData> myIcons = DisplayPlugin().myIcon;
    return Wrap(
      spacing: 20,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: myIcons
          .map(
            (e) => Icon(
              e,
              color: Colors.green,
              size: 60,
            ),
          )
          .toList(),
    );
  }
}
