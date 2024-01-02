import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/app/booklify.dart';
import 'core/utils/service_locator/service_locator.dart';
import 'my_observer.dart';

void main() {
  ServiceLocator().setup();
  Bloc.observer = SimpleBlocObserver();
  runApp(const BooklifyApp());
}
