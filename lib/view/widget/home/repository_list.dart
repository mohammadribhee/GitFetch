import 'package:flutter/material.dart';
import 'package:gitfetch/view/widget/home/repository_card.dart';

class RepositoryList extends StatelessWidget {
  final List<dynamic> searchData;

  const RepositoryList({super.key, required this.searchData});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: searchData.length,
      itemBuilder: (context, index) {
        return RepositoryCard(item: searchData[index]);
      },
    );
  }
}
