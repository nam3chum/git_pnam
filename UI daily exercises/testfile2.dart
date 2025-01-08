import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MeditationPage extends StatefulWidget {
  const MeditationPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return MeditationPageState();
  }
}

class MeditationPageState extends State<MeditationPage> {
  final List<bool> _selectedItems = List.generate(6, (index) => false);
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            // Header Section
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 2.5,
                  decoration: const BoxDecoration(
                    color: Color(0xFFC7B8F5),
                  ),
                ),
                // SVG Background
                Positioned(
                  top: 30,
                  child: SvgPicture.asset(
                    'assets/Menu/undraw_pilates_gpdb.svg',
                    // Đường dẫn SVG làm nền
                    fit: BoxFit.cover,
                    color: const Color(0xFF575988),
                  ),
                ),
                //section
                Container(
                  clipBehavior: Clip.none,
                    height: MediaQuery.of(context).size.height -250,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: Stack(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 20, top: 70),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Meditation",
                                        style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      RichText(
                                        text: const TextSpan(
                                            text: "3-10 MIN Course",
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                            children: [
                                              const TextSpan(
                                                  text:
                                                      "\n\nLive happier and healthier by learning the\nfundamentals of meditation and \nmindfulness.",
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.black54,fontFamily: 'Helvetica')),
                                            ]),
                                      ),
                                      const SizedBox(height: 20),
                                      Container(
                                        width: 200,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child:  const Row(
                                          children: [
                                            Icon(Icons.search,
                                                color: Colors.grey),
                                            SizedBox(width: 10),
                                            Expanded(
                                              child: TextField(
                                                decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  hintText: 'Search',
                                                  hintStyle: TextStyle(color: Colors.grey)
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              // SVG Illustration
                              Positioned(
                                bottom: 0,
                                right: -70,
                                child: SvgPicture.asset(
                                  'assets/function/meditation.svg',
                                  // Đường dẫn SVG minh họa
                                  height: 250,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 40,),
                        // Sessions Section
                        Container(
                          child: Stack(
                            children: [
                              SingleChildScrollView(
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      GridView.builder(
                                        shrinkWrap: true,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        gridDelegate:
                                            const SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 2,
                                                mainAxisSpacing: 20,
                                                crossAxisSpacing: 20,
                                                childAspectRatio: 3,
                                                mainAxisExtent: 90),
                                        itemCount: 6,
                                        itemBuilder: (context, index) {
                                          return GestureDetector(
                                            onTapUp: (_) {
                                              setState(() {
                                                _selectedItems[index] =
                                                    !_selectedItems[index];
                                              });
                                            },
                                            child: _buildSessionCard(
                                                "Session 0${index + 1}",
                                                _selectedItems[index]),
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ))
              ],
            ),
            Container(
                child: Padding(
                  padding:EdgeInsetsDirectional.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Positioned(
                        child: Text(
                          "Meditation",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 15,
                        left: 20,
                        right: 20,
                        child: _buildMeditationCard(),
                      ),
                    ],
                  ),
                )),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 1,
          selectedItemColor: const Color(0xFFE68342),
          onTap: (index) {},
          items: [
            const BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month_outlined),
              label: "Today",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/bottomIcon/allexercises.svg'),
              label: 'All Exercises',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.settings_outlined),
              label: "Settings",
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSessionCard(String title, bool isSelected) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              isSelected == true
                  ? Icons.play_circle
                  : Icons.play_circle_outline_outlined,
              color: const Color(0xFF817DC0),
              size: 60,
            ),
            const SizedBox(width: 8),
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMeditationCard() {
    return Container(
      height: 100,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Stack(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 80,
                width: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: SvgPicture.asset(
                  "assets/function/meditation.svg",
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(width: 15),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Basics 2",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Start your deepen your practice",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Positioned(
            top: 0,
            right: 0,
            child: Icon(
              Icons.lock_outline_rounded,
              size: 32,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MeditationPage(),
  ));
}
