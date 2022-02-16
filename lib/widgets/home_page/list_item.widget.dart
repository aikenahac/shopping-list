import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_list/api/api.client.dart';
import 'package:shopping_list/utils/assets.util.dart';
import 'package:shopping_list/widgets/modal.widget.dart';

// Style for the items that are not bought
// Plain black colored text
final _notBoughtStyle = GoogleFonts.inter(
  fontSize: 16.0,
  fontWeight: FontWeight.w600,
);

// Style for the items that are bought
// Grayed out and line through text
final _boughtStyle = GoogleFonts.inter(
  fontSize: 16.0,
  fontWeight: FontWeight.w600,
  color: Colors.grey[600],
  decoration: TextDecoration.lineThrough,
);

// Custom widget that shows the item name and the bought status
class ListItem extends StatefulWidget {
  const ListItem({
    Key? key,
    required this.id,
    required this.name,
    required this.bought,
    required this.deleteItem,
  }) : super(key: key);

  final int id;
  final String name;
  final bool bought;
  final void Function() deleteItem;

  @override
  State<ListItem> createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  final TextEditingController _nameController = TextEditingController();

  bool _bought = false;
  String _name = '';

  @override
  // Function that executes when the state is initialized
  void initState() {
    setData();
    super.initState();
  }

  // Function that updates the status of the item
  void updateBought(bool bought) async {
    final Map<String, dynamic> updateItem = {
      'data': {'bought': bought}
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

  // Function that updates the name of the item
  void updateName() async {
    final Map<String, dynamic> updateItem = {
      'data': {'name': _nameController.text}
    };

    try {
      await API.put(
        '/items/${widget.id}',
        updateItem,
      );

      setState(() {
        _name = _nameController.text;
      });
    } catch (e) {
      print(e);
    }
  }

  // Function that sets the data of the item
  // This function is called when the state is initialized
  // The purpose is to sync the data with the server
  void setData() {
    setState(() {
      _name = widget.name;
      _bought = widget.bought;
    });
    _nameController.text = _name;
  }

  // Opens a dialog the allow the user to manage the item
  void openEdit() {
    showDialog(
      context: context,
      builder: (context) => Modal(
        height: 150.0,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _nameController,
              decoration: AppAssets.inputDecoration,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  child: Text(
                    'Delete',
                    style: TextStyle(color: Colors.red[600]),
                  ),
                  onPressed: () {
                    widget.deleteItem();
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: Text(
                    'Save',
                    style: TextStyle(color: AppAssets.primaryColor),
                  ),
                  onPressed: () {
                    updateName();
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return GestureDetector(
      onLongPress: openEdit,
      child: Align(
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
                  _name,
                  style: _bought ? _boughtStyle : _notBoughtStyle,
                ),
                Checkbox(
                  fillColor: MaterialStateProperty.resolveWith((states) {
                    if (states.contains(MaterialState.selected)) {
                      return AppAssets.primaryColor;
                    }

                    return Colors.grey[400];
                  }),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  value: _bought,
                  onChanged: (bool? value) => updateBought(value!),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
