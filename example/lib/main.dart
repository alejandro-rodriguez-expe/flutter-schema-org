import 'package:flutter/material.dart';
import 'package:schema_org/schema_org.dart';
import 'package:schema_org/schemas/list_item.dart';
import 'package:schema_org/schemas/item_list.dart';
import 'package:schema_org/schemas/product.dart';
import 'package:schema_org/schemas/thing.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final a = [SchemaListItem(
     position: 1,
    item: SchemaProduct(
      name: 'producto 1'
    )
  )];
  @override
  void initState() {
    super.initState();


    SchemaOrg.writeJsonLd(
      SchemaItemList(
        url:'https://products.id',
        numberOfItems: 10,
        itemListElement:  a.map((e) => e).toList(),
      ),
        name: 'Primer producto',);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Schema.org Example App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.green,
          accentColor: Colors.green.shade700,
          brightness: Brightness.dark,
        ),
      ),
      home: Scaffold(
        body: Center(
          child: IntrinsicWidth(
            child: GestureDetector(
              onTap: () {
                SchemaOrg.removeScript('Primer producto');
              },
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://avatars.githubusercontent.com/u/1946799?s=200&v=4'),
                        radius: 30,
                      ),
                      const SizedBox(width: 16),
                      Text(
                        'Oddbit',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              color: Colors.green,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
