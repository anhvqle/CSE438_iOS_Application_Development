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
    var overview: String!
    var vote_count: Int!
    var titleName: String!
    var releasedDate: String!
    var score: Double!
    var favoriteMovies: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        let theImageFrame = CGRect(x: view.frame.midX - image.size.width/2, y: 120, width: image.size.width, height: image.size.height)
        let imageView = UIImageView(frame: theImageFrame)
        imageView.image = image
        view.addSubview(imageView)
        
        let titleFrame = CGRect(x: 0, y: image.size.height + 140, width: view.frame.width, height: 30)
        let titleView = UILabel(frame: titleFrame)
        titleView.text = titleName!
        titleView.font = UIFont.boldSystemFont(ofSize: 20.0)
        titleView.textAlignment = .center
        view.addSubview(titleView)
        
        let releaseDateFrame = CGRect(x: 0, y: image.size.height + 190, width: view.frame.width, height: 30)
        let releaseDateView = UILabel(frame: releaseDateFrame)
        releaseDateView.text = "Released: \(releasedDate!)"
        releaseDateView.textAlignment = .center
        view.addSubview(releaseDateView)
        
        let scoreFrame = CGRect(x: 0, y: image.size.height + 240, width: view.frame.width, height: 30)
        let scoreView = UILabel(frame: scoreFrame)
        scoreView.text = "Score: \(score!)/10"
        scoreView.textAlignment = .center
        view.addSubview(scoreView)
        
        let favoriteButton = CGRect(x: 0, y: image.size.height + 300, width: view.frame.width, height: 30)
        let favoriteView = UIButton(frame: favoriteButton)
        favoriteView.backgroundColor = .white
        favoriteView.setTitleColor(.blue, for: .normal)
        favoriteView.setTitle("Add to Favorites", for: .normal)
        favoriteView.addTarget(self, action: #selector(addFavorite), for: .touchUpInside)
        view.addSubview(favoriteView)
        
        let trailerButton = CGRect(x: 0, y: image.size.height + 360, width: view.frame.width, height: 30)
        let trailerView = UIButton(frame: trailerButton)
        trailerView.backgroundColor = .white
        trailerView.setTitleColor(.red, for: .normal)
        trailerView.setTitle("Trailer", for: .normal)
        trailerView.addTarget(self, action: #selector(watchTrailer), for: .touchUpInside)
        view.addSubview(trailerView)
    }
    
    // Add to Favorite List Button
    @objc func addFavorite(sender: UIButton!) {
        self.favoriteMovies = UserDefaults.standard.array(forKey: "MyKey") as? [String] ?? []
        if( !self.favoriteMovies.contains(self.titleName!) ){
            self.favoriteMovies.append(self.titleName!)
            UserDefaults.standard.set(self.favoriteMovies, forKey: "MyKey")
            print(self.favoriteMovies)
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
