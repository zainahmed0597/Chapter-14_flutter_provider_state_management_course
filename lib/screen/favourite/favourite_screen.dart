import 'package:flutter/material.dart';
import 'package:flutter_provider_state_management_course/provider/favourite_provider.dart';
import 'package:flutter_provider_state_management_course/screen/favourite/myfavourite.dart';
import 'package:provider/provider.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  List<int> list = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20];
  List<int> selectedItem = [];

  @override
  Widget build(BuildContext context) {
    print('Build 1');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourite App'),
        centerTitle: true,
        actions: [
          InkWell(
            child: const Icon(
              Icons.favorite,
              color: Colors.red,
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MyFavouriteItemsScreen()));
            },
          ),
          SizedBox(width: 20.0),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return Consumer<FavouriteItemsProvider>(
                      builder: (context, value, child) {
                    return ListTile(
                      title: Text('Item ' + index.toString()),
                      trailing: Icon(
                        value.selectedItem.contains(index)
                            ? Icons.favorite
                            : Icons.favorite_outline_rounded,
                        color: Colors.red,
                      ),
                      onTap: () {
                        if (value.selectedItem.contains(index)) {
                          value.removeItem(index);
                        } else {
                          value.addItem(index);
                        }
                        print('Build 2');
                      },
                    );
                  });
                }),
          ),
        ],
      ),
    );
  }
}
