import 'package:flutter/material.dart';

class StateContainer extends StatefulWidget {
  final Widget child;
  const StateContainer({super.key, required this.child});
  static StateContainerState of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<_InheritedStateContainer>()!
        .favoriteItemsState;
  }

  @override
  State<StateContainer> createState() => StateContainerState();
}

class StateContainerState extends State<StateContainer> {
  List<int> favoriteItems = [];
  addToFavorite(int item) {
    setState(() {
      addItem(item);
    });
  }

  addItem(int item) {
    favoriteItems.add(item);
  }

  removeFromFavorite(int item) {
    setState(() {
      removeItem(item);
    });
  }

  removeItem(int item) {
    favoriteItems.remove(item);
  }

  @override
  Widget build(BuildContext context) {
    return _InheritedStateContainer(
      favoriteItems: favoriteItems,
      favoriteItemsState: this,
      child: widget.child,
    );
  }
}

class _InheritedStateContainer extends InheritedWidget {
  final List<int> favoriteItems;
  final StateContainerState favoriteItemsState;
  const _InheritedStateContainer({
    required super.child,
    required this.favoriteItems,
    required this.favoriteItemsState,
  });
  @override
  bool updateShouldNotify(covariant _InheritedStateContainer oldWidget) {
    return true;
  }
}
