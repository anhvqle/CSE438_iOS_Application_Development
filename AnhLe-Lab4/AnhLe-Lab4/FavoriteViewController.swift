//
//  FavoriteViewController.swift
//  AnhLe-Lab4
//
//  Created by Anh Le on 11/9/20.
//  Copyright © 2020 Anh Le. All rights reserved.
//

import UIKit

class FavoriteViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    struct Movie: Decodable {
        let id: Int!
        let title: String
    }
    var favoriteArr:[Movie] = []
    @IBOutlet weak var favoriteTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        favoriteTableView.dataSource = self
        favoriteTableView.delegate = self
        loadDatabase()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoriteArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let myCell = UITableViewCell(style: .default, reuseIdentifier: nil)
        myCell.textLabel!.text = favoriteArr[indexPath.row].title
        return myCell
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        
//    }
    
    func loadDatabase() {
        let thePath = Bundle.main.path(forResource: "favorite", ofType: "db")
        let contactDB = FMDatabase(path: thePath)
        if !(contactDB.open()){
            print("Unable to open database")
            return
            
        } else {
            do {
                let results = try contactDB.executeQuery("select * from favoriteMovie", values: nil)
                while(results.next()){
                    let movie = Movie(id: Int(results.int(forColumn: "ID")), title: results.string(forColumn: "TITLE")!)
                    favoriteArr.append(movie)
                }
            } catch let error as NSError {
                print("failed \(error)")
            }
        }
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
