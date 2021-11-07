import 'dart:io';

import 'package:assignment2/controllers/register_state.dart';
import 'package:assignment2/pages/homepage.dart';
import 'package:assignment2/pages/login.dart';
import 'package:assignment2/pages/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'controllers/login_state.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: await getApplicationDocumentsDirectory());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RegisterCubit>(
            create: (BuildContext context) => RegisterCubit(null)),
        BlocProvider<LoginCubit>(create: (BuildContext context) => LoginCubit())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: RegisterPage(),
        routes: {
          LoginPage.routename: (context) => LoginPage(),
          HomePage.routename: (context) => HomePage()
        },
      ),
    );
  }
}
