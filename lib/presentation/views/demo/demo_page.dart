import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:metrics_bubble/presentation/common/metrics_widget.dart';
import 'package:metrics_bubble/presentation/values/app_styles.dart';
import 'package:metrics_bubble/presentation/views/demo/demo_view_model.dart';
import 'package:provider/provider.dart';

/// Example screen screen to demonstrate use of [MetricsWidget]
class DemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Align(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(top: 60),
          child: SizedBox(
            width: AppStyles.bubbleDiameter,
            child: ChangeNotifierProvider<DemoViewModel>(
              create: (BuildContext context) => DemoViewModel(),
              child: Consumer<DemoViewModel>(
                builder: (
                  BuildContext context,
                  DemoViewModel model,
                  Widget? child,
                ) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      // build text field to type value for "label"
                      TextField(
                        controller: model.labelTextRuController,
                        keyboardType: TextInputType.text,
                        onChanged: model.onLabelChanged,
                      ),
                      // build text field to type value for "weight"
                      TextField(
                        controller: model.weightTextRuController,
                        keyboardType: TextInputType.number,
                        maxLength: 3,
                        onChanged: model.onWeightChanged,
                        /* NOTE: according to technical assignment,
                         we limit ability to type only number between
                         0 and 350 */
                        inputFormatters: <TextInputFormatter>[
                          LengthLimitingTextInputFormatter(3),
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                          model.weightValidator,
                        ],
                      ),
                      MetricsWidget(label: model.label, weight: model.weight),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
