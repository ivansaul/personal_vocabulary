import 'dart:convert';
import 'dart:math';

import 'package:flutter/services.dart';
import 'package:flutter_template/domain/repositories/localdb_repository.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../../domain/entities/word.dart';

class LocaldbRepositoryImpl extends LocaldbRepository {
  late Future<Isar> db;

  LocaldbRepositoryImpl() {
    db = openDB();
  }

  Future<Isar> openDB() async {
    if (Isar.instanceNames.isEmpty) {
      final dir = await getApplicationDocumentsDirectory();
      final isar = await Isar.open([WordSchema], directory: dir.path);
      return isar;
    }
    return Future.value(Isar.getInstance());
  }

  @override
  Future<void> loadData() async {
    final Isar isar = await db;

    const String path = 'assets/data/words_sample.json';
    final String response = await rootBundle.loadString(path);
    final List<dynamic> data = jsonDecode(response);

    for (var item in data) {
      final tmpWord = Word(
        name: item['word'],
        level: item['level'],
        ipa: item['pron'].cast<String>(),
        sense: item['sense'].cast<String>(),
        soundGB: item['uk_ogg'],
        soundUS: item['us_ogg'],
        examples: item['examples']
            .map(
              (eg) => Example()
                ..en = eg[0]
                ..es = eg[1],
            )
            .toList()
            .cast<Example>(),
      );
      // print(tmpWord.name);
      await isar.writeTxn(() async {
        await isar.words.put(tmpWord);
      });
    }

    // print(data[0]['word']);
  }

  @override
  Future<List<Word>> getRandomWords({required int count}) async {
    final Isar isar = await db;
    final words = await isar.words.where().anyId().findAll();

    // Generate a list of random indexes.
    final indexes = List.generate(count, (index) => Random().nextInt(words.length));
    // Use the random indexes to retrieve 5 random words from the list.
    final randomWords = indexes.map((index) => words[index]).toList();

    return randomWords;
  }

  @override
  Future<List<Word>> searchWord({required String query}) async {
    final Isar isar = await db;
    // final words = await isar.words.filter().nameContains(query).findAll();
    final words = await isar.words.filter().nameContains(query).sortByName().findAll();
    return words;
  }
}
