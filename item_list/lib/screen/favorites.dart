import 'package:flutter/material.dart';
import 'package:item_list/inherited_widget.dart';
import 'package:item_list/widgets/widgets.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  static String routeName = 'favorites_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Favorites'),
        ),
        body: Builder(builder: (context) {
          final favoriteItems = FavoriteItems.of(context).favoriteItems;
          return ListView.builder(
            itemCount: favoriteItems.length,
            padding: const EdgeInsets.symmetric(vertical: 16),
            itemBuilder: (context, index) =>
                FavoriteItemTile(favoriteItems[index]),
          );
        }));
  }
}
