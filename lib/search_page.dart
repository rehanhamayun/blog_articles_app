import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

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
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
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
                                  );
                                }),
                          ),
                        );
                      }

                      return Text("Rehan");
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
