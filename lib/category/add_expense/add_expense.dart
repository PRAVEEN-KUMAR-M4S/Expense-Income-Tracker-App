import 'package:expense_tracker/category/bloc/get_category_bloc/get_category_bloc_bloc.dart';
import 'package:expense_tracker/category/widgets/category_creatation.dart';
import 'package:expense_tracker/constants/constants.dart';
import 'package:expense_tracker/constants/custom_button.dart';
import 'package:expense_tracker/expense/create_expense_bloc/create_expense_bloc.dart';
import 'package:expense_tracker/models/category_model.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

class AddExpense extends StatefulWidget {
  final UserModel userModel;
  const AddExpense({super.key, required this.userModel});

  @override
  State<AddExpense> createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  String selectedCat = '';
  Color selectedColor = whiteColor;

  TextEditingController expenseController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController iconController = TextEditingController();
  TextEditingController colorController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  bool isLoading = false;

  late ExpenseModel expenseModel;

  @override
  void dispose() {
    expenseController.dispose();
    categoryController.dispose();
    dateController.dispose();
    nameController.dispose();
    iconController.dispose();
    colorController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    dateController.text =
        DateFormat('dd/MM/yy').format(DateTime.now()).toString();
    context.read<GetCategoryBlocBloc>().add(GetCategoryEvent());
    expenseModel = ExpenseModel.empty;
    expenseModel.expenseId = const Uuid().v1();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          'Expense',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: BlocListener<CreateExpenseBloc, CreateExpenseState>(
        listener: (context, state) {
          if (state is CreateExpenseSuccessState) {
            Navigator.pop(context, expenseModel);
          } else if (state is CreateExpenseLoadingState) {
            setState(() {
              isLoading = true;
            });
          }
        },
        child: BlocBuilder<GetCategoryBlocBloc, GetCategoryBlocState>(
          builder: (context, state) {
            if (state is GetCategoryBlocSuccessState) {
              return Padding(
                padding: const EdgeInsets.only(right: 25, left: 25, top: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: TextFormField(
                          keyboardType: TextInputType.number,
                            controller: expenseController,
                            textAlignVertical: TextAlignVertical.center,
                            decoration: InputDecoration(
                                contentPadding:
                                    const EdgeInsets.symmetric(vertical: 25),
                                hintText: '0',
                                fillColor: whiteColor,
                                filled: true,
                                prefixIcon: const Icon(
                                  FontAwesomeIcons.indianRupeeSign,
                                  size: 18,
                                  color: Colors.grey,
                                ),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(30))),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.none,
                          readOnly: true,
                          onTap: () {},
                          controller: categoryController,
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.symmetric(vertical: 20),
                              hintText: 'Category',
                              fillColor:
                                  expenseModel.category == CategoryModel.empty
                                      ? whiteColor
                                      : Color(expenseModel.category.color),
                              filled: true,
                              suffixIcon: IconButton(
                                  onPressed: () async {
                                    var category = await getCategoryCreation(
                                        context,
                                        nameController,
                                        iconController,
                                        colorController);
              
                                    setState(() {
                                      state.categories.insert(0, category);
                                    });
                                  },
                                  icon: const Icon(
                                    Icons.add,
                                    color: Colors.grey,
                                  )),
                              prefixIcon:
                                  expenseModel.category == CategoryModel.empty
                                      ? const Icon(
                                          FontAwesomeIcons.box,
                                          size: 18,
                                          color: Colors.grey,
                                        )
                                      : Image.asset(
                                          'assets/${expenseModel.category.icon}.png',
                                          scale: 2,
                                        ),
                              border: const OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(15)))),
                        ),
                        Container(
                          height: 200,
                          width: MediaQuery.of(context).size.width,
                          decoration: const BoxDecoration(
                              color: whiteColor,
                              borderRadius: BorderRadius.vertical(
                                  bottom: Radius.circular(15))),
                          child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListView.builder(
                                  itemCount: state.categories.length,
                                  itemBuilder: (context, index) {
                                    return Card(
                                        child: ListTile(
                                      onTap: () {
                                        setState(() {
                                          expenseModel.category =
                                              state.categories[index];
                                          categoryController.text =
                                              expenseModel.category.name;
                                        });
                                      },
                                      leading: Image.asset(
                                        'assets/${state.categories[index].icon}.png',
                                        scale: 2,
                                      ),
                                      title: Text(state.categories[index].name),
                                      tileColor:
                                          Color(state.categories[index].color),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                    ));
                                  })),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: dateController,
                          readOnly: true,
                          onTap: () async {
                            DateTime? newDate = await showDatePicker(
                                context: context,
                                initialDate: selectedDate,
                                firstDate: DateTime(DateTime.january),
                                lastDate: DateTime.now()
                                    .add(const Duration(days: 365)));
              
                            if (newDate != null) {
                              setState(() {
                                dateController.text = DateFormat('dd/MM/yy')
                                    .format(newDate)
                                    .toString();
                                selectedDate = newDate;
                                expenseModel.dateTime = newDate;
                              });
                            }
                          },
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.symmetric(vertical: 20),
                              hintText: 'Date',
                              fillColor: whiteColor,
                              filled: true,
                              prefixIcon: const Icon(
                                FontAwesomeIcons.calendar,
                                size: 18,
                                color: Colors.grey,
                              ),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(15))),
                        ),
                      ],
                    ),
                    Padding(
                        padding: const EdgeInsets.only(
                            left: 20, bottom: 30, right: 20),
                        child: CustomButton(
                          ontap: () {
                            double newExpense = widget.userModel.expense;
                            double newIncome = widget.userModel.income;
                            double newBalance = widget.userModel.totalBalance;
              
                            setState(() {
                              expenseModel.amount =
                                  double.parse(expenseController.text);
              
                              if (expenseModel.category.name.toLowerCase() ==
                                  'income') {
                                newIncome = widget.userModel.income +
                                    expenseModel.amount;
                              } else {
                                newExpense = expenseModel.amount +
                                    widget.userModel.expense;
                              }
                              newBalance = newIncome - newExpense;
                            });
                            context.read<CreateExpenseBloc>().add(CreateExpense(
                                expenseModel: expenseModel,
                                newExpense: newExpense, newIncome: newIncome, newBalance:newBalance));
                          },
                          widget: isLoading
                              ? const CircularProgressIndicator.adaptive()
                              : const Text('SAVE'),
                        )),
                  ],
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            }
          },
        ),
      ),
    );
  }
}
