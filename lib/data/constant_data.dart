import 'package:expense_tracker/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

List<Map<String, dynamic>> myTransactions = [
  {
    'name': 'Food',
    'amount': '45.00',
    'date': 'Today',
    'icon': const FaIcon(
      FontAwesomeIcons.burger,
      color: whiteColor,
    ),
    'color': Colors.yellow
  },
  {
    'name': 'Shopping',
    'amount': '1105.00',
    'date': 'Today',
    'icon': const FaIcon(
      FontAwesomeIcons.bagShopping,
      color: whiteColor,
    ),
    'color': Colors.purple
  },
  {
    'name': 'Entertainment',
    'amount': '500.00',
    'date': 'yesterday',
    'icon': const FaIcon(
      FontAwesomeIcons.playstation,
      color: whiteColor,
    ),
    'color': Colors.red
  },
  {
    'name': 'Travel',
    'amount': '11000.00',
    'date': 'yesterday',
    'icon': const FaIcon(
      FontAwesomeIcons.plane,
      color: whiteColor,
    ),
    'color': Colors.green
  },
  {
    'name': 'Health',
    'amount': '500.00',
    'date': 'yesterday',
    'icon': const FaIcon(
      FontAwesomeIcons.heartCircleBolt,
      color: whiteColor,
    ),
    'color': Colors.blue
  },
];
