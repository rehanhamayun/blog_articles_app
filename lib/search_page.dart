import 'dart:convert';

import 'package:fluid_bottom_nav_bar/fluid_bottom_nav_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:my_tasks/home_page.dart';
import 'package:my_tasks/view/bottom_bar_navigation.dart';

import 'package:my_tasks/widgets.dart';
import 'package:sizer/sizer.dart';
import 'package:http/http.dart' as http;

class Search extends StatelessWidget {
  fetchMovies() async {
    final url = Uri.parse(
        'https://api.themoviedb.org/3/movie/now_playing?api_key=1500496dcaf1512b62894bd98ba83f9d&language=en-US');
    final response = await http.get(url);
    return json.decode(response.body)['results'];
  }

  Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    fetchMovies();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.lightGreen.shade50,
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            //color: Colors.lightGreen.withOpacity(0.2),
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
                SizedBox(
                  height: 14,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Row(
                    children: [
                      Text(
                        "Most Popular Blog",
                        style: GoogleFonts.poppins(
                            color: Colors.grey, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                FutureBuilder(
                  future: fetchMovies(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasError) {
                      return Text("ERROR");
                    }
                    if (snapshot.hasData) {
                      return Container(
                        // This container allow total space to cover
                        height: 35.h,
                        width: double.infinity,
                        child: Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                decoration: BoxDecoration(
                                    // borderRadius: BorderRadius.circular(30),
                                    ),
                                // Cards space
                                height: 50.h,
                                width: 50.w,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: InkWell(
                                      child: Card(
                                        child: Image.network(
                                          "https://image.tmdb.org/t/p/w500" +
                                              snapshot.data[index]
                                                  ['poster_path'],
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      );
                    }

                    return CircularProgressIndicator();
                  },
                ),
                // FETCH IMAGES COMPLETED HERE
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Row(
                    children: [
                      Text(
                        "Last Read Blog",
                        style: GoogleFonts.poppins(
                            color: Colors.grey, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: 2.h,
                ),
                Container(
                  height: 10.h,
                  width: 85.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        flex: 1,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            rowImg,
                            fit: BoxFit.cover,
                            height: 80,
                            width: 100,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        flex: 2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Yeeds Flying to the Moon",
                              style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "75% to complete \n 2 Hours ago",
                              style: GoogleFonts.poppins(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          width: 60,
                          height: 60,
                          child: Icon(
                            Icons.format_align_center_sharp,
                            size: 20,
                          ),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.deepOrange.withOpacity(0.4),
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
        // Bottom Navogation Bar designing
        bottomNavigationBar: FluidNavBar(
          icons: [
            FluidNavBarIcon(
              icon: Icons.home,
            ),
            FluidNavBarIcon(
              icon: CupertinoIcons.paragraph,
            ),
            FluidNavBarIcon(
              icon: Icons.search,
            ),
            FluidNavBarIcon(
              icon: CupertinoIcons.profile_circled,
            ),
          ],
        ),
      ),
    );
  }
}
