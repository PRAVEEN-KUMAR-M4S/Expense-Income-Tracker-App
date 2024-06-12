// ignore_for_file: public_member_api_docs, sort_constructors_first
class CategoryModel {
  String categoryId;
  String name;
  int totalExpense;
  String icon;
  int color;
  CategoryModel({
    required this.categoryId,
    required this.name,
    required this.totalExpense,
    required this.icon,
    required this.color,
  });

  static final empty = CategoryModel(
      categoryId: '', name: '', totalExpense: 0, icon: '', color: 4294967295);

  CategoryModel copyWith({
    String? categoryId,
    String? name,
    int? totalExpense,
    String? icon,
    int? color,
  }) {
    return CategoryModel(
      categoryId: categoryId ?? this.categoryId,
      name: name ?? this.name,
      totalExpense: totalExpense ?? this.totalExpense,
      icon: icon ?? this.icon,
      color: color ?? this.color,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'categoryId': categoryId,
      'name': name,
      'totalExpense': totalExpense,
      'icon': icon,
      'color': color,
    };
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      categoryId: map['categoryId'] as String,
      name: map['name'] as String,
      totalExpense: map['totalExpense'] as int,
      icon: map['icon'] as String,
      color: map['color'] as int,
    );
  }
}
