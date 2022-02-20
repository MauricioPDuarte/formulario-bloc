import 'package:flutter/material.dart';
import 'package:forms_bloc/app/app_widget.dart';
import 'package:forms_bloc/app/injection_container.dart' as di;

void main() {
  di.init();
  runApp(const AppWidget());
}
