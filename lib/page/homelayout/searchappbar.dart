import 'package:flutter/material.dart';

class AppBarSearch extends StatefulWidget implements PreferredSizeWidget {
  const AppBarSearch({Key? key}) : super(key: key);

  @override
  State<AppBarSearch> createState() => _AppBarSearchState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _AppBarSearchState extends State<AppBarSearch> {
  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('My App'),
      actions: [
        TextField(
          controller: _searchController,
          decoration: InputDecoration(
            hintText: 'Enter search text...',
          ),
        ),
      ],
    );
  }
}
