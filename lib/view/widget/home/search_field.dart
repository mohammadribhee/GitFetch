import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  final TextEditingController searchController;
  final Function(String) onChanged;

  const SearchField({
    super.key,
    required this.searchController,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: searchController,
        onChanged: onChanged,
        decoration: const InputDecoration(
          hintText: 'Search...',
          suffixIcon: Icon(Icons.search),
        ),
      ),
    );
  }
}
