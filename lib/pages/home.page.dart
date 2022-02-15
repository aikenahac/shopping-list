import 'package:flutter/material.dart';
import 'package:shopping_list/utils/assets.util.dart';
import 'package:shopping_list/widgets/home_page/add_item.button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_list/widgets/home_page/list.widget.dart';
import 'package:shopping_list/widgets/home_page/list_item.widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static const String routeName = '/';

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        color: AppAssets.primaryColor,
        width: width,
        child: Stack(
          children: [
            ItemListContainer(
              title: 'Shopping List',
              list: ListView.separated(
                itemCount: 20,
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 10,
                  );
                },
                itemBuilder: (context, i) {
                  return const ListItem(
                    name: 'Some random item',
                    checked: false,
                  );
                },
              ),
              button: AddItemButton(
                label: const Text('Add new item'),
                icon: const Icon(Icons.add),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
