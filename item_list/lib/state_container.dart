import 'package:flutter/material.dart';

class FavoriteItems extends StatefulWidget {
  final Widget child;
  const FavoriteItems({super.key, required this.child});
  static FavoriteItemsState of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<_InheritedFavoriteItems>()!
        .favoriteItemsState;
  }

  @override
  State<FavoriteItems> createState() => FavoriteItemsState();
}

class FavoriteItemsState extends State<FavoriteItems> {
  List<int> favoriteItems = [];
  addToFavorite(int item) {
    setState(() {
      favoriteItems.add(item);
    });
  }

  removeFromFavorite(int item) {
    setState(() {
      favoriteItems.remove(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return _InheritedFavoriteItems(
      favoriteItems: favoriteItems,
      favoriteItemsState: this,
      child: widget.child,
    );
  }
}

class _InheritedFavoriteItems extends InheritedWidget {
  final List<int> favoriteItems;
  final FavoriteItemsState favoriteItemsState;
  const _InheritedFavoriteItems({
    required super.child,
    required this.favoriteItems,
    required this.favoriteItemsState,
  });
  @override
  bool updateShouldNotify(covariant _InheritedFavoriteItems oldWidget) {
    return true;
  }
}
