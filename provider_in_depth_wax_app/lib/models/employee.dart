class Employee {
  final int id;
  final String name;
  final String phone;
  final String email;

  Employee(
    this.id,
    this.name,
    this.phone,
    this.email,
  );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'phone': phone,
        'email': email,
      };

  static Employee fromJson(Map<String, dynamic> json) {
    return Employee(
      json['id'],
      json['name'],
      json['phone'],
      json['email'],
    );
  }
}
