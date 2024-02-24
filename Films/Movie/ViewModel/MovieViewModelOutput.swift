//
//  MovieViewModelOutput.swift
//  Films
//

import Foundation
import UIKit

protocol MovieViewModelOutput: AnyObject{
    func updateMovie(movie: Movie)
    func updateUpcomingMovie(movie: Movie)
    func updateMovieTopRated(movie: Movie)
    func updateTrending(movie: Movie)
}

protocol MovieSearchViewModelOutput: AnyObject{
    func updateSearchMovie(movie: Movie)
}


protocol SingleMovieViewModelOutput: AnyObject{
    
    func updateSingleMovie(movie: SingleMovie)
    func updateMovieCredit(movie: MovieCredit)
    func updateMovieTrailer(movie: MovieTrailer)
    func updateSimilarMovies(movie: Movie)
}
