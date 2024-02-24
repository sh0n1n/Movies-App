//
//  SearchCollectionViewCell.swift
//  Films
//

import UIKit

class SearchCollectionViewCell: UICollectionViewCell {
    var backGroundPath: String?{
        didSet{
            guard let backGroundPath = backGroundPath else{return}
            if let imageURL = URL(string: "https://image.tmdb.org/t/p/w500\(backGroundPath)"){
                DispatchQueue.main.async {
                    self.movieImage.sd_setImage(with: imageURL)
                }
            }
        }
    }
    
    //MARK: - GUI Variables
    let movieImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        image.layer.cornerRadius = 10
        return image
    }()
    
    let movieNameLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 16)
        label.textColor = .white
        label.textAlignment = .left
        return label
    }()
    
    let movieDateLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 15)
        label.textColor = .white
        label.textAlignment = .left
        return label
    }()

    //MARK: - Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(movieImage)
        addSubview(movieNameLabel)
        addSubview(movieDateLabel)
        movieImage.backgroundColor = .lightGray
            
        movieImage.anchor(top: topAnchor, bottom: bottomAnchor, leading: leadingAnchor, trailing: nil, paddingTop: 0, paddingBottom: 0, paddingLeft: 10, paddingRight: 0, width: 100, height: 0)
        movieNameLabel.anchor(top: movieImage.topAnchor, bottom: nil, leading: movieImage.trailingAnchor, trailing: trailingAnchor, paddingTop: 0, paddingBottom: 0, paddingLeft: 5, paddingRight: -5, width: 0, height: 0)
        movieDateLabel.anchor(top: movieNameLabel.bottomAnchor, bottom: nil, leading: movieNameLabel.leadingAnchor, trailing: trailingAnchor, paddingTop: 10, paddingBottom: 0, paddingLeft: 0, paddingRight: -5, width: 0, height: 0)
    }

    required init?(coder: NSCoder) {
        fatalError()
    }
    
    //MARK: - Methods
    func searchMovie(movie: Result){
        
        backGroundPath = movie.posterPath
        movieNameLabel.text = movie.originalTitle
        movieDateLabel.text = movie.releaseDate
        
    }
}

