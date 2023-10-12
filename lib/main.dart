import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_height/bloc/get_all_data_model_bloc.dart';

import 'package:todo_height/screens/home.dart';
import 'package:todo_height/screens/izars_servis.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    IsarService().openDB();
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              GetAllDataModelBloc()..add(StartGetALlDataModelEvent()),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
