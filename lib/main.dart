import 'package:expanse_tracker/provider/budgetprovider.dart';
import 'package:expanse_tracker/screen/homescreen/homescreen.dart';
import 'package:expanse_tracker/services/notification.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final notificationService = NotificationService();
  await notificationService.init();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => BudgetProvider(notificationService),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Budget Slider App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Homescreen(),
    );
  }
}

