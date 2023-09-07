import 'package:demo/modalclass.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DataController extends GetxController {
  var apiResponse = <Expense>[].obs;


  Future<void> fetchDataFromApi(String email) async {
  final url = Uri.parse("https://notaryapp-staging.herokuapp.com/customer/login");
  final requestBody = {"email": email};

  try {
    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: json.encode(requestBody),
    );

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      final responseText = json.encode(jsonResponse); // Convert response to JSON string
      print("API Response: $responseText"); // Print the API response

      final List<Expense> expenses = jsonResponse['data']['expenseList']
          .map<Expense>((expenseData) => Expense(
                expenseName: expenseData['companyName'],
                expenseAmount: expenseData['amount'],
              ))
          .toList();

      apiResponse.assign(expenses as Expense);
    } else {
      apiResponse.assign([] as Expense);
      Get.snackbar("API Error", "Failed to fetch expenses from API");
    }
  } catch (error) {
    apiResponse.assign([] as Expense);
    Get.snackbar("Network Error", "Failed to connect to the API");
  }
}

 List<Expense> filterExpenses(String searchTerm) {
    if (searchTerm.isEmpty) {
      return apiResponse;
    } else {
      searchTerm = searchTerm.toLowerCase();
      return apiResponse.where((expense) {
        final expenseName = expense.expenseName.toLowerCase();
        return expenseName.contains(searchTerm);
      }).toList();
    }
  }


  
}