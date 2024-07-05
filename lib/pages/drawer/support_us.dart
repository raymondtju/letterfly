import 'package:Letterfly/components/colors.dart';
import 'package:Letterfly/components/textstylefont.dart';
import 'package:flutter/material.dart';

Future<int?> showSupportUsSheet(BuildContext context, {int initialRating = 5}) {
  final global = GlobalThemeData().lightThemeData;
  int _selectedRating = 1;

  return showModalBottomSheet<int>(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.zero,
    ),
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.4,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.06,
              ),
              child: Column(
                children: <Widget>[
                  SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'How Satisfied are you?',
                        style: headlineStyle,
                      ),
                      IconButton(
                        iconSize: 20,
                        icon: const Icon(Icons.close),
                        padding: EdgeInsets.zero,
                        constraints:
                            const BoxConstraints(minWidth: 30, minHeight: 30),
                        onPressed: () => Navigator.pop(context),
                        style: IconButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0),
                          ),
                          backgroundColor: Colors.grey[200],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: global.colorScheme.primary,
                      inactiveTrackColor:
                          global.colorScheme.primary.withOpacity(0.3),
                      trackShape: RectangularSliderTrackShape(),
                      trackHeight: 4.0,
                      thumbColor: global.colorScheme.primary,
                      thumbShape: RoundedRectangleSliderThumbShape(
                        enabledThumbRadius: 12.0,
                        borderRadius: BorderRadius.circular(0.0),
                      ),
                      overlayColor: global.colorScheme.primary.withAlpha(32),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 28.0),
                      tickMarkShape:
                          RoundSliderTickMarkShape(tickMarkRadius: 3.0),
                      activeTickMarkColor: global.colorScheme.onPrimary,
                      inactiveTickMarkColor:
                          global.colorScheme.primary.withOpacity(0.5),
                      valueIndicatorShape: PaddleSliderValueIndicatorShape(),
                      valueIndicatorColor: global.colorScheme.primary,
                      valueIndicatorTextStyle: TextStyle(
                        color: global.colorScheme.onPrimary,
                      ),
                    ),
                    child: Slider(
                      value: _selectedRating.toDouble(),
                      min: 1,
                      max: 5,
                      divisions: 4,
                      label: _selectedRating.toString(),
                      onChanged: (double value) {
                        setState(() {
                          _selectedRating = value.round();
                        });
                      },
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Very Poor", style: subtextLineStyle),
                      Text("Very Good", style: subtextLineStyle),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              _selectedRating = 1;
                            });
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.width * 0.1,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(0),
                              color: global.colorScheme.onPrimary,
                            ),
                            child: const Center(
                              child: Text("Resend", style: subheadlineStyle),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: _selectedRating == 0
                              ? null
                              : () {
                                  Navigator.of(context).pop(_selectedRating);
                                },
                          child: Container(
                            height: MediaQuery.of(context).size.width * 0.1,
                            margin: const EdgeInsets.symmetric(horizontal: 8),
                            decoration: BoxDecoration(
                              color: _selectedRating == 0
                                  ? Colors.grey
                                  : global.colorScheme.primary,
                              border: Border.all(
                                color: _selectedRating == 0
                                    ? Colors.grey
                                    : global.colorScheme.primary,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(0),
                            ),
                            child: Center(
                              child: Text(
                                "Confirm",
                                style: subheadlineStyle.copyWith(
                                  color: _selectedRating == 0
                                      ? Colors.black54
                                      : global.colorScheme.onPrimary,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}

class RoundedRectangleSliderThumbShape extends SliderComponentShape {
  final double enabledThumbRadius;
  final BorderRadius borderRadius;

  const RoundedRectangleSliderThumbShape({
    this.enabledThumbRadius = 10.0,
    this.borderRadius = const BorderRadius.all(Radius.circular(4.0)),
  });

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(enabledThumbRadius);
  }

  @override
  void paint(PaintingContext context, Offset center,
      {required Animation<double> activationAnimation,
      required Animation<double> enableAnimation,
      required bool isDiscrete,
      required TextPainter labelPainter,
      required RenderBox parentBox,
      required SliderThemeData sliderTheme,
      required TextDirection textDirection,
      required double value,
      required double textScaleFactor,
      required Size sizeWithOverflow}) {
    final Canvas canvas = context.canvas;

    final rect = Rect.fromCenter(
      center: center,
      width: enabledThumbRadius * 2,
      height: enabledThumbRadius * 2,
    );

    final paint = Paint()
      ..color = sliderTheme.thumbColor!
      ..style = PaintingStyle.fill;

    canvas.drawRRect(
      RRect.fromRectAndCorners(
        rect,
        topLeft: borderRadius.topLeft,
        topRight: borderRadius.topRight,
        bottomLeft: borderRadius.bottomLeft,
        bottomRight: borderRadius.bottomRight,
      ),
      paint,
    );
  }
}
