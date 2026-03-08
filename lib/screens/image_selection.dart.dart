import 'package:flutter/material.dart';

class ImageSelection extends StatefulWidget {
  const ImageSelection({super.key});

  @override
  State<ImageSelection> createState() => _ImageSelectionState();
}

class _ImageSelectionState extends State<ImageSelection> {
  List<String> photos = [
    'assets/laptop/labtop1.png',
    'assets/laptop/labtop2.png',
    'assets/laptop/labtop3.png',
    'assets/laptop/labtop3.png',
    'assets/laptop/labtop3.png',
  ];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xcbfdee00),
      body: Column(
        children: [
          SizedBox(height: 80),

          /// Main Container
          SizedBox(
            height: 250,
            width: double.infinity,
            child: Image.asset(
              photos[selectedIndex],
              fit: BoxFit.cover,
            ),
          ),

          SizedBox(height: 10),

          /// Other Photos
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(photos.length, (index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 400),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Colors.white,

                      border: Border.all(
                        color: index == selectedIndex
                            ? Colors.black
                            : Colors.white,
                      ),
                    ),
                    margin: EdgeInsets.symmetric(horizontal: 3),
                    height: 100,
                    width: 100,
                    child: Image.asset(
                      photos[index],
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
