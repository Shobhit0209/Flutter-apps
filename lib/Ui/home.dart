// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore: unused_import
import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:movieapp/model/movie.dart';

class Movieapp extends StatefulWidget {
  const Movieapp({super.key});

  @override
  State<Movieapp> createState() => _MovieappState();
}

class _MovieappState extends State<Movieapp> {
  final List<Movie> movieList = Movie.getMovies();
  final movies = <String>[
    "Sholay",
    "Mohabbatein",
    "Diljale",
    "Gadar - Ek Prem Katha",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Center(child: Text("Movies")),
        backgroundColor: Colors.yellow.shade700,
      ),
      backgroundColor: Colors.grey[400],
      body: ListView.builder(
          shrinkWrap: true,
          itemCount: movies.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              elevation: 12.0,
              color: Colors.white,
              child: ListTile(
                  leading: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      child: Image.network(movieList[index].images[0])),
                  trailing: Text("${movieList[index].rating}"),
                  title: Text(movies[index],
                      style: const TextStyle(color: Colors.blue, fontSize: 20)),
                  // ignore: unnecessary_string_interpolations
                  subtitle: Text("${movieList[index].year}"),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Moviedetail(
                                movie: movieList[index], moviename: '')));
                  }

                  // onTap: () => debugPrint("Movie Name: ${movies[index]}")
                  ),
            );
          }),
    );
  }
}

//NEW ROUTE(SCREEN)

class Moviedetail extends StatelessWidget {
  final String moviename;
  final Movie movie;
  const Moviedetail({super.key, required this.moviename, required this.movie});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Movies"),
        backgroundColor: Colors.yellow.shade700,
      ),
      body: SafeArea(
        child: Column(children: [
          Moviedetailsthumbnail(thumbnail: movie.images[0]),
          MovieDetailsHeaderWithPoster(movie: movie),
          Moviedetailscast(movie: movie),
          Moviedetailsextraposters(
            posters: movie.images,
          )
        ]),
      ),
      // body: Container(
      //  child: ElevatedButton(
      //    child: Text("Back"),
      //    onPressed: () {
      //      Navigator.pop(
      //          context, MaterialPageRoute(builder: (context) => Movieapp()));
      //    },
      //  ),
      //),
    );
  }
}

class Moviedetailsthumbnail extends StatelessWidget {
  const Moviedetailsthumbnail({
    Key? key,
    required this.thumbnail,
  }) : super(key: key);
  final String thumbnail;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 250,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(thumbnail), fit: BoxFit.cover)),
            ),
            const Icon(Icons.play_circle_outline,
                size: 100, color: Colors.white)
          ],
        ),
        Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0x00f5f5f5), Color(0xfff5f5f5)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
          height: 80,
        )
      ],
    );
  }
}

class MovieDetailsHeaderWithPoster extends StatelessWidget {
  final Movie movie;
  const MovieDetailsHeaderWithPoster({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(children: [
        MoviePoster(poster: movie.images[0].toString()),
        const SizedBox(
          width: 16,
        ),
        Expanded(child: MovieDetailsHeader(movie: movie))
      ]),
    );
  }
}

class MoviePoster extends StatelessWidget {
  final String poster;
  const MoviePoster({
    Key? key,
    required this.poster,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        child: Container(
          width: MediaQuery.of(context).size.width / 4,
          height: 160,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(poster), fit: BoxFit.cover)),
        ),
      ),
    );
  }
}

class MovieDetailsHeader extends StatelessWidget {
  final Movie movie;
  const MovieDetailsHeader({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${movie.title}".toUpperCase(),
          style: const TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 32,
              color: Colors.deepOrange),
        ),
        Text(
          "${movie.year}-${movie.rating}",
          style: const TextStyle(
              fontWeight: FontWeight.w500, color: Colors.indigo),
        ),
        Text(
          movie.artists,
          style: const TextStyle(
              fontWeight: FontWeight.w500, color: Colors.indigo),
        ),
        Text("Director-" "${movie.director}",
            style: const TextStyle(
                fontWeight: FontWeight.w500, color: Colors.indigo))
      ],
    );
  }
}

class Moviedetailscast extends StatelessWidget {
  final Movie movie;
  const Moviedetailscast({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          Moviefield(field: "Language", value: movie.language),
          Moviefield(field: "Country", value: movie.country),
        ],
      ),
    );
  }
}

class Moviefield extends StatelessWidget {
  final String field;
  final String value;
  const Moviefield({
    Key? key,
    required this.field,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$field:",
          style: const TextStyle(
              color: Colors.black, fontSize: 15, fontWeight: FontWeight.w700),
        ),
        Text(
          value,
          style: const TextStyle(
              color: Colors.black, fontSize: 15, fontWeight: FontWeight.w300),
        )
      ],
    );
  }
}

class Moviedetailsextraposters extends StatelessWidget {
  final List posters;
  const Moviedetailsextraposters({
    Key? key,
    required this.posters,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "More Movie Posters".toUpperCase(),
          style: const TextStyle(fontSize: 14, color: Colors.black26),
        ),
        Container(
            height: 160,
            child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                child: Container(
                  width: MediaQuery.of(context).size.width / 2,
                  height: 160,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(posters[index]), fit: BoxFit.cover),
                  ),
                ),
              ),
              separatorBuilder: (context, index) => const SizedBox(
                width: 8,
              ),
              itemCount: posters.length,
            ))
      ],
    );
  }
}
