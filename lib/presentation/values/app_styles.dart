import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:metrics_bubble/presentation/common/metrics_widget.dart';

/// Util class containing commonly used [Widget] styles
class AppStyles {
  /// diameter of the [MetricsWidget]
  static const double bubbleDiameter = 272.0;

  /// decoration of the [MetricsWidget]
  static const BoxDecoration bubbleBoxDecoration = BoxDecoration(
    color: Color(0xff53a99a),
    shape: BoxShape.circle,
    boxShadow: <BoxShadow>[
      BoxShadow(
        offset: Offset(0, 27),
        blurRadius: 33,
        color: Color(0x3827ae96),
      )
    ],
  );

  // START: [TextStyle]s

  /// custom [TextStyle] of the label in [MetricsWidget]
  static const TextStyle labelTextStyle = TextStyle(
    fontFamily: 'Helvetica',
    fontWeight: FontWeight.bold,
    fontSize: 19,
    color: Colors.white,
  );

  /// custom [TextStyle] of the [String] variable responsible for the weight
  /// in [MetricsWidget]
  static const TextStyle weightTextStyle = TextStyle(
    fontFamily: 'League Gothic',
    fontSize: 127,
    color: Colors.white,
  );

  /// custom [TextStyle] of the [String] variable
  /// responsible for the weight unit in [MetricsWidget]
  static const TextStyle unitTextStyle = TextStyle(
    fontFamily: 'League Gothic',
    fontSize: 38,
    color: Color(0x80ffffff),
  );
// END: [TextStyle]s
}
