

import 'package:employeenetwork/Data/Model/Remote/Apis/dio/di_container.dart' as di;
import 'package:employeenetwork/provider/auth_provider.dart';
import 'package:employeenetwork/view/screen/employeeNetwork.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Data/Model/Remote/Apis/dio/di_container.dart';

Future <void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();


  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider.value(
        value: AuthProvider(authRepo: sl()),
      ),
    ],
     child:
     MyApp()
  )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          inputDecorationTheme: const InputDecorationTheme(
            hintStyle: TextStyle(color: Colors.black38),
          enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: Colors.black38),
    ),
    focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(width: 1, color: Colors.black),)
          ),
      ),
      home: const EmployeeNetwork()
    );
  }
}


