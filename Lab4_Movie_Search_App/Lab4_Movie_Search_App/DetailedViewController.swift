//
//  DetailedViewController.swift
//  AnhLe-Lab4
//
//  Created by Anh Le on 11/8/20.
//  Copyright © 2020 Anh Le. All rights reserved.
//

import UIKit

class DetailedViewController: UIViewController {
    
    var image: UIImage!
    var movieID: Int!
    var poster_path: String!
    var titleName: String!
    var releasedDate: String!
    var overview: String!
    var score: Double!
    
    var favoriteNames: [String] = []
    var favoriteIDs: [Int] = []
    var favoriteDates: [String] = []
    var favoriteScores: [Double] = []
    var favoriteImages: [UIImage] = []
    var favoritePaths: [String] = []
    var favoriteOverviews: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .lightGray
        self.title = titleName
        view.backgroundColor = .white
        let theImageFrame = CGRect(x: view.frame.midX - image.size.width/2, y: 90, width: image.size.width, height: image.size.height)
        let imageView = UIImageView(frame: theImageFrame)
        imageView.image = image
        view.addSubview(imageView)
        
        let releaseDateFrame = CGRect(x: 0, y: image.size.height + 100, width: view.frame.width, height: 30)
        let releaseDateView = UILabel(frame: releaseDateFrame)
        releaseDateView.text = "Released: \(releasedDate!)"
        releaseDateView.font = UIFont.boldSystemFont(ofSize: 16.0)
        releaseDateView.textAlignment = .center
        view.addSubview(releaseDateView)
        
        let scoreFrame = CGRect(x: 0, y: image.size.height + 130, width: view.frame.width, height: 30)
        let scoreView = UILabel(frame: scoreFrame)
        scoreView.text = "Score: \(score!*10)/100"
        scoreView.font = UIFont.boldSystemFont(ofSize: 16.0)
        scoreView.textAlignment = .center
        view.addSubview(scoreView)
        
        let overviewFrame = CGRect(x: 0, y: image.size.height + 120, width: view.frame.width, height: 300)
        let overviewView = UILabel(frame: overviewFrame)
        overviewView.text = overview!
        overviewView.lineBreakMode = .byWordWrapping
        overviewView.numberOfLines = 12
        overviewView.textAlignment = .center
        view.addSubview(overviewView)
        
        let favoriteButton = CGRect(x: 0, y: image.size.height + 380, width: view.frame.width, height: 30)
        let favoriteView = UIButton(frame: favoriteButton)
        favoriteView.backgroundColor = .white
        favoriteView.setTitleColor(.blue, for: .normal)
        favoriteView.setTitle("Add to Favorites", for: .normal)
        favoriteView.addTarget(self, action: #selector(addFavorite), for: .touchUpInside)
        view.addSubview(favoriteView)
        
        let trailerButton = CGRect(x: 0, y: image.size.height + 420, width: view.frame.width, height: 30)
        let trailerView = UIButton(frame: trailerButton)
        trailerView.backgroundColor = .white
        trailerView.setTitleColor(.red, for: .normal)
        trailerView.setTitle("Trailer", for: .normal)
        trailerView.addTarget(self, action: #selector(watchTrailer), for: .touchUpInside)
        view.addSubview(trailerView)
    }
    
    // Add to Favorite List Button
    @objc func addFavorite(sender: UIButton!) {
        self.favoriteNames = UserDefaults.standard.array(forKey: "MyName") as? [String] ?? []
        self.favoriteIDs = UserDefaults.standard.array(forKey: "MyID") as? [Int] ?? []
        self.favoriteDates = UserDefaults.standard.array(forKey: "MyDate") as? [String] ?? []
        self.favoriteScores = UserDefaults.standard.array(forKey: "MyScore") as? [Double] ?? []
        self.favoriteImages = UserDefaults.standard.array(forKey: "MyImagePath") as? [UIImage] ?? []
        self.favoritePaths = UserDefaults.standard.array(forKey: "MyImageString") as? [String] ?? []
        
        if( !self.favoriteIDs.contains(self.movieID!) ){
            
            self.favoriteNames.append(self.titleName!)
            self.favoriteIDs.append(self.movieID!)
            self.favoriteDates.append(self.releasedDate!)
            self.favoriteScores.append(self.score!)
            self.favoritePaths.append(self.poster_path!)
            self.favoriteOverviews.append(self.overview!)
            
            UserDefaults.standard.set(self.favoriteNames, forKey: "MyName")
            UserDefaults.standard.set(self.favoriteIDs, forKey: "MyID")
            UserDefaults.standard.set(self.favoriteDates, forKey: "MyDate")
            UserDefaults.standard.set(self.favoriteScores, forKey: "MyScore")
            UserDefaults.standard.set(self.favoritePaths, forKey: "MyImageString")
            UserDefaults.standard.set(self.favoriteOverviews, forKey: "MyOverview")
            
            print(self.favoritePaths)
        }
        
        let alert = UIAlertController(title: "Saved", message: "Added to Favorites", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    // Watch the movie trailer
    @objc func watchTrailer(sender: UIButton!) {
        let webVC = WebViewViewController()
        let searchMovieName = self.titleName!.replacingOccurrences(of: " ", with: "+")
        let searchURL = "https://www.youtube.com/results?search_query=\(searchMovieName)+trailer"
        let url = URL(string: searchURL)!
        let youtubeURLRequest = URLRequest(url: url)
        webVC.myURLRequest = youtubeURLRequest
        
        navigationController?.pushViewController(webVC, animated: true)
        //print(url!)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
