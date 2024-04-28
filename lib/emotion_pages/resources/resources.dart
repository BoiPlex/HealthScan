import 'package:flutter/material.dart';

class LinksPage extends StatelessWidget {
  final List<String> links;

  const LinksPage({Key? key, required this.links}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Links'),
      ),
      body: ListView.builder(
        itemCount: links.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(links[index]),
            onTap: () {
              // Implement navigation to the selected link
              print('Navigating to ${links[index]}');
            },
          );
        },
      ),
    );
  }
}
