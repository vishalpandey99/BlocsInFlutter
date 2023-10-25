
import 'dart:async';

import 'package:checktest/blocs/internet%20bloc/internet_event.dart';
import 'package:checktest/blocs/internet%20bloc/internet_state.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState>{

  Connectivity _connectivity = Connectivity();
  StreamSubscription? connectivitySubscription;

    InternetBloc() : super(InternetInitialState()){
    on<InternetLostEvent>((event, emit) => emit(InternetLostState()));
    on<InternetGainedEvent>((event,emit) => emit(InternetGainedState()));

    connectivitySubscription = _connectivity.onConnectivityChanged.listen((result) {

      if(result == ConnectivityResult.mobile || result == ConnectivityResult.wifi){
        add(InternetGainedEvent());
      }
      else
        {
          add(InternetLostEvent());
        }
    });
  }

  @override
  Future<void> close() {
      connectivitySubscription?.cancel();
      return super.close();
  }
}