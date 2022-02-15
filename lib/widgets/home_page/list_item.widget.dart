import 'package:flutter/material.dart';
import 'package:shopping_list/api/api.client.dart';
import 'package:shopping_list/models/item_attributes.model.dart';

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

class ListItem extends StatefulWidget {
  const ListItem({
    Key? key,
    required this.id,
    required this.name,
    required this.bought,
  }) : super(key: key);

  final int id;
  final String name;
  final bool bought;

  @override
  State<ListItem> createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  bool _bought = false;

  @override
  void initState() {
    setBought();
    super.initState();
  }

  void updateBought(bool bought) async {
    final Map<String, dynamic> updateItem = {
      'data': {
        'name': widget.name,
        'bought': bought,
      }
    };

    try {
      await API.put(
        '/items/${widget.id}',
        updateItem,
      );

      setState(() {
        _bought = bought;
      });
    } catch (e) {
      print(e);
    }
  }

  void setBought() {
    setState(() {
      _bought = widget.bought;
    });
  }

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
                widget.name,
                style: _bought ? _boughtStyle : _notBoughtStyle,
              ),
              Checkbox(
                value: _bought,
                onChanged: (bool? value) => updateBought(value!),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
