import 'package:Letterfly/components/textstylefont.dart';
import 'package:Letterfly/provider/letterfly_provider.dart';
import 'package:Letterfly/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<LetterFlyProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login', style: subheadlineStyle),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(20, 16, 20, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.black,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: SvgPicture.asset(
                        'assets/logo/Logo.svg',
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Text(
                    'Hi, ${prov.Username}',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),
            Text(
              'Your Profile',
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 16,
                  height: 16,
                  decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius: BorderRadius.zero,
                  ),
                ),
                const SizedBox(width: 8),
                const Text(
                  'Name',
                  style: DefaultStyles.labelStyle,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                SizedBox(width: 25),
                Text('${prov.Username}'),
              ],
            ),
            SizedBox(height: 8),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 16,
                  height: 16,
                  decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius: BorderRadius.zero,
                  ),
                ),
                const SizedBox(width: 8),
                const Text(
                  'Email',
                  style: DefaultStyles.labelStyle,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                SizedBox(width: 25),
                Text('${prov.Email}'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}