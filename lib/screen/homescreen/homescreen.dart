import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/budgetprovider.dart';

class Homescreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final budgetProvider = Provider.of<BudgetProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Budget Slider'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                budgetProvider.updateBudget(budgetProvider.budget);
                _showPaymentBottomSheet(context);
              },
              child: Text('Proceed to Pay'),
            ),
            SizedBox(height: 20),
            Text(
              'Set Your Budget: ${budgetProvider.budget.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 20),
            ),
            Slider(
              min: 0,
              max: budgetProvider.maxBudget,
              divisions: (budgetProvider.maxBudget / 1000).toInt(),
              value: budgetProvider.budget,
              label: '${budgetProvider.budget.toStringAsFixed(2)}',
              onChanged: (value) {
                budgetProvider.updateBudget(value);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showPaymentBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.only(left: 75,right: 75,top: 10, bottom: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Confirm Payment',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  Provider.of<BudgetProvider>(context, listen: false)
                      .notifyPayment();
                },
                child: Text('Pay Now'),
              ),
            ],
          ),
        );
      },
    );
  }
}
