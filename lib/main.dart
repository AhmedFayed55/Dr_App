import 'package:doctor_app/config/routes/router_generator.dart';
import 'package:doctor_app/doc_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/di/di.dart';
import 'core/helpers/bloc_observer.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  configureDependencies();
  runApp(DocApp(
    appRouter: AppRouter(),
  ));
}

