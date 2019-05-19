class Customer {
  String email;
  String name;
  String phone;
  int points;

  Customer({ this.email, this.name, this.phone, this.points });

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'name': name,
      'phone': phone,
      'points': points
    };
  }
}