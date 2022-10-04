import 'package:flutter/material.dart';
import 'package:provider_in_depth_wax_app/models/employee.dart';
import 'package:provider/src/provider.dart';
import 'package:provider_in_depth_wax_app/services/employee_service.dart';

import 'employee_details_screen.dart';

class EmployeesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("EMPLOYEE SCREEN BUILD");
    //Access the future provider.
    Result<List<Employee>?> empList = Provider.of<Result<List<Employee>?>>(context);
    print(empList);

    return Scaffold(
      appBar: AppBar(
        title: Text("Employees"),
        centerTitle: true,
      ),
      body: Container(
        child: empList.errorMsg != null
            ? Center(
                child: Text('Error occurred: ${empList.errorMsg}'),
              )
            : empList.data == null
                ? Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: empList.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      Employee item = empList.data![index];
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
