import 'package:isar/isar.dart';

part "word.g.dart";

@collection
class Word {
  Id id = Isar.autoIncrement;
  final String name;
  final String level;
  final List<String> ipa;
  final List<String> sense;
  final String soundUS;
  final String soundGB;
  final List<Example> examples;

  Word({
    required this.name,
    required this.level,
    required this.ipa,
    required this.sense,
    required this.soundGB,
    required this.soundUS,
    required this.examples,
  });
}

@embedded
class Example {
  // List<String>? example;
  String? en;
  String? es;
}