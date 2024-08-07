
import 'package:almanar_application/almanar_client_app.dart';
import 'package:almanar_application/config/di/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'config/observer/bloc_observer.dart';
import 'config/routes/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();
  await setupGetIt();
  runApp(AlmanarApp(appRouter: AppRouter()));
}
