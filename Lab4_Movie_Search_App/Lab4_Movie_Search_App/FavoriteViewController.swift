//
//  FavoriteViewController.swift
//  AnhLe-Lab4
//
//  Created by Anh Le on 11/9/20.
//  Copyright © 2020 Anh Le. All rights reserved.
//

import UIKit

class FavoriteViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var favoriteNames:[String]!{
        didSet{
            favoriteTableView.reloadData()
        }
    }
    var favoriteIDs:[Int]!{
        didSet{
            favoriteTableView.reloadData()
        }
    }
    var favoriteDates:[String]!{
        didSet{
            favoriteTableView.reloadData()
        }
    }
    var favoriteScores:[Double]!{
        didSet{
            favoriteTableView.reloadData()
        }
    }
    var favoritePaths:[String]!{
        didSet{
            favoriteTableView.reloadData()
        }
    }
    var favoriteOverviews:[String]!{
        didSet{
            favoriteTableView.reloadData()
        }
    }
    
    @IBOutlet weak var favoriteTableView: UITableView!
    @IBOutlet weak var clearButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "Favorites"
        favoriteTableView.dataSource = self
        favoriteTableView.delegate = self
        favoriteTableView.register(UITableViewCell.self, forCellReuseIdentifier: "favoriteCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.favoriteNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let myCell = UITableViewCell(style: .default, reuseIdentifier: "favoriteCell")
        myCell.textLabel!.text = self.favoriteNames[indexPath.row]
        return myCell
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.favoriteNames = UserDefaults.standard.array(forKey: "MyName")! as? [String]
        if(UserDefaults.standard.array(forKey: "MyName")! as? [String] == nil){
            favoriteNames = []
        }
        self.favoriteIDs = UserDefaults.standard.array(forKey: "MyID")! as? [Int]
        if(UserDefaults.standard.array(forKey: "MyID")! as? [Int] == nil){
            favoriteIDs = []
        }
        self.favoriteDates = UserDefaults.standard.array(forKey: "MyDate")! as? [String]
        if(UserDefaults.standard.array(forKey: "MyDate")! as? [String] == nil){
            favoriteDates = []
        }
        self.favoriteScores = UserDefaults.standard.array(forKey: "MyScore")! as? [Double]
        if(UserDefaults.standard.array(forKey: "MyScore")! as? [Double] == nil){
            favoriteScores = []
        }
        self.favoritePaths = UserDefaults.standard.array(forKey: "MyImageString")! as? [String]
        if(UserDefaults.standard.array(forKey: "MyImageString")! as? [String] == nil){
            favoritePaths = []
        }
        self.favoriteOverviews = UserDefaults.standard.array(forKey: "MyOverview")! as? [String]
        if(UserDefaults.standard.array(forKey: "MyOverview")! as? [String] == nil){
            favoriteOverviews = []
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.favoriteNames = UserDefaults.standard.array(forKey: "MyName")! as? [String]
        self.favoriteIDs = UserDefaults.standard.array(forKey: "MyID")! as? [Int]
        self.favoriteDates = UserDefaults.standard.array(forKey: "MyDate")! as? [String]
        self.favoriteScores = UserDefaults.standard.array(forKey: "MyScore")! as? [Double]
        self.favoritePaths = UserDefaults.standard.array(forKey: "MyImageString")! as? [String]
        self.favoriteOverviews = UserDefaults.standard.array(forKey: "MyOverview")! as? [String]
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if(editingStyle == .delete){
            let title = tableView.cellForRow(at: indexPath)?.textLabel!.text
            for i in 0...self.favoriteNames.count{
                if(self.favoriteNames[i] == title){
                    print(favoriteIDs[i])
                    //Remove favorite names
                    self.favoriteNames.remove(at: i)
                    UserDefaults.standard.set(self.favoriteNames, forKey: "MyName")
                    self.favoriteNames = UserDefaults.standard.array(forKey: "MyName")! as? [String]
                    
                    //Remove favorite IDs
                    self.favoriteIDs.remove(at: i)
                    UserDefaults.standard.set(self.favoriteIDs, forKey: "MyID")
                    self.favoriteIDs = UserDefaults.standard.array(forKey: "MyID")! as? [Int]
                    
                    //Remove favorite Dates
                    self.favoriteDates.remove(at: i)
                    UserDefaults.standard.set(self.favoriteDates, forKey: "MyDate")
                    self.favoriteDates = UserDefaults.standard.array(forKey: "MyDate")! as? [String]
                    
                    //Remove favorite Scores
                    self.favoriteScores.remove(at: i)
                    UserDefaults.standard.set(self.favoriteScores, forKey: "MyScore")
                    self.favoriteScores = UserDefaults.standard.array(forKey: "MyScore")! as? [Double]

                    //Remove favorite strings
                    self.favoritePaths.remove(at: i)
                    UserDefaults.standard.set(self.favoritePaths, forKey: "MyImageString")
                    self.favoritePaths = UserDefaults.standard.array(forKey: "MyImageString")! as? [String]
                    
                    //Remove favorite overviews
                    self.favoriteOverviews.remove(at: i)
                    UserDefaults.standard.set(self.favoriteOverviews, forKey: "MyOverview")
                    self.favoriteOverviews = UserDefaults.standard.array(forKey: "MyOverview")! as? [String]
                    break
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let index = indexPath.section*3 + indexPath.row
        let detailedVC = DetailedViewController()
        
        let imageURL = "https://image.tmdb.org/t/p/w185" + favoritePaths[index]
        let url = URL(string: imageURL)
        let data = try? Data(contentsOf: url!)
        if(data != nil){
            let image = UIImage(data: data!)
            detailedVC.image = image
        }
        else{
            detailedVC.image = UIImage(named: "notfound.png")!
        }
        
        detailedVC.movieID = favoriteIDs[index]
        detailedVC.titleName = favoriteNames[index]
        detailedVC.releasedDate = favoriteDates[index]
        detailedVC.score = favoriteScores[index]
        detailedVC.overview = favoriteOverviews[index]
        
        navigationController?.pushViewController(detailedVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        true
    }
    
    @IBAction func clearFavorites(_ sender: Any) {
        self.favoriteNames = []
        self.favoriteIDs = []
        self.favoriteDates = []
        self.favoriteScores = []
        self.favoritePaths = []
        self.favoriteOverviews = []
        favoriteTableView.reloadData()
        
        UserDefaults.standard.set([], forKey: "MyName")
        UserDefaults.standard.set([], forKey: "MyID")
        UserDefaults.standard.set([], forKey: "MyDate")
        UserDefaults.standard.set([], forKey: "MyScore")
        UserDefaults.standard.set([], forKey: "MyImageString")
        UserDefaults.standard.set([], forKey: "MyOverview")
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
