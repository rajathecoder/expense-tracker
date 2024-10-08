import 'package:flutter/material.dart';

import '../services/notification.dart';

class BudgetProvider with ChangeNotifier {
  double _budget = 0.0;
  final double maxBudget = 20000;
  final double notificationLimit = 15000;
  final NotificationService _notificationService;

  BudgetProvider(this._notificationService);

  double get budget => _budget;

  void updateBudget(double value) {
    _budget = value;
    notifyListeners();

    if (_budget > notificationLimit) {
      _notificationService.showNotification(
        'Budget Warning',
        'You have spent more than 15k',
      );
    }
  }

  void notifyPayment() {
    _notificationService.showNotification(
      'Payment Successful',
      'Your payment have sent successful',
    );
  }
}
