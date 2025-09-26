class Drug {
  final String id;
  final String tradename;
  final String activeIngredient;
  final String company;
  final String form;
  final String group;
  final String newPrice;
  final String pharmacology;
  final String route;
  final DateTime created;
  final DateTime updated;

  const Drug({
    required this.id,
    required this.tradename,
    required this.activeIngredient,
    required this.company,
    required this.form,
    required this.group,
    required this.newPrice,
    required this.pharmacology,
    required this.route,
    required this.created,
    required this.updated,
  });

  factory Drug.fromJson(Map<String, dynamic> json) {
    return Drug(
      id: json['id'] ?? '',
      tradename: json['tradename'] ?? '',
      activeIngredient: json['activeingredient'] ?? '',
      company: json['company'] ?? '',
      form: json['form'] ?? '',
      group: json['group'] ?? '',
      newPrice: json['new_price'] ?? '',
      pharmacology: json['pharmacology'] ?? '',
      route: json['route'] ?? '',
      created: DateTime.parse(
        json['created'] ?? DateTime.now().toIso8601String(),
      ),
      updated: DateTime.parse(
        json['updated'] ?? DateTime.now().toIso8601String(),
      ),
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Drug && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() => tradename;
}
