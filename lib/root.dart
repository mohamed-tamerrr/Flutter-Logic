import 'package:flutter/material.dart';
import 'package:flutter_logic/screens/image_selection.dart.dart';
import 'package:flutter_logic/screens/multi_selection.dart';
import 'package:flutter_logic/screens/single_selection.dart';
import 'package:flutter_logic/screens/toggle_selection.dart';
import 'package:flutter_logic/screens/upload_image.dart';
import 'package:flutter_logic/screens/upload_multi_images.dart';
import 'package:flutter_logic/screens/upload_video.dart';

class Root extends StatefulWidget {
  const Root({super.key});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  final PageController controller = PageController();
  final List<Widget> pages = [
    SingleSelection(),
    ImageSelection(),
    ToggleSelection(),
    MultiSelection(),
    UploadImage(),
    UploadMultiImages(),
    UploadVideo(),
  ];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: controller,
        children: pages,
        onPageChanged: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 50,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                /// back
                GestureDetector(
                  onTap: () {
                    setState(() {
                      controller.jumpToPage(selectedIndex - 1);
                    });
                  },
                  child: Container(
                    height: 40,
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                    ),
                    child: Icon(
                      Icons.arrow_back_outlined,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(width: 10),

                /// next
                GestureDetector(
                  onTap: () {
                    setState(() {
                      controller.jumpToPage(selectedIndex + 1);
                    });
                  },
                  child: Container(
                    height: 40,
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black,
                    ),
                    child: Row(
                      children: [
                        Text(
                          "Next Page",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(width: 14),
                        Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
