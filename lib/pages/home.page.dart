import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_list/api/api.client.dart';
import 'package:shopping_list/models/item.model.dart';
import 'package:shopping_list/utils/assets.util.dart';
import 'package:shopping_list/widgets/app_bar.widget.dart';
import 'package:shopping_list/widgets/home_page/add_item.button.dart';
import 'package:shopping_list/widgets/home_page/list.widget.dart';
import 'package:shopping_list/widgets/home_page/list_item.widget.dart';
import 'package:shopping_list/widgets/modal.widget.dart';

// Most important class
// This page is the main page of the app
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static const String routeName = '/';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _nameController = TextEditingController();

  List<Item> _items = [];

  @override
  // Function that executes when the state is initialized
  void initState() {
    getItems();
    super.initState();
  }

  // Function that gets the items from the API
  // Function executes when the state is loaded
  void getItems() async {
    final itemsJson = await API.get('/items');

    setState(() {
      _items = List.from(itemsJson['data']).map(
        (e) {
          return Item.fromJson(e);
        },
      ).toList();
    });
  }

  // Function that deletes an item
  // Function executes when the user clicks on the delete button
  void deleteItem(int id) async {
    await API.delete('/items/$id');

    Navigator.of(context).pop();
    Navigator.of(context).pushNamed(HomePage.routeName);
  }

  // Function that creates an item
  // Function executes when the user clicks on the add button
  void createItem() async {
    final Map<String, dynamic> updateItem = {
      'data': {'name': _nameController.text}
    };

    try {
      await API.post(
        '/items',
        updateItem,
      );

      Navigator.of(context).pop();
      Navigator.of(context).pushNamed(HomePage.routeName);
    } catch (e) {
      print(e);
    }
  }

  // Opens a dialog the allow the user to create a new item
  void addItem() {
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
                  child: const Text(
                    'Close',
                    style: TextStyle(color: Colors.blue),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: Text(
                    'Save',
                    style: TextStyle(color: AppAssets.primaryColor),
                  ),
                  onPressed: () {
                    createItem();
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

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        color: AppAssets.primaryColor,
        width: width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const SLAppBar(),
            ItemListContainer(
              title: 'Shopping List',
              list: ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemCount: _items.length,
                separatorBuilder: (context, index) => const SizedBox(height: 10),
                itemBuilder: (context, i) {
                  if (i == _items.length - 1) {
                    return Column(
                      children: [
                        ListItem(
                          id: _items[i].id,
                          name: _items[i].attributes.name,
                          bought: _items[i].attributes.bought,
                          deleteItem: () => deleteItem(_items[i].id),
                        ),
                        const SizedBox(height: 10.0),
                      ],
                    );
                  }
                  return ListItem(
                    id: _items[i].id,
                    name: _items[i].attributes.name,
                    bought: _items[i].attributes.bought,
                    deleteItem: () => deleteItem(_items[i].id),
                  );
                },
              ),
              button: AddItemButton(
                label: Text(
                  'Add new item',
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                icon: const Icon(Icons.add),
                onPressed: addItem,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
