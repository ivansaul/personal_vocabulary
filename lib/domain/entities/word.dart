class Word {
  final String id;
  final String name;
  final String form;
  final String ipa;
  final String sound;
  final List<String> examples;

  Word({
    required this.id,
    required this.name,
    required this.form,
    required this.ipa,
    required this.sound,
    required this.examples,
  });
}

final exampleWord = Word(
  id: "id",
  name: "pleasure",
  form: "noun",
  ipa: "ˈpleʒər",
  sound: "https://myefe.com/data/sw/words/us/p/pleasure__us_1.mp3",
  examples: [
    "Some parts of the building are for entertainment, pleasure , and relaxation; others for work and for meeting outsiders.",
    "It turns obligation into pleasure , a daily necessity into a celebration.",
    "Glasgow has become a place of leisure, pleasure and entertainment.",
    "What I want to do is to give my customers the satisfaction and pleasure .",
    "Eating disorders are an example of the loss of the ability to be satisfied with the simplest pleasure of life.",
  ],
);
