import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../helper/connectivity/connectivity_helper.dart';

part 'splash_bloc.freezed.dart';
part 'splash_event.dart';
part 'splash_state.dart';

@injectable
class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final ConnectivityHelper _connectivityHelper;

  SplashBloc({
    required ConnectivityHelper connectivityHelper,
  })  : _connectivityHelper = connectivityHelper,
        super(_Initial()) {
    on<SplashEvent>(
      (event, emit) => event.when(
        requestConnection: () => _handleRequestConnection(emit),
      ),
    );
  }

  FutureOr<void> _handleRequestConnection(Emitter<SplashState> emit) async {
    emit(const SplashState.loading());
    // await Future.delayed(Duration(seconds: 3)); // TODO: To be remove.
    var isConnected = await _connectivityHelper.checkConnectivity();

    if (!isConnected) return emit(const SplashState.notConnected());

    emit(const SplashState.connected());
  }
}
