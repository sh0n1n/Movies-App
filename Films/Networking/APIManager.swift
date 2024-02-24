//
//  APIManager.swift
//  Films
//


import UIKit

class APIManager: MovieService{
    func fetchTrendingMovies(completion: @escaping (Swift.Result<Movie, Error>) -> Void) {
        let headers = [
          "accept": "application/json",
          "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4MjNmODIwZGY0Mzg4ZDk2M2ExOTU3OGUyNGU5ZmIwMiIsInN1YiI6IjY1YTlhYzM3YzQzM2VhMDBjZTc0NDUzOCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.iRpR_AkId9BrMYlrEyQ6bsxJ-wrCsU9r3_g9odDj8rY"
        ]
        
        let url = URL(string: "https://api.themoviedb.org/3/trending/movie/day")!
        var request = URLRequest(url: url)
        
        
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error{
                completion(.failure(error))
            }
            
            guard response is HTTPURLResponse else{
                let unknownError = NSError(domain: "Unknown Error", code: 0, userInfo: nil)
                completion(.failure(unknownError))
                return
            }
                do{
                    if let data = data{
                        let decoder = JSONDecoder()
                        let movie = try decoder.decode(Movie.self, from: data)
                        completion(.success(movie))
                    }else{
                        let parsingError = NSError(domain: "No Data Error", code: 0)
                        completion(.failure(parsingError))
                    }
                }catch{
                    completion(.failure(error))
                }
 
        }.resume()
    }
    
    func fetchSearchMovie(searchString: String, completion: @escaping (Swift.Result<Movie, Error>) -> Void) {
        let headers = [
          "accept": "application/json",
          "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4MjNmODIwZGY0Mzg4ZDk2M2ExOTU3OGUyNGU5ZmIwMiIsInN1YiI6IjY1YTlhYzM3YzQzM2VhMDBjZTc0NDUzOCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.iRpR_AkId9BrMYlrEyQ6bsxJ-wrCsU9r3_g9odDj8rY"
        ]
        
        let url = URL(string: "https://api.themoviedb.org/3/search/movie?query=\(searchString)")!

        var request = URLRequest(url: url)
        
        
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error{
                completion(.failure(error))
            }
            
            guard response is HTTPURLResponse else{
                let unknownError = NSError(domain: "Unknown Error", code: 0, userInfo: nil)
                completion(.failure(unknownError))
                return
            }
                do{
                    if let data = data{
                        let decoder = JSONDecoder()
                        let movie = try decoder.decode(Movie.self, from: data)
                        completion(.success(movie))
                    }else{
                        let parsingError = NSError(domain: "No Data Error", code: 0)
                        completion(.failure(parsingError))
                    }
                }catch{
                    completion(.failure(error))
                }
 
        }.resume()
    }
    
    
    func fetchSimilarMovies(movieID: Int, completion: @escaping (Swift.Result<Movie, Error>) -> Void) {
        let headers = [
          "accept": "application/json",
          "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4MjNmODIwZGY0Mzg4ZDk2M2ExOTU3OGUyNGU5ZmIwMiIsInN1YiI6IjY1YTlhYzM3YzQzM2VhMDBjZTc0NDUzOCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.iRpR_AkId9BrMYlrEyQ6bsxJ-wrCsU9r3_g9odDj8rY"
        ]
        
        let url = URL(string: "https://api.themoviedb.org/3/movie/\(movieID)/similar")!

        var request = URLRequest(url: url)
        
        request.httpMethod = "GET"
        
        for (key, value) in headers{
            request.addValue(value, forHTTPHeaderField: key)
        }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error{
                completion(.failure(error))
            }
            
            guard response is HTTPURLResponse else{
                let unknownError = NSError(domain: "Unknown Error", code: 0, userInfo: nil)
                completion(.failure(unknownError))
                return
            }
            

                do{
                    if let data = data{
                        let decoder = JSONDecoder()
                        let movie = try decoder.decode(Movie.self, from: data)
                        completion(.success(movie))
                    }else{
                        let parsingError = NSError(domain: "No Data Error", code: 0)
                        completion(.failure(parsingError))
                    }
                }catch{
                    completion(.failure(error))
                }
 
        }.resume()
    }
 
    func fetchTopRatedMovies(completion: @escaping (Swift.Result<Movie, Error>) -> Void) {
        let headers = [
          "accept": "application/json",
          "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4MjNmODIwZGY0Mzg4ZDk2M2ExOTU3OGUyNGU5ZmIwMiIsInN1YiI6IjY1YTlhYzM3YzQzM2VhMDBjZTc0NDUzOCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.iRpR_AkId9BrMYlrEyQ6bsxJ-wrCsU9r3_g9odDj8rY"
        ]
        
        let url = URL(string: "https://api.themoviedb.org/3/movie/top_rated")!

        var request = URLRequest(url: url)
        
        request.httpMethod = "GET"
        
        for (key, value) in headers{
            request.addValue(value, forHTTPHeaderField: key)
        }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error{
                completion(.failure(error))
            }
            
            guard response is HTTPURLResponse else{
                let unknownError = NSError(domain: "Unknown Error", code: 0, userInfo: nil)
                completion(.failure(unknownError))
                return
            }
            

                do{
                    if let data = data{
                        let decoder = JSONDecoder()
                        let movie = try decoder.decode(Movie.self, from: data)
                        completion(.success(movie))
                    }else{
                        let parsingError = NSError(domain: "No Data Error", code: 0)
                        completion(.failure(parsingError))
                    }
                }catch{
                    completion(.failure(error))
                }
 
        }.resume()
    }

    func fetchUpcomingMovies(completion: @escaping (Swift.Result<Movie, Error>) -> Void) {
       
        let headers = [
          "accept": "application/json",
          "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4MjNmODIwZGY0Mzg4ZDk2M2ExOTU3OGUyNGU5ZmIwMiIsInN1YiI6IjY1YTlhYzM3YzQzM2VhMDBjZTc0NDUzOCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.iRpR_AkId9BrMYlrEyQ6bsxJ-wrCsU9r3_g9odDj8rY"
        ]
        
        let url = URL(string: "https://api.themoviedb.org/3/movie/upcoming")!

        var request = URLRequest(url: url)
        
        request.httpMethod = "GET"
        
        for (key, value) in headers{
            request.addValue(value, forHTTPHeaderField: key)
        }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error{
                completion(.failure(error))
            }
            
            guard response is HTTPURLResponse else{
                let unknownError = NSError(domain: "Unknown Error", code: 0, userInfo: nil)
                completion(.failure(unknownError))
                return
            }
            

                do{
                    if let data = data{
                        let decoder = JSONDecoder()
                        let movie = try decoder.decode(Movie.self, from: data)
                        completion(.success(movie))
                    }else{
                        let parsingError = NSError(domain: "No Data Error", code: 0)
                        completion(.failure(parsingError))
                    }
                }catch{
                    completion(.failure(error))
                }
 
        }.resume()
    }
    
    func fetchPopularMovies(completion: @escaping (Swift.Result<Movie, Error>) -> Void) {
        let headers = [
          "accept": "application/json",
          "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4MjNmODIwZGY0Mzg4ZDk2M2ExOTU3OGUyNGU5ZmIwMiIsInN1YiI6IjY1YTlhYzM3YzQzM2VhMDBjZTc0NDUzOCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.iRpR_AkId9BrMYlrEyQ6bsxJ-wrCsU9r3_g9odDj8rY"
        ]

            let url = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=90d27f19dae70ecf66feab87d4811474")!
            var request = URLRequest(url: url)
        request.httpMethod = "GET"
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error{
                completion(.failure(error))
            }
            
            guard response is HTTPURLResponse else{
                let unknownError = NSError(domain: "UnknownError", code: 0, userInfo: nil)
                completion(.failure(unknownError))
                return
            }
            
                do{
                    if let data = data{
                        let decoder = JSONDecoder()
                        let movie = try decoder.decode(Movie.self, from: data)
                        guard movie.results != nil else{return}
                        completion(.success(movie))
                    }else{
                        let parsingError = NSError(domain: "No Data Error", code: 0)
                        completion(.failure(parsingError))
                    }
                }catch{
                    completion(.failure(error))
                }
 
        }.resume()
    }

    func fetchSingleMovie(movieID: Int, completion: @escaping(Swift.Result<SingleMovie, Error>) -> Void){
        let headers = [
          "accept": "application/json",
          "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4MjNmODIwZGY0Mzg4ZDk2M2ExOTU3OGUyNGU5ZmIwMiIsInN1YiI6IjY1YTlhYzM3YzQzM2VhMDBjZTc0NDUzOCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.iRpR_AkId9BrMYlrEyQ6bsxJ-wrCsU9r3_g9odDj8rY"
        ]
        
        let request = NSMutableURLRequest(url: NSURL(string: "https://api.themoviedb.org/3/movie/\(movieID)?language=en-US")! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        URLSession.shared.dataTask(with: request as URLRequest) {data, response, error in
            if let error = error{
                completion(.failure(error))
            }
            
            guard response is HTTPURLResponse else{
                let unknownError = NSError(domain: "Unknown Error", code: 0, userInfo: nil)
                completion(.failure(unknownError))
                return
            }
            
            do{
                if let data = data{
                    let decoder = JSONDecoder()
                    let singleMovie = try decoder.decode(SingleMovie.self, from: data)
                 
                    completion(.success(singleMovie))
                }else{
                    let parsingError = NSError(domain: "No Data Error", code: 0)
                    completion(.failure(parsingError))
                }
            }catch{
                completion(.failure(error))
            }

        }.resume()

    }
    
    
    func fetchMovieCredit(movieID: Int, completion: @escaping(Swift.Result<MovieCredit, Error>) -> Void){
        
        let headers = [
          "accept": "application/json",
          "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4MjNmODIwZGY0Mzg4ZDk2M2ExOTU3OGUyNGU5ZmIwMiIsInN1YiI6IjY1YTlhYzM3YzQzM2VhMDBjZTc0NDUzOCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.iRpR_AkId9BrMYlrEyQ6bsxJ-wrCsU9r3_g9odDj8rY"
        ]
        
        let request = NSMutableURLRequest(url: NSURL(string: "https://api.themoviedb.org/3/movie/\(movieID)/credits?language=en-US")! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        
        
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        URLSession.shared.dataTask(with: request as URLRequest) {data, response, error in
            if let error = error{
                completion(.failure(error))
            }
            
            guard response is HTTPURLResponse else{
                let unknownError = NSError(domain: "Unknown Error", code: 0, userInfo: nil)
                completion(.failure(unknownError))
                return
            }
            
            
            do{
                if let data = data{
                    let decoder = JSONDecoder()
                    let singleMovie = try decoder.decode(MovieCredit.self, from: data)
                 
                    completion(.success(singleMovie))
                }else{
                    let parsingError = NSError(domain: "No Data Error", code: 0)
                    completion(.failure(parsingError))
                }
            }catch{
                completion(.failure(error))
            }

        }.resume()

    }
    
    
    func fetchMovieTrailer(movieID: Int, completion: @escaping (Swift.Result<MovieTrailer, Error>) -> Void){
        
        
        
        let headers = [
          "accept": "application/json",
          "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4MjNmODIwZGY0Mzg4ZDk2M2ExOTU3OGUyNGU5ZmIwMiIsInN1YiI6IjY1YTlhYzM3YzQzM2VhMDBjZTc0NDUzOCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.iRpR_AkId9BrMYlrEyQ6bsxJ-wrCsU9r3_g9odDj8rY"
        ]
        
        let request = NSMutableURLRequest(url: NSURL(string: "https://api.themoviedb.org/3/movie/\(movieID)/videos?language=en-US")! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        
        
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        URLSession.shared.dataTask(with: request as URLRequest) {data, response, error in
            if let error = error{
                completion(.failure(error))
            }
            
            guard response is HTTPURLResponse else{
                let unknownError = NSError(domain: "UnknownError", code: 0, userInfo: nil)
                completion(.failure(unknownError))
                return
            }
            
            
            do{
                if let data = data{
                    let decoder = JSONDecoder()
                    let singleMovie = try decoder.decode(MovieTrailer.self, from: data)
                 
                    completion(.success(singleMovie))
                }else{
                    let parsingError = NSError(domain: "No Data Error", code: 0)
                    completion(.failure(parsingError))
                }
            }catch{
                completion(.failure(error))
            }

        }.resume()
    }

    func fetchMovieImage(backDropPath: String, completion: @escaping (Swift.Result<Data, Error>) -> Void) {
        let imageURLString = "https://image.tmdb.org/t/p/original\(backDropPath)"

        guard let imageURL = URL(string: imageURLString) else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return
        }

        let request = URLRequest(url: imageURL)
  

        let session = URLSession.shared
        let dataTask = session.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "Image Download Error", code: 0, userInfo: nil)))
                return
            }
            
            completion(.success(data))
            print(data)
        }

        dataTask.resume()
    }  
}
