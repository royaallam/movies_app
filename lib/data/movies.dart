import '../models/movie.dart';

const movies = <Movie>[
  Movie(
    title: 'Black Widow',
    image: 'assets/movies/black_widow.png',
    genre: 'Action',
    year: '2021',
  ),
  Movie(
    title: '1917',
    image: 'assets/movies/1917.png',
    genre: 'Action',
    year: '2019',
  ),
  Movie(
    title: 'Avengers',
    image: 'assets/movies/avengers.jpg',
    genre: 'Adventure',
    year: '2012',
  ),
  Movie(
    title: 'Captain America',
    image: 'assets/movies/captain_america.jpg',
    genre: 'Action',
    year: '2011',
  ),
  Movie(
    title: 'Captain America: Civil War',
    image: 'assets/movies/civil_war.jpg',
    genre: 'Action',
    year: '2016',
  ),
  Movie(
    title: 'The Dark Knight',
    image: 'assets/movies/dark_knight.png',
    genre: 'Action',
    year: '2008',
  ),
];

final watchList = <Movie>[
  movies[0],
  movies[2],
  movies[1],
  movies[4],
  movies[5],
  movies[3],
];

final history = <Movie>[
  movies[1],
  movies[0],
  movies[5],
  movies[2],
  movies[3],
  movies[4],
];
