class Word {
  final String id;
  final String name;
  final String level;
  final List<String> ipa;
  final List<String> sense;
  final String soundUS;
  final String soundGB;
  final List<List<String>> examples;

  Word({
    required this.id,
    required this.name,
    required this.level,
    required this.ipa,
    required this.sense,
    required this.soundGB,
    required this.soundUS,
    required this.examples,
  });
}
