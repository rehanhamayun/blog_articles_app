import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sizer/sizer.dart';

class BlogsPage extends StatelessWidget {
  fetchMovies() async {
    final url = Uri.parse(
        'https://api.themoviedb.org/3/movie/now_playing?api_key=1500496dcaf1512b62894bd98ba83f9d&language=en-US');
    final response = await http.get(url);
    return json.decode(response.body)['results'];
  }

  BlogsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: fetchMovies(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text("Error"),
              );
            }

            if (snapshot.hasData) {
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                // shrinkWrap: true,
                itemCount: snapshot.data.length,
                padding: EdgeInsets.all(8),
                itemBuilder: (BuildContext context, int index) {
                  return Row(children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Card(
                        child: Container(
                          height: 20.h,
                          width: 20.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            image: DecorationImage(
                                image: NetworkImage(
                                  "https://image.tmdb.org/t/p/w500" +
                                      snapshot.data[index]['poster_path'],
                                ),
                                fit: BoxFit.cover),
                          ),
                        ),
                      ),
                    ),
                  ]);
                },
              );
            }
            return Center(
              child: Text("data"),
            );
          }),
    );
  }
}
