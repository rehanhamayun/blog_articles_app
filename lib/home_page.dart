import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_tasks/search_page.dart';
import 'package:my_tasks/widgets.dart';
import 'package:sizer/sizer.dart';

class Homepage extends StatelessWidget {
  Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(14, 70, 14, 0),
              child: Container(
                width: 100.w,
                height: 30.h,
                //color: Colors.amber,
                child: Image.network(imgUrl),
              ),
            ),
            SizedBox(
              height: 60,
            ),
            Text(
              "Welcome to",
              style: textTitle,
            ),
            Text(
              "Bebeloggan App",
              style: textTitle,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(90, 20, 80, 0),
              child: Text(
                "Write, and read millions of articles from various contries, and win several competetions.",
                style: GoogleFonts.poppins(
                  color: Colors.grey.withOpacity(0.7),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
//Actually A button wrap with Inkwell
            InkWell(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Search()));
              },
              child: Container(
                height: 6.h,
                width: 90.w,
                decoration: BoxDecoration(
                  color: Colors.deepOrange,
                  borderRadius: BorderRadius.circular(30),
                ),
                alignment: Alignment.center,
                child: Text(
                  "Get Started",
                  style: GoogleFonts.poppins(
                      color: Colors.white, fontWeight: FontWeight.w500),
                ),
              ),
            ),

            SizedBox(
              height: 100,
            ),
          ],
        ),
      ),

      // Bottom Bar
      bottomNavigationBar: Container(
        // For Responsiveness
        height: 7.h,
        width: 90.w,
        child: BottomAppBar(
          elevation: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Application version 8.3.0",
                style: GoogleFonts.poppins(
                  color: Colors.grey.withOpacity(0.6),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
