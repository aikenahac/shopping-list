import 'package:flutter/material.dart';
import 'package:shopping_list/utils/assets.util.dart';
import 'package:shopping_list/widgets/home_page/add_item.button.dart';
import 'package:google_fonts/google_fonts.dart';

const _listBoxDecoration = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.only(
    topLeft: Radius.circular(30.0),
    topRight: Radius.circular(30.0),
  ),
);

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
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration: _listBoxDecoration,
                width: width,
                height: height * 0.8,
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, int i) {
                    if (i == 0) {
                      return const Padding(
                        padding: EdgeInsets.only(left: 15.0),
                        child: Text(
                          'Shopping list',
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    } else {
                      return const Text('Item');
                    }
                  },
                ),
              ),
            ),
            AddItemButton(
              label: const Text('Add new item'),
              icon: const Icon(Icons.add),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
