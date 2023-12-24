import 'package:flutter/material.dart';

import 'core/app/booklify.dart';
import 'core/utils/service_locator/service_locator.dart';

void main() {
  ServiceLocator().setup();
  runApp(const BooklifyApp());
}
