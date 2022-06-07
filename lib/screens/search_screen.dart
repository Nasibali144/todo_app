import 'package:flutter/material.dart';
import 'package:todo_app/services/theme_service.dart';
import 'package:todo_app/views/search_view.dart';

class SearchScreen extends SearchDelegateCustom {

  SearchScreen() : super(
    searchFieldLabel: "Search New",
    // searchFieldStyle: ThemeService.textStyleSearch(),
    searchFieldDecorationTheme: InputDecorationTheme(
      labelStyle: ThemeService.textStyleSearch(),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      floatingLabelStyle: ThemeService.textStyleSearch(),
    ),
  );

  List<String> searchResults = [
    'Islam',
    'Yoqub',
    'Muhammadjon',
    'Bobur',
    'Jamshid aka',
    'Abdulazim',
  ];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.cancel),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.arrow_back,
        color: ThemeService.colorBlack,
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    appBarTheme(context);

    return Center(
      child: Text(
        query,
        style: const TextStyle(fontSize: 64, fontWeight: FontWeight.bold),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestions = searchResults.where(
          (element) {
        final result = element.toLowerCase();
        final input = query.toLowerCase();
        return result.contains(input);
      },
    ).toList();
    return ListView.builder(
        itemCount: suggestions.length,
        itemBuilder: (context, index) {
          final suggestion = suggestions[index];
          return ListTile(
            title: Text(suggestion),
            onTap: () {
              query = suggestion;
            },
          );
        });
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return theme.copyWith(
      appBarTheme: theme.appBarTheme.copyWith(
        toolbarHeight: 100,
        elevation: 0.0,
        backgroundColor: ThemeService.colorBackgroundLight
      )
    );
  }
}