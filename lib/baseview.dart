import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/locator.dart';

class BaseView<T extends ChangeNotifier> extends StatefulWidget {
  final Widget Function(BuildContext context, T model, Widget? child) builder;

  final Function(T)? onModelReady;

  BaseView({required this.builder, this.onModelReady});

  @override
  _BaseViewState<T> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends ChangeNotifier> extends State<BaseView<T>> {
  final T _model = locator<T>();

  @override
  void initState() {
    if (widget.onModelReady != null) {
      widget.onModelReady!(_model);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
        create: (context) => _model,
        child: Consumer<T>(builder: widget.builder));
  }
}
