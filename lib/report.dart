import 'package:Letterfly/components/colors.dart';
import 'package:Letterfly/components/textstylefont.dart';
import 'package:Letterfly/utils/styles.dart';
import 'package:flutter/material.dart';

const List<String> list = <String>[
  'Main Home',
  'Main Home',
  'Main Home',
  'Main Home',
  'Main Home',
  'Main Home',
];

class ReportBug extends StatefulWidget {
  const ReportBug({super.key});

  @override
  State<ReportBug> createState() => _ReportBugState();
}

class _ReportBugState extends State<ReportBug> {
  String dropdownValue = list.first;
  final global = GlobalThemeData().lightThemeData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('Report Bug', style: subheadlineStyle),
          ],
        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Bug Topic',
                    style: DefaultStyles.labelStyle,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: global.colorScheme.primary),
                      borderRadius: BorderRadius.circular(0.0),
                    ),
                    width: double.infinity,
                    child: DropdownMenu<String>(
                      initialSelection: list.first,
                      expandedInsets: EdgeInsets.zero,
                      onSelected: (String? value) {
                        setState(() {
                          dropdownValue = value!;
                        });
                      },
                      dropdownMenuEntries:
                          list.map<DropdownMenuEntry<String>>((String value) {
                        return DropdownMenuEntry<String>(
                            value: value, label: value);
                      }).toList(),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                    'Bug Detail',
                    style: DefaultStyles.labelStyle,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextField(
                    decoration: DefaultStyles.inputDecoration.copyWith(
                      hintText: 'Write Up the Bug Detail',
                    ),
                    maxLines: 5,
                  ),
                ],
              ),
              OutlinedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  backgroundColor: Colors.black,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero),
                  side: const BorderSide(color: Colors.white, width: 1),
                ),
                child: const Text(
                  'Report',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
