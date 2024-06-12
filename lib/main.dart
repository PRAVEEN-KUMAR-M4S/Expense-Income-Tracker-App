import 'package:expense_tracker/auth/auth_navigator.dart';
import 'package:expense_tracker/auth/bloc/authentication_bloc.dart';
import 'package:expense_tracker/auth/repository/authentication.dart';
import 'package:expense_tracker/category/bloc/create_category_bloc/category_bloc.dart';
import 'package:expense_tracker/category/bloc/get_category_bloc/get_category_bloc_bloc.dart';
import 'package:expense_tracker/category/repository/category_repo.dart';
import 'package:expense_tracker/constants/constants.dart';
import 'package:expense_tracker/expense/create_expense_bloc/create_expense_bloc.dart';
import 'package:expense_tracker/expense/get_expense_bloc/get_expense_bloc.dart';
import 'package:expense_tracker/expense/repository/expense_repo.dart';
import 'package:expense_tracker/firebase_options.dart';
import 'package:expense_tracker/home/bloc/fetch_data_bloc.dart';
import 'package:expense_tracker/home/repository/fetch_user.dart';
import 'package:expense_tracker/home/view/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => AuthService(),
        ),
        RepositoryProvider(create: (context) => FetchUserDataService()),
        RepositoryProvider(create: (context) => CategoryRepo()),
        RepositoryProvider(create: (context) => ExpenseRepo()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => CategoryBloc(context.read<CategoryRepo>())),
          BlocProvider(
            create: (context) =>
                AuthenticationBloc(context.read<AuthService>()),
          ),
          BlocProvider(
              create: (context) =>
                  FetchDataBloc(context.read<FetchUserDataService>())),
          BlocProvider(
              create: (context) =>
                  GetCategoryBlocBloc(context.read<CategoryRepo>())),
          BlocProvider(
              create: (context) =>
                  CreateExpenseBloc(context.read<ExpenseRepo>())),
          BlocProvider(
              create: (context) => GetExpenseBloc(context.read<ExpenseRepo>()))
        ],
        child: MaterialApp(
          title: 'Flutter Expense Tracker',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.light(
              primary: primaryColor,
              secondary: secondaryColor,
              tertiary: tertiaryColor,
              outline: Colors.grey.shade500,
              background: Colors.grey.shade200,
            ),
          ),
          home: const AuthNavigator(),
          routes: {
            'home-screen': (context) => const HomeScreen(),
          },
        ),
      ),
    );
  }
}
