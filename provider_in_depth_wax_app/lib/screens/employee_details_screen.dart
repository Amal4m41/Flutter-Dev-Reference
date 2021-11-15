import 'package:flutter/material.dart';
import 'package:provider/src/async_provider.dart';
import 'package:provider/src/consumer.dart';
import 'package:provider/src/provider.dart';
import 'package:provider_in_depth_wax_app/models/employee.dart';
import 'package:provider_in_depth_wax_app/models/report.dart';
import 'package:provider_in_depth_wax_app/services/employee_service.dart';
import 'package:provider_in_depth_wax_app/services/firestore_service.dart';

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
    print("EMPOYEE DETAILS SCREEN BUILD");
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        centerTitle: true,
      ),
      body: FutureProvider<Employee?>(
        create: (context) => _employeeService.fetchEmployeeDetails(id),
        initialData: null,
        child: Consumer<Employee?>(
          //wrapping up with a consumer so that it get's a context with the provider accessible
          builder: (context, employee, widget) {
            print("EMPOYEE DETAILS SCREEN CONSUMER BUILD");
            return Column(
              children: [
                employee == null
                    ? CircularProgressIndicator()
                    : Text('Phone Number : ${employee.phone}'),
                Expanded(
                  child: ListView.builder(
                    itemCount:
                        Provider.of<List<Employee>>(context, listen: true)
                            .length,
                    itemBuilder: (context, int index) {
                      List<Employee> employee =
                          Provider.of<List<Employee>>(context, listen: true);
                      print('Reports value here : $employee');
                      return ListTile(
                        title: Text(employee[index].name),
                      );
                    },
                  ),
                ),
                // Expanded(
                //   // child: ListView.builder(
                //   //   itemCount: (Provider.of<List<Report>>(context, listen: true)
                //   //           as List<Report>)
                //   //       .length,
                //   //   itemBuilder: (context, int index) {
                //   //     List<Report> reports =
                //   //         Provider.of<List<Report>>(context, listen: true);
                //   //     print('Reports value here : $reports');
                //   //     return ListTile(
                //   //       title: Text(reports[index].temp.toString()),
                //   //     );
                //   //   },
                //   // ),
                //   child: StreamBuilder<List<Report>>(
                //     stream: FirestoreService().getReports(),
                //     builder: (BuildContext context, snapshot) {
                //       return snapshot.hasData
                //           ? ListTile(
                //               title: Text(snapshot.data![0].temp.toString()),
                //             )
                //           : CircularProgressIndicator();
                //     },
                //   ),
                // ),
                // Expanded(
                //   child: StreamBuilder<List<Report>>(
                //     stream: FirestoreService().getReports(),
                //     builder: (BuildContext context, snapshot) {
                //       return snapshot.hasData
                //           ? ListTile(
                //               title: Text(snapshot.data![0].temp.toString()),
                //             )
                //           : CircularProgressIndicator();
                //     },
                //   ),
                // )
              ],
            );
          },
        ),
      ),
    );
  }
}
