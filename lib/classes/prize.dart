class Prize {
  final String id;
  final String name;
  final String description;
  final int value;

  Prize({ this.id, this.name, this.description, this.value });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'value': value
    };
  }
}