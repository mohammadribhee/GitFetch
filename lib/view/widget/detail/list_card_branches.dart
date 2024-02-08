import 'package:flutter/material.dart';

class ListCardBranches extends StatelessWidget {
  final List<Map<String, dynamic>> detailsData;

  const ListCardBranches({Key? key, required this.detailsData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: detailsData.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          elevation: 3,
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: ListTile(
            title: Text(
              detailsData[index]['name'],
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 4),
                Text('Commit SHA: ${detailsData[index]['commit']['sha']}'),
                const SizedBox(height: 4),
                Text('Commit URL: ${detailsData[index]['commit']['url']}'),
                const SizedBox(height: 4),
                Text('Protected: ${detailsData[index]['protected']}'),
                const SizedBox(height: 4),
              ],
            ),
          ),
        );
      },
    );
  }
}
