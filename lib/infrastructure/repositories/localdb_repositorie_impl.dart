import 'dart:convert';

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

    const String path = 'assets/data/words.json';
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
      print(tmpWord.name);
      await isar.writeTxn(() async {
        await isar.words.put(tmpWord);
      });
    }

    // print(data[0]['word']);
  }

  @override
  Future<Word> getRandomWord() {
    // TODO: implement getRandomWord
    throw UnimplementedError();
  }
}
