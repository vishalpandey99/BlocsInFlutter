

import 'package:checktest/screens/sign_in/bloc/sign_in_bloc.dart';
import 'package:checktest/screens/sign_in/bloc/sign_in_event.dart';
import 'package:checktest/screens/sign_in/bloc/sign_in_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInScreen extends StatelessWidget{

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign In With Email"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 20
          ),
          child: ListView(
            physics: BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()
            ),
            children: [
              Text("Error will show up here", style: TextStyle(color: Colors.red),),
              SizedBox(height: 10),

              TextField(
                controller: emailController,
                onChanged: (val){
                  BlocProvider.of<SignInBloc>(context).add(
                   SignInTextChangedEvent(emailController.text, passwordController.text)
                  );
                },
                decoration: InputDecoration(
                  hintText: "Email Address",
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: passwordController,
                onChanged: (val){
                  BlocProvider.of<SignInBloc>(context).add(
                    SignInTextChangedEvent(emailController.text, passwordController.text)
                  );
                },
                decoration: InputDecoration(
                  hintText: "Password"
                ),
              ),
              SizedBox(
                height: 20,
              ),

              BlocBuilder<SignInBloc, SignInState>(
                builder: (context,state){
                  return CupertinoButton(
                      onPressed: () {},
                  color: (state is SignInvalidState) ? Colors.blue
                  : Colors.grey,  
                  child: Text("Sign In"),);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}