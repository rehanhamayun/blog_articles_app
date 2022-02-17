import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_tasks/widgets.dart';
import 'package:sizer/sizer.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.lightGreen.shade50,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          color: Colors.lightGreen.withOpacity(0.2),
          height: 90.h,
          width: 100.w,
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                height: 10.h,
                width: 80.w,
                //color: Colors.red,
                child: Row(
                  children: [
                    Icon(
                      CupertinoIcons.slider_horizontal_3,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Search for your Favorite Article",
                    style: textTitle,
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Container(
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide:
                            BorderSide.none, // For removing border colors
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      //icon: Icon(cu),
                      fillColor: Colors.white,
                      filled: true, // compulsory to enable
                      hintText: "Search blog by name",
                      hintStyle: GoogleFonts.poppins(
                        color: Colors.grey,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),

                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
