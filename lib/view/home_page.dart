import 'package:flutter/material.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/view_model/movies_list_vm.dart';
import 'package:provider/provider.dart';
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static const String imageUrl="https://image.tmdb.org/t/p/w500";

  @override
  Widget build(BuildContext context) {

    Provider.of<MoviesListViewModel>(context,listen: false).getFromApi();

    return Scaffold(
      body: Container(
        child: Consumer<MoviesListViewModel>(builder: (context,data,child){
          return ListView.builder(
              itemCount: data.moveis.length,
              itemBuilder: (BuildContext contex, int index){
                return movieItem(data.moveis[index]);
          });
        }),
      )
    );
  }
  
  
  Widget movieItem(Movie movie){
    return Card(
      elevation: 4,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: Image.network("$imageUrl${movie.backdropPath}")),
          SizedBox(width: 10,),
          Expanded(child: Text(movie.originalTitle!)
          )
        ],
      ),
    );
  }
  
}
