import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import './view/transaction_screen.dart';
import './view/add_bank_screen.dart';
import 'package:provider/provider.dart';

import './provider/transaction_provider.dart';
import './provider/bank_provider.dart';

import './view/home_screen.dart';
import './view/res/values/dimens.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => BankProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => TransActionProvider(),
        )
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            textTheme: TextTheme(
              bodyText1: TextStyle(
                color: Colors.black,
                fontSize: MDimens.textM,
              ),
            ),
          ),
          home: HomeScreen(),
          routes: {
            TransactionScreen.routeName: (ctx) => TransactionScreen(),
            AddBankScreen.routeName: (ctx) => AddBankScreen(),
          }),
    ),
  );
}
