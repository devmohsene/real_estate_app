import 'package:flutter/material.dart';
import 'package:real_estate_app/utils/constants.dart';
import 'package:real_estate_app/utils/widget_functions.dart';

class OptionButton extends StatelessWidget {
  final String? textData;
  final IconData? iconData;
  final double? width;
  const OptionButton({Key? key, this.textData, this.iconData, this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      // padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
      backgroundColor: COLOR_BLACK,
      onPressed: () {},
      child: Row(
        children: [
          Icon(
            Icons.map_rounded,
            color: COLOR_WHITE,
          ),
          addHorizontalSpace(10),
          Text('Map View')
        ],
      ),
      // label: const Text('Map View'),
      // icon: const Icon(Icons.map_rounded),
    );
  }
}
