import 'package:flutter/material.dart';

final class HomeView extends StatefulWidget {
  const HomeView({super.key});
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('vb10 home'),
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return _Card(index);
        },
      ),
    );
  }
}

class _Card extends StatelessWidget {
  const _Card(this.index);
  final int index;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: ListTile(
          leading: const Icon(Icons.ac_unit),
          title: Text('Item $index'),
          onTap: () {
            // context.route.navigateToPage(page);
          },
        ),
      ),
    );
  }
}
