import 'package:expense_tracker/category/add_expense/pop_up_form.dart';
import 'package:expense_tracker/category/bloc/create_category_bloc/category_bloc.dart';
import 'package:expense_tracker/constants/constants.dart';
import 'package:expense_tracker/constants/custom_button.dart';
import 'package:expense_tracker/models/category_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:uuid/uuid.dart';

Future getCategoryCreation(
    BuildContext context,
    TextEditingController nameController,
    TextEditingController iconController,
    TextEditingController colorController) {
  List<String> imgs = [
    'enter',
    'food',
    'home',
    'pet',
    'shop',
    'tech',
    'travel'
  ];
  return showDialog(
    context: context,
    builder: (ctx1) {
      bool isLoading = false;
      bool isExpanded = false;
      String selectedCat = '';
      Color selectedColor = whiteColor;
      CategoryModel categoryModel = CategoryModel.empty;
      return StatefulBuilder(builder: (ctx1, setState) {
        return BlocListener<CategoryBloc, CategoryState>(
          listener: (context, state) {
            if (state is CategorySuccessState) {
              Navigator.pop(ctx1,categoryModel);
            } else if (state is CategoryisLoadingState) {
              setState(() {
                isLoading = true;
              });
            }
          },
          child: AlertDialog(
            title: const Text('Create a Category'),
            content: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    PopUpForm(
                        selectedColor: whiteColor,
                        ontap: () {},
                        controller: nameController,
                        readOnly: false,
                        text: 'Name'),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      readOnly: true,
                      controller: iconController,
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        hintText: 'Icon',
                        fillColor: whiteColor,
                        filled: true,
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isExpanded = !isExpanded;
                            });
                          },
                          icon: const Icon(
                            CupertinoIcons.down_arrow,
                            size: 18,
                            color: Colors.grey,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: isExpanded
                              ? const BorderRadius.vertical(
                                  top: Radius.circular(15),
                                )
                              : BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    isExpanded
                        ? Container(
                            width: MediaQuery.of(context).size.width,
                            height: 200,
                            decoration: const BoxDecoration(
                              color: whiteColor,
                              borderRadius: BorderRadius.vertical(
                                bottom: Radius.circular(15),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GridView.builder(
                                  itemCount: imgs.length,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                          mainAxisSpacing: 5,
                                          crossAxisSpacing: 5,
                                          crossAxisCount: 3),
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          selectedCat = imgs[index];
                                        });
                                      },
                                      child: Container(
                                        width: 50,
                                        height: 50,
                                        decoration: BoxDecoration(
                                            color: selectedCat == imgs[index]
                                                ? Colors.green.shade400
                                                : Colors.white,
                                            border:
                                                Border.all(color: Colors.grey),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            image: DecorationImage(
                                              image: AssetImage(
                                                  'assets/${imgs[index]}.png'),
                                            )),
                                      ),
                                    );
                                  }),
                            ),
                          )
                        : Container(),
                    const SizedBox(
                      height: 10,
                    ),
                    PopUpForm(
                        selectedColor: selectedColor,
                        ontap: () {
                          showDialog(
                              context: context,
                              builder: (ctx2) {
                                return AlertDialog(
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      ColorPicker(
                                          pickerColor: Colors.white,
                                          onColorChanged: (value) {
                                            setState(() {
                                              selectedColor = value;
                                            });
                                          }),
                                      CustomButton(
                                        ontap: () {
                                          print(selectedColor.value);
                                          Navigator.pop(ctx2);
                                        },
                                        widget: const Text('SAVE'),
                                      )
                                    ],
                                  ),
                                );
                              });
                        },
                        controller: colorController,
                        readOnly: true,
                        text: 'Color'),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomButton(
                      ontap: () {
                        setState(() {
                          categoryModel.categoryId = const Uuid().v1();
                          categoryModel.name = nameController.text;
                          categoryModel.icon = selectedCat;
                          categoryModel.color = selectedColor.value;
                        });

                        context
                            .read<CategoryBloc>()
                            .add(CreateCategoryEvent(category: categoryModel));
                      },
                      widget: isLoading
                          ? const Center(
                              child: CircularProgressIndicator.adaptive(),
                            )
                          : const Text('SAVE'),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      });
    },
  );
}
