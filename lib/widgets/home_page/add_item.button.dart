import 'package:flutter/material.dart';
import 'package:shopping_list/utils/assets.util.dart';

class AddItemButton extends StatelessWidget {
  const AddItemButton({
    Key? key,
    required this.label,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  final Icon icon;
  final Text label;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: SizedBox(
          width: width * 0.8,
          height: height * 0.06,
          child: FloatingActionButton.extended(
            backgroundColor: AppAssets.primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            label: label,
            icon: icon,
            onPressed: onPressed,
          ),
        ),
      ),
    );
  }
}
