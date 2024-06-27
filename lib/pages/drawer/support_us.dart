import 'package:Letterfly/components/colors.dart';
import 'package:Letterfly/components/textstylefont.dart';
import 'package:flutter/material.dart';

Future<int?> showSupportUsSheet(BuildContext context, {int initialRating = 5}) {
  final global = GlobalThemeData().lightThemeData;
  int _selectedRating = 0;

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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(5, (index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedRating = index + 1;
                          });
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.14,
                          height: MediaQuery.of(context).size.width * 0.14,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            color: index + 1 == _selectedRating
                                ? global.colorScheme.primary
                                : global.colorScheme.onPrimary,
                          ),
                          child: Center(
                            child: Text('${index + 1}',
                                style: textlineStyle.copyWith(
                                  color: index + 1 == _selectedRating
                                      ? global.colorScheme.onPrimary
                                      : global.colorScheme.primary,
                                )),
                          ),
                        ),
                      );
                    }),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Very Poor", style: subtextLineStyle),
                        Text("Very Good", style: subtextLineStyle),
                      ]),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              _selectedRating = 0;
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
