import 'package:Letterfly/components/colors.dart';
import 'package:Letterfly/components/textstylefont.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
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
            Text('About Us', style: subheadlineStyle),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 156.0,
              color: global.primaryColor,
              child: Center(
                  child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset('assets/logo/Logo.svg',
                          height: 25, color: global.colorScheme.onPrimary),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Letterfly',
                        style: TextStyle(
                          color: global.colorScheme.onPrimary,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "All rights Reserved 2024",
                    style: TextStyle(color: global.colorScheme.onPrimary),
                  )
                ],
              )),
            ),
            const SizedBox(
              height: 16,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Meet Letterfly Group',
                  style: headlineStyle,
                ),
                const Text(
                    "At LetterFly, we believe in the magic of words. Our mission is to make communication more personal, meaningful, and delightful. We are a team of passionate individuals who come together with a shared love for creativity, technology, and human connection. Here's a glimpse into the hearts and minds behind LetterFly."),
                const SizedBox(
                  height: 16,
                ),
                const Text(
                  "Founders",
                  style: headlineStyle,
                ),
                const SizedBox(
                  height: 8,
                ),
                Text("Timcook - CEO"),
                Text(
                    "Timcook is the strategic mind behind our marketing efforts. He develops and implements campaigns that drive engagement and growth. Timcook's insights and creativity help us reach new heights and connect with our audience in meaningful ways."),
                const SizedBox(
                  height: 8,
                ),
                Text("Timcook - CEO"),
                Text(
                    "Timcook is the strategic mind behind our marketing efforts. He develops and implements campaigns that drive engagement and growth. Timcook's insights and creativity help us reach new heights and connect with our audience in meaningful ways."),
                const SizedBox(
                  height: 8,
                ),
                Text("Timcook - CEO"),
                Text(
                    "Timcook is the strategic mind behind our marketing efforts. He develops and implements campaigns that drive engagement and growth. Timcook's insights and creativity help us reach new heights and connect with our audience in meaningful ways."),
                const SizedBox(
                  height: 8,
                ),
                Text("Timcook - CEO"),
                Text(
                    "Timcook is the strategic mind behind our marketing efforts. He develops and implements campaigns that drive engagement and growth. Timcook's insights and creativity help us reach new heights and connect with our audience in meaningful ways."),
              ],
            )
          ],
        ),
      ),
    );
  }
}
