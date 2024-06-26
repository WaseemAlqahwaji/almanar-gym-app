
import 'package:almanar_application/almanar_client_app.dart';
import 'package:almanar_application/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'config/observer/bloc_observer.dart';
import 'config/routes/app_router.dart';

void main() async {
  Bloc.observer = MyBlocObserver();
  await configureInjection();
  runApp(AlmanarApp(appRouter: AppRouter()));
}
