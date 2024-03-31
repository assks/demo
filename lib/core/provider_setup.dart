
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'services/api.dart';
import 'services/authenticationservice.dart';

List<SingleChildWidget> providers = [
  ...independentServices,
  ...dependentServices,
];
List<SingleChildWidget> independentServices = [Provider.value(value: Api())];
List<SingleChildWidget> dependentServices = [ProxyProvider<Api, AuthenticationService>(update: (context, api, authenticationService) => AuthenticationService(api: api),)];










