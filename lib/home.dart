import 'package:Letterfly/components/textstylefont.dart';
import 'package:Letterfly/provider/letterfly_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<LetterFlyProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(40, 42, 45, 1),
        automaticallyImplyLeading: false,
        title: Padding(
          padding: EdgeInsets.only(
              top: 30, left: MediaQuery.of(context).size.width * 0.01),
          child: Row(
            children: [
              SvgPicture.asset(
                'assets/logo/Logo.svg',
                height: 29,
                color: Colors.white,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                'Letterfly',
                style: subheadlineStyle.copyWith(
                    color: Colors.white, fontSize: 24),
              ),
            ],
          ),
        ),
        // actions: [
        //   Switch(
        //       value: prov.switchThemeto,
        //       onChanged: (val) {
        //         prov.setSwitchThemeto = val;
        //       }),
        // ],
      ),
      backgroundColor: const Color.fromRGBO(40, 42, 45, 1),
      body: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 24, bottom: 24),
            child: homeNavbar(context),
          ),
          Expanded(
            child: Container(
              color: Colors.white,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Recents",
                          style: subheadlineStyle,
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            "View All",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Chips(),
                    Expanded(
                      child: ListView.builder(
                        itemCount: 20,
                        itemBuilder: (context, index) {
                          return ListTile(
                            onTap: () {},
                            contentPadding:
                                const EdgeInsets.fromLTRB(0, 5, 5, 5),
                            leading: Container(
                              height: MediaQuery.of(context).size.width * 0.1,
                              width: MediaQuery.of(context).size.width * 0.1,
                              color: Colors.grey,
                            ),
                            title: const Text("011/200/0334AB"),
                            subtitle: const Text(
                                "Surat Keputusan / Div. Adm / 1 File"),
                            trailing: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text("02/04/2024"),
                                Text("2 hari yang lalu")
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Column homeNavbar(BuildContext context) {
    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            homeSearchBar(),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, "/addletter");
                        },
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            SizedBox(
                              height: 48,
                              width: 48,
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: const Color.fromRGBO(
                                          219, 219, 219, 1),
                                      width: 2),
                                  borderRadius: BorderRadius.circular(0),
                                ),
                              ),
                            ),
                            const Icon(
                              Icons.add,
                              size: 24,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Add Letter",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 10),
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 43,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, "/category");
                        },
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            SizedBox(
                              height: 48,
                              width: 48,
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: const Color.fromRGBO(
                                          219, 219, 219, 1),
                                      width: 2),
                                  borderRadius: BorderRadius.circular(0),
                                ),
                              ),
                            ),
                            const Icon(
                              Icons.grid_view_sharp,
                              size: 24,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Category",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 10),
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 43,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            SizedBox(
                              height: 48,
                              width: 48,
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: const Color.fromRGBO(
                                          219, 219, 219, 1),
                                      width: 2),
                                  borderRadius: BorderRadius.circular(0),
                                ),
                              ),
                            ),
                            const Icon(
                              Icons.settings_sharp,
                              size: 24,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Settings",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 10),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  SizedBox homeSearchBar() {
    return SizedBox(
      height: 38,
      child: TextField(
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(0),
          hintText: 'Search category or letter title',
          hintStyle: TextStyle(color: Colors.grey[400], fontSize: 14),
          fillColor: const Color.fromRGBO(249, 249, 249, 1),
          filled: true,
          prefixIcon: const Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Padding(
              padding: EdgeInsets.only(right: 16.0),
              child: Icon(
                Icons.search,
                // color: Colors.grey,
              ),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
                // color: Colors.grey,
                ),
            borderRadius: BorderRadius.circular(0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
                // color: Colors.grey,
                ),
            borderRadius: BorderRadius.circular(0),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
                // color: Colors.grey,
                ),
            borderRadius: BorderRadius.circular(0),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(0),
          ),
        ),
      ),
    );
  }
}

class Chips extends StatefulWidget {
  const Chips({super.key});

  @override
  State<Chips> createState() => _ChipsState();
}

class _ChipsState extends State<Chips> {
  bool suratKuasa = false;
  bool suratAjaib = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ChoiceChip(
          labelPadding: const EdgeInsets.symmetric(horizontal: 15),
          label: const Text(
            "Surat Kuasa",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          side: const BorderSide(color: Colors.black, width: 1),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
          showCheckmark: false,
          selectedColor: const Color.fromRGBO(219, 219, 219, 100),
          selected: suratKuasa,
          onSelected: (val) {
            setState(() {
              suratAjaib = false;
              suratKuasa = val;
            });
          },
        ),
        const SizedBox(width: 10),
        ChoiceChip(
          labelPadding: const EdgeInsets.symmetric(horizontal: 15),
          label: const Text(
            "Surat Ajaib",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          side: const BorderSide(color: Colors.black, width: 1),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
          showCheckmark: false,
          selectedColor: const Color.fromRGBO(219, 219, 219, 100),
          selectedShadowColor: Colors.black,
          selected: suratAjaib,
          onSelected: (val) {
            setState(() {
              suratKuasa = false;
              suratAjaib = val;
            });
          },
        ),
      ],
    );
  }
}
