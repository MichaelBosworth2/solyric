import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'BaseViewModel.dart';

class BaseWidget<T extends BaseViewModel> extends StatefulWidget {
  /// Build a widget tree based on the value from a [Provider<T>].
  /// Must not be `null`.
  final Widget Function(BuildContext context, T value, Widget child) builder;
  /// Executed once view model is available on this class
  final Function(BaseWidgetController, T) onModelReady;
  /// Executed before exiting this screen
  final WillPopCallback onBackPressed;
  /// Static part of the widget tree this won't be rebuilt
  final Widget child;

  BaseWidget({
    Key key,
    this.onBackPressed,
    this.builder,
    this.child,
    this.onModelReady,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _BaseWidgetState<T>();
}

class _BaseWidgetState<T extends BaseViewModel> extends State<BaseWidget<T>> {
  final controller = BaseWidgetController();
  T model;

  @override
  void initState() {
    controller.addListener(() => setState(() => null));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    model = Provider.of<T>(context);

    if (widget.onModelReady != null) {
      widget.onModelReady(controller, model);
    }

    return WillPopScope(
      onWillPop: widget.onBackPressed,
      child: ChangeNotifierProvider<T>.value(
        value: model,
        child: Consumer<T>(
          builder: widget.builder,
          child: widget.child,
        ),
      ),
    );
  }
}

class BaseWidgetController extends ChangeNotifier {
  void refreshState() => notifyListeners();
}
