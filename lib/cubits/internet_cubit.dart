
import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum InternetStates { Initial, Lost, Gained}

class InternetCubit extends Cubit<InternetStates>{

  Connectivity _connectivity = Connectivity();
  StreamSubscription? connectivitySubscription;

  InternetCubit() : super( InternetStates.Initial){

    connectivitySubscription == _connectivity.onConnectivityChanged.listen((result) {

      if(result == ConnectivityResult.mobile || result == ConnectivityResult.wifi){
        emit(InternetStates.Gained);
      }
      else
        {
          emit(InternetStates.Lost);
        }
    });
  }

  @override
  Future<void> close() {
    connectivitySubscription?.cancel();
    return super.close();
  }
}