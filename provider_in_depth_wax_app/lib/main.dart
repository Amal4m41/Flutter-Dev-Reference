import 'package:flutter/material.dart';
import 'package:provider_in_depth_wax_app/models/employee.dart';
import 'package:provider_in_depth_wax_app/providers/settings_provider.dart';
import 'package:provider_in_depth_wax_app/screens/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:provider_in_depth_wax_app/services/employee_service.dart';
import 'package:provider_in_depth_wax_app/services/firestore_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'models/report.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _fireStoreService = FirestoreService();
  final _employeeService = EmployeeService();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) => SettingsProvider(),
          lazy: true,
        ),
        StreamProvider<List<Report>>(
          create: (BuildContext context) => _fireStoreService.getReports(),
          lazy: true,
          initialData: [
            Report(
              temp: 1,
              wax: 'Swix',
              line: 'Red',
              timeStamp: DateTime.now().toIso8601String(),
            ),
          ],
        ),
        FutureProvider<Result<List<Employee>?>>(
          create: (BuildContext context) => _employeeService.fetchEmployees(),
          initialData: Result(data: null),
          lazy: false,
          catchError: (context, error) {
            print(error.toString());
            return Result(data: null, errorMsg: 'Error here : $error');
          },
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
        ),
        home: HomeScreen(title: 'Wax App'),
      ),
    );
  }
}
