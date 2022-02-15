import 'package:flutter/material.dart';

final _listBoxDecoration = BoxDecoration(
  boxShadow: [
    BoxShadow(
      offset: const Offset(0, -5),
      blurRadius: 10,
      color: Colors.black.withOpacity(0.1),
    ),
  ],
  color: Colors.white,
  borderRadius: const BorderRadius.only(
    topLeft: Radius.circular(30.0),
    topRight: Radius.circular(30.0),
  ),
);

class ItemListContainer extends StatelessWidget {
  const ItemListContainer({
    Key? key,
    required this.title,
    required this.list,
    required this.button,
  }) : super(key: key);

  final String title;
  final ListView list;
  final Widget button;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        decoration: _listBoxDecoration,
        width: width,
        height: height * 0.8,
        child: Column(
          children: [
            const SizedBox(height: 10.0),
            Text(
              title,
              style: const TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: height * 0.65,
              child: list,
            ),
            const Spacer(),
            button,
          ],
        ),
      ),
    );
  }
}
