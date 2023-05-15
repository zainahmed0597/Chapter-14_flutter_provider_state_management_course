import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/favourite_provider.dart';

class MyFavouriteItemsScreen extends StatefulWidget {
  const MyFavouriteItemsScreen({Key? key}) : super(key: key);

  @override
  State<MyFavouriteItemsScreen> createState() => _MyFavouriteItemsScreenState();
}

class _MyFavouriteItemsScreenState extends State<MyFavouriteItemsScreen> {
  @override
  Widget build(BuildContext context) {
    final favouriteProvider = Provider.of<FavouriteItemsProvider>(context);
    print('Build 3');
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Favourite Items'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: favouriteProvider.selectedItem.length,
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
