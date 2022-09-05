import 'package:flutter/material.dart';
import 'home_page.dart';

class OcasiaoPage extends StatelessWidget {
  final CardItem item;
  final String description;

  const OcasiaoPage({Key? key, required this.item, required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(item.title),
        ),
        body: Column(
          children: [
            AspectRatio(
              aspectRatio: 4 / 3,
              child: Image.network(
                item.urlImage,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              item.title,
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            Text(
              item.description,
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      );
}
