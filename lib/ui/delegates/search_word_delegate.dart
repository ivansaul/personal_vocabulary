import 'package:flutter/material.dart';
import 'package:flutter_template/config/theme/app_theme.dart';
import 'package:flutter_template/domain/entities/word.dart';
import 'package:flutter_template/ui/widgets/custom_list_tile.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

typedef SearchWordCallback = Future<List<Word>> Function({required String query});

class SearchWordDelegate extends SearchDelegate<Word?> {
  final SearchWordCallback searchWordCallback;

  SearchWordDelegate({
    required this.searchWordCallback,
  });

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      if (query.isNotEmpty)
        IconButton(
          onPressed: () => query = '',
          icon: const Icon(
            Icons.clear_rounded,
            color: AppTheme.primaryColorDarkGray,
          ),
        ),
      const SizedBox(width: 20),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () => context.pop(),
      icon: const Icon(
        Icons.keyboard_arrow_left_rounded,
        size: 35,
        color: AppTheme.primaryColorDarkGray,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return const Text('res');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container(
      color: AppTheme.primaryColorLightGray,
      child: FutureBuilder(
        future: searchWordCallback(query: query),
        builder: (BuildContext context, AsyncSnapshot<List<Word>> snapshot) {
          final words = snapshot.data ?? [];

          return ListView.builder(
            itemCount: words.length,
            itemBuilder: (BuildContext context, int index) {
              final word = words[index];
              return Padding(
                padding: const EdgeInsets.only(right: 20, left: 20, top: 10),
                child: CustomListTile(
                  title: word.name,
                  subtitle: word.sense.join(', '),
                  leading: Icons.abc,
                  trailing: Icons.play_circle_fill_rounded,
                ),
              );
            },
          );
        },
      ),
    );
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return theme.copyWith(
      appBarTheme: const AppBarTheme(
        backgroundColor: AppTheme.primaryColorLightGray,
      ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: GoogleFonts.lexend(
          color: AppTheme.primaryColorDarkGray,
        ),
        border: InputBorder.none,
      ),
    );
  }

  @override
  TextStyle? get searchFieldStyle => GoogleFonts.lexend(
        color: AppTheme.primaryColorDarkGray,
      );

  @override
  String? get searchFieldLabel => 'Search';
}
