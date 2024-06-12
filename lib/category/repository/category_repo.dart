import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_tracker/models/category_model.dart';

class CategoryRepo {
  final categoryCollection = FirebaseFirestore.instance.collection('category');

  Future<void> createCategory(CategoryModel category) async {
    try {
      await categoryCollection.doc(category.categoryId).set(category.toMap());
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<List<CategoryModel>> getAllCategory() async {
    try {
      return await categoryCollection.get().then((value) =>
          value.docs.map((e) => CategoryModel.fromMap(e.data())).toList());
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
