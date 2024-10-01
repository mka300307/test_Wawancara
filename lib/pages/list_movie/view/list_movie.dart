import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/movie.dart';
import '../../detail_movie/view/detail.dart';

class MovieListPage extends StatelessWidget {
  final MovieController movieController = Get.put(MovieController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movies'),
      ),
      body: Obx(() {
        if (movieController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        if (movieController.movies.isEmpty) {
          return Center(child: Text('No movies found'));
        }

        return ListView.builder(
          itemCount: movieController.movies.length,
          itemBuilder: (context, index) {
            final item = movieController.movies[index];
            return GestureDetector(
              onTap: () {
                Get.to(() => MovieDetailPage(movieId: item.id));
              },
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 130,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Image.network(
                            item.image,
                            width: 80,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(width: 10),

                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  item.title,
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),

                                Text(
                                  item.director,
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            );
          },
        );
      }),
    );
  }
}
