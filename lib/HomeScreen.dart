import 'package:checktest/blocs/internet%20bloc/internet_bloc.dart';
import 'package:checktest/cubits/internet_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/internet bloc/internet_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: BlocConsumer<InternetCubit, InternetStates>(
            listener: (context, state){

              if(state == InternetStates.Gained){
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Internet Connected"),
                  backgroundColor: Colors.green,),
                );
              }
              else if(state == InternetStates.Lost){
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Inetrnet not Connected"),
                  backgroundColor: Colors.red,)
                );
              }
            },
            builder: (context, state){
                  if(state == InternetStates.Gained){
                    return Text("Connected");
                  }
                  else if(state == InternetStates.Lost){
                    return Text("Not Connected");
                  }
                  else
                    {
                      return Text("Loding......");
                    }
            },
          ),
          // child: BlocBuilder<InternetBloc, InternetState>(
          //   builder: (context, state){
          //
          //     if(state is InternetGainedState){
          //       return Text("Connected");
          //     }
          //     else if(state is InternetLostState){
          //       return Text("Not Connected");
          //     }
          //     else
          //       {
          //         return Text("Loding......");
          //       }
          //   },
          //
          // )
        ),
      ),
    );
  }
}
