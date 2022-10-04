import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:provider_in_depth_wax_app/models/employee.dart';
import 'package:provider_in_depth_wax_app/models/report.dart';
import 'package:date_format/date_format.dart';
import 'package:provider_in_depth_wax_app/providers/settings_provider.dart';
import 'package:provider_in_depth_wax_app/screens/settings_screen.dart';
import 'package:provider_in_depth_wax_app/services/employee_service.dart';
import 'package:provider_in_depth_wax_app/services/firestore_service.dart';

import 'employees_screen.dart';

class HomeScreen extends StatelessWidget {
  final String title;
  HomeScreen({required this.title});

  @override
  Widget build(BuildContext context) {
    print("HOMESCREEN BUILD");
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              navigateTo(context, EmployeesScreen());
            },
            icon: Icon(Icons.supervised_user_circle),
          ),
          IconButton(
            onPressed: () {
              navigateTo(context, SettingsScreen());
            },
            icon: Icon(Icons.settings),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          try {
            await FirestoreService().addReport();
          } catch (e) {
            print("ERROR : $e");
          }
        },
        // onPressed: () async {
        //   var result = await EmployeeService().fetchEmployees();
        //   print(result);
        // },
      ),
      body: Container(
        // child: Center(
        // //will only update/rebuild (the nearest build method) this widget if this specific value CHANGES.
        // child: Text(context.select((SettingsProvider value) => value.units)),
        // ),
        child: ListViewReport(),
        // child: Column(
        //   children: [
        //     Container(
        //       child: ListViewReport(),
        //       height: MediaQuery.of(context).size.height - 200,
        //       width: MediaQuery.of(context).size.width,
        //     ),
        //     Container(
        //       child: ListViewEmployee(),
        //       height: 110,
        //       width: MediaQuery.of(context).size.width,
        //     ),
        //   ],
        // ),
      ),
    );
  }
}

//This listview report does a similar job to that of a streambuilder given that now we can access the same stream value,
//for any children of the MyApp widget.
class ListViewReport extends StatelessWidget {
  const ListViewReport({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("LIST VIEW WIDGET BUILD");
    List<String> waxLine = context.watch<SettingsProvider>().waxLines;
    String units = context.watch<SettingsProvider>().units;
    List<Report> reports = Provider.of<List<Report>>(context, listen: true);
    print(reports);
    reports = reports.where((report) => waxLine.contains(report.wax)).toList();
    print("AFTER FILTERING : $reports");
    return ListView.builder(
      itemCount: reports.length,
      itemBuilder: (BuildContext context, int index) {
        Report item = reports[index];
        return ListTile(
          leading: units == "Metric"
              ? Text(item.temp.toString() + '\u00B0')
              : Text(((item.temp) * (9 / 5) + 32).toStringAsFixed(1) + '\u00B0'),
          title: Text(item.wax),
          subtitle: Text(item.line),
          trailing: Text(formatDate(DateTime.parse(item.timeStamp), [h, ':', nn, ' ', am])),
        );
      },
    );
  }
}

// class ListViewEmployee extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     //Access the future provider.
//     List<Employee>? empList = Provider.of<List<Employee>?>(context);
//
//     return Scaffold(
//       appBar: AppBar(),
//       body: Container(
//         child: empList == null
//             ? Center(child: CircularProgressIndicator())
//             : ListView.builder(
//                 scrollDirection: Axis.horizontal,
//                 itemCount: empList.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   Employee item = empList[index];
//                   return ListTile(
//                     leading: Text(item.id.toString()),
//                     title: Text(item.name),
//                     subtitle: Text(item.email),
//                     trailing: Text(item.phone),
//                   );
//                 },
//               ),
//       ),
//     );
//   }
// }

void navigateTo(BuildContext contextValue, Widget widget) {
  Navigator.push(
    contextValue,
    MaterialPageRoute(
      builder: (context) => widget,
    ),
  );
}
