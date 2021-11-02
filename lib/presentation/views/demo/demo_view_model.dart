import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:metrics_bubble/presentation/common/metrics_widget.dart';

/// business logic component of the demo project
class DemoViewModel extends ChangeNotifier {
  final TextEditingController _labelTextRuController = TextEditingController()
    ..text = 'Core';

  /// controller of the label [TextField] with default value,
  /// which is controlling text changes in [TextField].
  TextEditingController get labelTextRuController => _labelTextRuController;

  final TextEditingController _weightTextRuController = TextEditingController()
    ..text = '123';

  /// controller of the label [TextField] with default value,
  /// which is controlling text changes in [TextField].
  TextEditingController get weightTextRuController => _weightTextRuController;

  final TextInputFormatter _weightValidator = TextInputFormatter.withFunction((
      TextEditingValue oldValue,
      TextEditingValue newValue,
      ) {
    final String text = newValue.text;
    if (text.isNotEmpty) {
      final int? value = int.tryParse(text);
      if (value != null && value >= 0 && value <= 350) {
        return newValue;
      }
    } else {
      return newValue;
    }
    return oldValue;
  });

  /// controls weight input to be valid according to technical assignment,
  /// so it would be an [int] between 0 && 350
  TextInputFormatter get weightValidator => _weightValidator;

  String _label = 'Core';

  /// argument of the [MetricsWidget]'s label parameter
  String get label => _label;

  int _weight = 123;

  /// argument of the [MetricsWidget]'s weight parameter
  int get weight => _weight;

  /// this method called from [TextField], which is responsible for the
  /// "label" value in [MetricsWidget].
  /// By changing the value [notifyListeners] is called and updates the
  /// [label] value.
  void onLabelChanged(String value) {
    _label = value.trim();
    notifyListeners();
  }

  /// this method called from [TextField], which is responsible for the
  /// "weight" value in [MetricsWidget].
  /// By changing the value [notifyListeners] is called and updates the
  /// [weight] value.
  void onWeightChanged(String value) {
    _weight = int.tryParse(value.trim()) ?? 0;
    notifyListeners();
  }

  @override
  void dispose() {
    labelTextRuController.dispose();
    weightTextRuController.dispose();
    super.dispose();
  }
}
