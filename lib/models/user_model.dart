

class UserModel {
  final String email;
  final double expense;
  final double income;
  final String name;
  final double totalBalance;
  UserModel({
    required this.email,
    required this.expense,
    required this.income,
    required this.name,
    required this.totalBalance,
  });
  

  UserModel copyWith({
    String? email,
    double? expense,
    double? income,
    String? name,
    double? totalBalance,
  }) {
    return UserModel(
      email: email ?? this.email,
      expense: expense ?? this.expense,
      income: income ?? this.income,
      name: name ?? this.name,
      totalBalance: totalBalance ?? this.totalBalance,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'expense': expense,
      'income': income,
      'name': name,
      'totalBalance': totalBalance,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      email: map['email'] as String,
      expense: map['expense'] as double,
      income: map['income'] as double,
      name: map['name'] as String,
      totalBalance: map['totalBalance'] as double,
    );
  }

 
}
