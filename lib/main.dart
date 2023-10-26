import 'package:checktest/blocs/internet%20bloc/internet_bloc.dart';
import 'package:checktest/cubits/internet_cubit.dart';
import 'package:checktest/screens/sign_in/bloc/sign_in_event.dart';
import 'package:checktest/screens/sign_in/bloc/sign_in_state.dart';
import 'package:checktest/screens/sign_in/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'HomeScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SignInScreen(),
      );
  }
}

