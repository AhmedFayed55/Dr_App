import 'package:doctor_app/config/routes/router_generator.dart';
import 'package:doctor_app/doc_app.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(DocApp(
    appRouter: AppRouter(),
  ));
}

