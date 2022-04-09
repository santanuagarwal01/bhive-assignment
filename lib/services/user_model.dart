class MyUser {
  String? id;
  String? referralCode;
  final String name;
  final String email;

  MyUser({
    this.id,
    required this.email,
    required this.name,
    this.referralCode,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'referral': referralCode,
      };

  static MyUser fromJson(Map<String, dynamic> json) => MyUser(
        id: json['id'],
        email: json['email'],
        name: json['name'],
        referralCode: json['referral'],
      );
}
