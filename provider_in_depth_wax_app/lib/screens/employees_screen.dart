import 'package:flutter/material.dart';
import 'package:provider_in_depth_wax_app/models/employee.dart';
import 'package:provider/src/provider.dart';
import 'package:provider_in_depth_wax_app/services/employee_service.dart';

import 'employee_details_screen.dart';

class EmployeesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Access the future provider.
    List<Employee>? empList = Provider.of<List<Employee>?>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Employees"),
        centerTitle: true,
      ),
      body: Container(
        child: empList == null
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: empList.length,
                itemBuilder: (BuildContext context, int index) {
                  Employee item = empList[index];
                  return ListTile(
                    leading: Text(item.id.toString()),
                    title: Text(item.name),
                    subtitle: Text(item.email),
                    trailing: Text(item.phone),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EmployeeDetailsScreen(
                                    id: item.id,
                                    name: item.name,
                                  )));
                    },
                  );
                },
              ),
      ),
    );
  }
}
