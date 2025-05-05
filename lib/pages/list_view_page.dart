import 'package:flutter/material.dart';
import '../models/item_model.dart';

class ListViewPage extends StatelessWidget {
  const ListViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    final items = List<Item>.generate(20, (index) => Item(
      id: index + 1,
      title: 'Item ${index + 1}',
      description: 'Description for item ${index + 1}',
      color: Colors.primaries[index % Colors.primaries.length],
    ));

    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          child: ListTile(
            leading: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: item.color.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  '${item.id}',
                  style: TextStyle(
                    color: item.color,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            title: Text(item.title),
            subtitle: Text(item.description),
            trailing: IconButton(
              icon: const Icon(Icons.chevron_right),
              onPressed: () {
                // Show details
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text(item.title),
                    content: Text(item.description),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Close'),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}