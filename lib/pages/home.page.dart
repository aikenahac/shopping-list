import 'package:flutter/material.dart';
import 'package:shopping_list/api/api.client.dart';
import 'package:shopping_list/models/item.model.dart';
import 'package:shopping_list/utils/assets.util.dart';
import 'package:shopping_list/widgets/home_page/add_item.button.dart';
import 'package:shopping_list/widgets/home_page/list.widget.dart';
import 'package:shopping_list/widgets/home_page/list_item.widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static const String routeName = '/';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Item> _items = [];

  @override
  void initState() {
    getItems();
    super.initState();
  }

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

  void deleteItem(int id) async {
    await API.delete('/items/$id');

    setState(() {
      _items = _items.where((e) => e.id != id).toList();
    });
    Navigator.of(context).pop();
    Navigator.of(context).pushNamed(HomePage.routeName);
  }

  void addItem() {}

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        color: AppAssets.primaryColor,
        width: width,
        child: ItemListContainer(
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
            label: const Text('Add new item'),
            icon: const Icon(Icons.add),
            onPressed: () {
              // TODO: Add new item
            },
          ),
        ),
      ),
    );
  }
}
