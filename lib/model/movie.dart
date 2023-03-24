// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:core';

class Movie {
  static List<Movie> getMovies() => <Movie>[
        new Movie(
            title: "Sholay",
            artists: "Amitabh Bachchan, Dharmendra, Hema Malini",
            year: "1975",
            rating: "4.6/5",
            country: "India",
            language: "Hindi",
            images: [
              "https://images.hindustantimes.com/rf/image_size_630x354/HT/p2/2020/08/13/Pictures/amitabh-bachchan-film-actor-in-sholay_1fd1c202-dd5d-11ea-b1b0-f6d177b03796.jpg",
              "https://www.mapsofindia.com/ci-moi-images/my-india/sholay.jpg",
              "https://upload.wikimedia.org/wikipedia/en/5/52/Sholay-poster.jpg"
            ],
            director: "Ramesh Sippy"),
        new Movie(
            title: "Mohabbatein",
            artists:
                "Amitabh Bachchan, Shahrukh khan, Aishwarya Rai, Jimmy Shergil",
            year: "2000",
            rating: "4/5",
            country: "India",
            language: "Hindi",
            images: [
              "https://i.pinimg.com/originals/f5/58/9c/f5589c29f58b75f6da1abe590521ebfb.jpg",
              "https://www.mapsofindia.com/ci-moi-images/my-india/sholay.jpg",
              "https://upload.wikimedia.org/wikipedia/en/5/52/Sholay-poster.jpg"
            ],
            director: "Aditya Chopra"),
        new Movie(
            title: "Diljale",
            artists: "Ajay Devgan, Sonali Bendre",
            year: "1996",
            rating: "4/5",
            country: "India",
            language: "Hindi",
            images: [
              "https://m.media-amazon.com/images/M/MV5BZTYwOThkYTctZTE1NC00ZDdlLWEzZmQtOTU0ZTBlYzk3NTgwXkEyXkFqcGdeQXVyODE5NzE3OTE@._V1_.jpg",
              "https://www.mapsofindia.com/ci-moi-images/my-india/sholay.jpg",
              "https://upload.wikimedia.org/wikipedia/en/5/52/Sholay-poster.jpg"
            ],
            director: "Harry Baweja"),
        new Movie(
            title: "Gadar - Ek prem katha",
            artists: "Sunny Deol, Ameesha Patel, Amrish Puri, Om Puri ",
            year: "2001",
            rating: "4.4/5",
            country: "India",
            language: "Hindi",
            images: [
              "https://assets-in.bmscdn.com/iedb/movies/images/mobile/thumbnail/xlarge/gadar--ek-prem-katha-et00002956-24-03-2017-19-52-43.jpg",
              "https://www.mapsofindia.com/ci-moi-images/my-india/sholay.jpg",
              "https://upload.wikimedia.org/wikipedia/en/5/52/Sholay-poster.jpg"
            ],
            director: "Anil Sharma")
      ];
  String title;
  String artists;
  String year;
  String rating;
  String country;
  String language;
  String director;
  List images;
  Movie({
    required this.title,
    required this.artists,
    required this.year,
    required this.rating,
    required this.country,
    required this.language,
    required this.director,
    required this.images,
  });
}
