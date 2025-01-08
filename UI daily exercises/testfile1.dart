import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FitnessAppHome extends StatelessWidget {
  const FitnessAppHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          height: double.infinity,
          width: double.infinity,
          child: Stack(
            children: [
              //header
              Stack(
                children: [
                  Container(
                      color: const Color(0xFFF5CEB8),
                      height: MediaQuery.of(context).size.height / 2.5,
                      width: double.infinity,
                      ),
                  Padding(padding: EdgeInsets.only(top: 30),
                    child: SvgPicture.asset(
                      'assets/Menu/undraw_pilates_gpdb.svg',
                      width: 400,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [SvgPicture.asset('assets/Menu/menu.svg'),
                      ],
                    ),
                  ),
                  Positioned(
                    left: 20,
                    right: 20,
                    top: (MediaQuery.of(context).size.height / 2.5) / 2 - 100,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Good Morning",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const Text(
                          "Shishir",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: const Row(
                            children: [
                              Icon(Icons.search, color: Colors.grey),
                              SizedBox(width: 10),
                              Expanded(
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Search",
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),

              Positioned(
                left: 10,
                right: 10,
                bottom: 10,
                child: Container(
                    height: MediaQuery.of(context).size.height / 1.9,
                    child: GridView.count(
                        crossAxisCount: 2,
                        crossAxisSpacing: 30,
                        mainAxisSpacing: 30,
                        padding: EdgeInsets.all(10),
                        children: [
                          // Diet Recommendation Card
                          _buildExerciseCard(
                            title: "Diet \nRecommendation",
                            svgPath: "assets/function/diet.svg",
                          ),
                          // Kegel Exercises Card
                          _buildExerciseCard(
                            title: "Kegel Exercises", // Để chỉnh sửa
                            svgPath:
                                "assets/function/kegel.svg", // Đường dẫn SVG
                          ),
                          // Meditation Card
                          _buildExerciseCard(
                            title: "Meditation", // Để chỉnh sửa
                            svgPath:
                                "assets/function/meditation.svg", // Đường dẫn SVG
                          ),
                          // Yoga Card
                          _buildExerciseCard(
                            title: "Yoga", // Để chỉnh sửa
                            svgPath:
                                "assets/function/yoga.svg", // Đường dẫn SVG
                          ),
                        ])),
              )
            ],
          ),
        ),
        bottomNavigationBar: // Bottom Navigation Bar
            BottomNavigationBar(
          currentIndex: 1, // Đang chọn tab thứ 2 (All Exercises)
          selectedItemColor: const Color(0xFFE68342),
          onTap: (index) {
            // Thay đổi navigation (nếu cần)
          },
          items: [
            const BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month_outlined),
              label: "Today",
            ),
            BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/bottomIcon/allexercises.svg'),
                label: 'All Exercises'),
            const BottomNavigationBarItem(
              icon: Icon(Icons.settings_outlined),
              label: "Settings",
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExerciseCard({required String title, required String svgPath}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              margin: EdgeInsets.only(bottom: 10, left: 10, right: 10, top: 20),
              child: FittedBox(
                child: SvgPicture.asset(
                  svgPath,
                  height: 120,
                  width: 70,
                ),
              )),
          const SizedBox(height: 10),
          Text(
            title, // Để bạn chỉnh sửa tiêu đề
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
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
    home: FitnessAppHome(),
  ));
}
