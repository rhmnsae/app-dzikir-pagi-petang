class DzikirModel {
  final int number;
  final String title;
  final String arabic;
  final String transliteration;
  final String translation;
  final String faedah;
  final String reference;
  final int repeatCount;
  final bool isPagiOnly;
  final bool isPetangOnly;

  const DzikirModel({
    required this.number,
    required this.title,
    required this.arabic,
    required this.transliteration,
    required this.translation,
    required this.faedah,
    required this.reference,
    this.repeatCount = 1,
    this.isPagiOnly = false,
    this.isPetangOnly = false,
  });
}
