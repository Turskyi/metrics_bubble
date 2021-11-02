import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart' show SvgPicture;
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:metrics_bubble/presentation/values/app_styles.dart';

///The widget is comprised of the following pieces:
///
/// - Label, STRING (ex: "Upper Body" or "Core")
/// - Weight, INTEGER (between 0 and 350)
/// - Unit (always "lbs")
/// - Background circle with graph
class MetricsWidget extends StatelessWidget {
  /// constructor with custom parameters of the [MetricsWidget] class
  const MetricsWidget({
    required this.label,
    required this.weight,
    this.unit = 'lbs',
  }) : assert(weight >= 0 && weight <= 350);

  /// [String] [Text] label
  final String label;

  /// [int] variable responsible of the number
  final int weight;

  /// [String] [Text] variable responsible for the unit of the weight
  final String unit;

  @override
  Widget build(BuildContext context) {
    /* NOTE: it is generally better to avoid using [Stack] widget,
     * to improve performance,
     * since painting extra layer takes a little bit more time,
     * for this reason we use [Svg] provider from flutter_svg_provider package,
     * to place it as a [Container] background directly.
     * However for some reason [Svg] provider does not appear
     * on Android platform,
     * so for that case we use regular [Stack] and [SvgPicture] on top */
    if (kIsWeb) {
      return _buildWebVersion();
    } else {
      return _buildMobileVersion();
    }
  }

  /* NOTE: to create really responsive design for web version,
  * it is better to have different [bubbleDiameter] to change it
  * depending on width and height of the screen */
  Widget _buildWebVersion() {
    return Container(
      height: AppStyles.bubbleDiameter,
      width: AppStyles.bubbleDiameter,
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.only(bottom: 32),
      decoration: AppStyles.bubbleBoxDecoration.copyWith(
        image: const DecorationImage(
          alignment: Alignment.topCenter,
          fit: BoxFit.fitWidth,
          image: Svg(
            'assets/images/graph.svg',
            color: Color(0xffffffff),
            size: Size(
              AppStyles.bubbleDiameter,
              AppStyles.bubbleDiameter * 1.75,
            ),
          ),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          SizedBox(
            width: AppStyles.bubbleDiameter / 1.8,
            child: Text(
              label,
              style: AppStyles.labelTextStyle,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          /* NOTE: font has default vertical paddings which are bigger than
        * required by design, to cut bottom padding we use [SizedBox] height,
        * and [TextStyle] height to cut top padding */
          SizedBox(
            height: 124,
            child: Text(
              '$weight',
              style: AppStyles.weightTextStyle.copyWith(height: 1.15),
            ),
          ),
          Text(unit, style: AppStyles.unitTextStyle),
        ],
      ),
    );
  }

  Widget _buildMobileVersion() {
    return Stack(
      children: <Widget>[
        Container(
          height: AppStyles.bubbleDiameter,
          width: AppStyles.bubbleDiameter,
          margin: const EdgeInsets.all(8),
          padding: const EdgeInsets.only(bottom: 32),
          decoration: AppStyles.bubbleBoxDecoration,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              SizedBox(
                width: AppStyles.bubbleDiameter / 1.8,
                child: Text(
                  label,
                  style: AppStyles.labelTextStyle,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              /* NOTE: font has default vertical paddings which are bigger than
            * required by design, to cut bottom padding we use [SizedBox] height,
            * and [TextStyle] height to cut top padding */
              SizedBox(
                height: 124,
                child: Text(
                  '$weight',
                  style: AppStyles.weightTextStyle.copyWith(height: 1.15),
                ),
              ),
              Text(unit, style: AppStyles.unitTextStyle),
            ],
          ),
        ),
        SvgPicture.asset(
          'assets/images/graph.svg',
          color: const Color(0xffffffff),
          width: AppStyles.bubbleDiameter,
          height: AppStyles.bubbleDiameter * 1.75,
        )
      ],
    );
  }
}
