import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/router/app_router.dart';
import '../domain/bloc/splash_bloc.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    BlocProvider.of<SplashBloc>(context).add(
      const SplashEvent.requestConnection(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SplashBloc, SplashState>(
      listener: _buildSplashBlocListener,
      builder: (context, state) => _buildSplashWidget(context),
    );
  }

  void _buildSplashBlocListener(BuildContext context, SplashState state) {
    state.maybeWhen(
      connected: _handleConnectedState,
      notConnected: _handleNotConnectedState,
      orElse: () {},
    );
    //
  }

  void _handleConnectedState() {
    AutoRouter.of(context).replace(HomePageRoute());
  }

  void _handleNotConnectedState() {
    // TODO: Create Network Dialog
  }

  Widget _buildSplashWidget(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          child: const Text('Hello!'),
        ),
      ),
    );
  }
}
