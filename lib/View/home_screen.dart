import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled/View/add_task.dart';
import 'package:untitled/View/components/custom_button.dart';
import 'package:untitled/View/components/custom_carousel.dart';
import 'package:untitled/View/view_tasks.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("ToDo", style: GoogleFonts.dancingScript(textStyle: TextStyle(fontSize: 35, fontWeight: FontWeight.bold))),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 160,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(15.0), topRight: Radius.circular(15.0))
                    ),
                    child: CustomCarousel(),
                  ),
                  Container(
                    height: 100,
                    decoration: BoxDecoration(
                        color: Colors.pink.shade50,
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15.0), bottomRight: Radius.circular(15.0))
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
                      child: Row (
                        children: [
                          Expanded(
                            child: CustomButton(
                              label: 'Add Task',
                              onPressed: () => Get.to(() => AddTaskScreen()),
                              icon: Icons.add,
                            ),
                          ),
                          SizedBox(width: 20),
                          Expanded(
                            child: CustomButton(
                              label: 'View Tasks',
                              onPressed: () => Get.to(() => ViewTaskScreen()),
                              icon: Icons.view_list,
                            ),
                          ),
                        ],
                      ),
                    )
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      bottomSheet: PreferredSize(
        preferredSize: Size.fromHeight(kBottomNavigationBarHeight),
        child: Material(
          color: Colors.transparent,
          elevation: 0,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Icon(Icons.copyright, color: Colors.grey.shade800),
          ),
        ),
      ),
    );
  }
}
