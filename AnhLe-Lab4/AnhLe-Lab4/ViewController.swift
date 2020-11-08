//
//  ViewController.swift
//  AnhLe-Lab4
//
//  Created by Anh Le on 11/8/20.
//  Copyright © 2020 Anh Le. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UISearchBarDelegate {
    
    struct APIResults:Decodable {
        let page: Int
        let total_results: Int
        let total_pages: Int
        let results: [Movie]
    }
    
    struct Movie: Decodable {
        let id: Int!
        let poster_path: String?
        let title: String
        let release_date: String
        let vote_average: Double
        let overview: String
        let vote_count:Int!
    }
    
    var movies: [Movie] = []
    var movieSearchName: String = "" {
        didSet{
            movies = []
            theImageCache = []
            setupCollectionView()
            fetchDataForCollectionView(movieSearchName)
            cacheImages()
        }
    }
    var theImageCache: [UIImage] = []
    
    @IBOutlet weak var movieCollectionView: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let itemSize = UIScreen.main.bounds.width / 3 - 10
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 5, bottom: 10, right: 5)
        layout.itemSize = CGSize(width: itemSize*0.85, height: itemSize*1.5)
        layout.minimumInteritemSpacing = 5
        layout.minimumLineSpacing = 5
        movieCollectionView.collectionViewLayout = layout
        
        searchBar.delegate = self
        setupCollectionView()
        fetchDataForCollectionView("Lion King")
        cacheImages()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        movieSearchName = searchBar.text!
        print(searchBar.text!)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailedVC = DetailedViewController()
        let index = indexPath.section*3 + indexPath.row
        detailedVC.image = theImageCache[index]
        detailedVC.titleName = movies[index].title
        detailedVC.releasedDate = movies[index].release_date
        detailedVC.score = movies[index].vote_average
        navigationController?.pushViewController(detailedVC, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "movieCell", for: indexPath)
        let movieFrame = collectionView.frame
        let index = indexPath.section*3 + indexPath.row
        if(index < theImageCache.count){
            let imageView = UIImageView(image: theImageCache[index])
            imageView.frame = movieFrame
            cell.backgroundView = imageView
        }
        return cell
    }

    func setupCollectionView(){
        movieCollectionView.dataSource = self
        movieCollectionView.delegate = self
        searchBar.delegate = self
        movieCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "movieCell")
    }
    
    func fetchDataForCollectionView(_ searchName: String){
        if(searchName != ""){
            let searchMovieName = searchName.replacingOccurrences(of: " ", with: "+")
            let jsonURL = "https://api.themoviedb.org/3/search/movie?api_key=4e696d8d8239e7c1b97bcd76ac0eb317&query=\(searchMovieName)"
            let url = URL(string: jsonURL)
            let data = try! Data(contentsOf: url!)
            let theData = try! JSONDecoder().decode(APIResults.self, from: data)
            movies = theData.results
            if(movies.count == 0){
                let alert = UIAlertController(title: "No Results Found", message: "Cannot find any movie with title\(searchName)", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
            print(jsonURL)
        }
    }
    
    func cacheImages(){
        let baseURL = "https://image.tmdb.org/t/p/w185"
        for item in movies {
            if(item.poster_path != nil){
                let imageURL = baseURL + item.poster_path!
                let url = URL(string: imageURL)
                let data = try? Data(contentsOf: url!)
                if(data != nil){
                    let image = UIImage(data: data!)
                    theImageCache.append(image!)
                }
            }
        }
    }
}

