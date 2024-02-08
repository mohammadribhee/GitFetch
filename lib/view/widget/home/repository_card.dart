import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RepositoryCard extends StatelessWidget {
  final dynamic item;

  const RepositoryCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          // Navigate to the details screen when the card is tapped
          String branchesUrl = item['branches_url'].replaceAll('{/branch}', '');
          Get.toNamed("details", arguments: branchesUrl);
        },
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                        item['owner']['avatar_url'],
                      ),
                    ),
                    const SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Repository Name: ${item['name']}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Owner\'s Name: ${item['owner']['login']}',
                          style: const TextStyle(
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text('Description: ${item['description'] ?? 'N/A'}'),
              ],
            ),
          ),
        ));
  }
}
