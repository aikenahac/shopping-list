import 'package:flutter/material.dart';

const _notBoughtStyle = TextStyle(
  fontSize: 16.0,
  fontWeight: FontWeight.w600,
);

final _boughtStyle = TextStyle(
  fontSize: 16.0,
  fontWeight: FontWeight.w600,
  color: Colors.grey[600],
  decoration: TextDecoration.lineThrough,
);

class ListItem extends StatelessWidget {
  const ListItem({
    Key? key,
    required this.name,
    required this.bought,
  }) : super(key: key);

  final String name;
  final bool bought;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Align(
      alignment: Alignment.center,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10.0,
              offset: Offset(0.0, 10.0),
            ),
          ],
          color: Colors.white,
        ),
        width: width * 0.9,
        height: height * 0.06,
        child: Padding(
          padding: const EdgeInsets.only(
            left: 15.0,
            right: 15.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name,
                style: bought ? _boughtStyle : _notBoughtStyle,
              ),
              Checkbox(
                value: bought,
                onChanged: (value) {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
