import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:provider_in_depth_wax_app/models/employee.dart';

class EmployeeService {
  Future<List<Employee>?> fetchEmployees() async {
    http.Response response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      // print(jsonResponse.runtimeType);

      //convert the list of json(which is a list of maps in this case) to employee list.
      return (jsonResponse as List)
          .map<Employee>((json) => Employee.fromJson(json))
          .toList();
    } else {
      print(response.statusCode);
      return null;
    }
  }

  Future<Employee?> fetchEmployeeDetails(int id) async {
    http.Response response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/users/$id'));

    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      // print(jsonResponse.runtimeType);

      //convert the list of json(which is a list of maps in this case) to employee list.
      return Employee.fromJson(jsonResponse);
    } else {
      print(response.statusCode);
      return null;
    }
  }
}
