//
//  Service.swift
//  Films
//


import UIKit

    protocol MovieService{
        
        func fetchPopularMovies(completion: @escaping(Swift.Result<Movie, Error>) -> Void )
      
        func fetchUpcomingMovies(completion: @escaping(Swift.Result<Movie, Error>) -> Void)
        
        func fetchTopRatedMovies(completion: @escaping(Swift.Result<Movie, Error>) -> Void)
        
        func fetchSingleMovie(movieID: Int, completion: @escaping(Swift.Result<SingleMovie, Error>) -> Void)
        
        func fetchMovieCredit(movieID: Int, completion: @escaping(Swift.Result<MovieCredit, Error>) -> Void)
        
        func fetchMovieTrailer(movieID: Int, completion: @escaping (Swift.Result<MovieTrailer, Error>) -> Void)

        func fetchSimilarMovies(movieID: Int, completion: @escaping (Swift.Result<Movie, Error>) -> Void)
        
        func fetchSearchMovie(searchString: String, completion: @escaping (Swift.Result<Movie, Error>) -> Void)
        
        func fetchTrendingMovies(completion: @escaping (Swift.Result<Movie, Error>) -> Void)
    }

    protocol MovieCellService{
        
        func fetchMovieImage(backDropPath: String, completion: @escaping (Swift.Result<Data, Error>) -> Void)
    }


