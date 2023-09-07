import 'package:demo/model/expensemodel.dart';
import 'package:flutter/material.dart';
import 'package:demo/api/fetchdata.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  final TextEditingController search = TextEditingController();
  Home({super.key});

  @override
  Widget build(BuildContext context) {
    final data = Get.find<DataController>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade800,
        title: const Text('Expenses List',style: TextStyle(color: Colors.white),),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: TextField(
              controller: search,
              onChanged: (value) {
                data.apiResponse.assign(data.filterExpenses(value) as Expense);
              },
              decoration: InputDecoration(
                hintText: 'Search Expenses',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
              ),
            ),
          ),
          Expanded(
            child: Obx(() {
              final filteredExpenses = data.apiResponse;

              if (filteredExpenses.isEmpty) {
                return const Center(child: Text('No expenses found.'));
              }

              return ListView.builder(
                itemCount: filteredExpenses.length,
                itemBuilder: (context, index) {
                  final expense = filteredExpenses[index];
                  return ListTile(
                    title: Text(expense.expenseName),
                    subtitle: Text(
                        'Amount: \$${expense.expenseAmount.toStringAsFixed(2)}'),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
