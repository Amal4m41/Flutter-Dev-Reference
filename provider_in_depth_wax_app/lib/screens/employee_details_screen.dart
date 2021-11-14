import 'package:flutter/material.dart';
import 'package:provider/src/async_provider.dart';
import 'package:provider/src/consumer.dart';
import 'package:provider_in_depth_wax_app/models/employee.dart';
import 'package:provider_in_depth_wax_app/services/employee_service.dart';

class EmployeeDetailsScreen extends StatelessWidget {
  final int id;
  final String name;
  final EmployeeService _employeeService = EmployeeService();

  EmployeeDetailsScreen({
    required this.id,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        centerTitle: true,
      ),
      body: FutureProvider<Employee?>(
        create: (context) => _employeeService.fetchEmployeeDetails(id),
        initialData: null,
        child: Consumer<Employee?>(
          builder: (context, employee, widget) {
            return Center(
                child: employee == null
                    ? CircularProgressIndicator()
                    : Text('Phone Number : ${employee.phone}'));
          },
        ),
      ),
    );
  }
}
