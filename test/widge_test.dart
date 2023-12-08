import 'package:flutter/material.dart';

class CustomSearchDelegate extends SearchDelegate<String> {
  final List<String> selectedItems;

  CustomSearchDelegate({required this.selectedItems});

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return buildSearchResults();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return buildSearchResults();
  }

  Widget buildSearchResults() {
    List<String> results = selectedItems
        .where((item) => item.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(results[index]),
          onTap: () {
            // Handle item selection
            // You can close the search and perform other actions here
            close(context, results[index]);
          },
        );
      },
    );
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<String> selectedItems = ['Item 1', 'Item 2', 'Item 3'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selected Items Search'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              final selectedResult = await showSearch(
                context: context,
                delegate: CustomSearchDelegate(selectedItems: selectedItems),
              );

              // Handle the selected result
              if (selectedResult != null && !selectedItems.contains(selectedResult)) {
                // Add the selected item to the list
                selectedItems.add(selectedResult);
              }
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: selectedItems.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(selectedItems[index]),
          );
        },
      ),
    );
  }
}
