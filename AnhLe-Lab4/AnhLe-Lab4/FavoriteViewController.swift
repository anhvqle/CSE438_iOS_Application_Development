//
//  FavoriteViewController.swift
//  AnhLe-Lab4
//
//  Created by Anh Le on 11/9/20.
//  Copyright © 2020 Anh Le. All rights reserved.
//

import UIKit

class FavoriteViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var favoriteArr:[Movie] = []
    var favoriteView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        favoriteView = UITableView(frame: CGRect(x: 0, y: view.frame.height, width: view.frame.width, height: view.frame.width - view.frame.height))
//        favoriteView.register(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
//        favoriteView.dataSource = self
//        favoriteView.delegate = self
//        view.addSubview(favoriteView)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoriteArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let myCell = UITableViewCell(style: .default, reuseIdentifier: nil)
        myCell.textLabel!.text = favoriteArr[indexPath.row]
        return myCell
    }
    
    func loadDatabase() {
        let thePath = Bundle.main.path(forResource: "favorites", ofType: "db")
        let contactDB = FMDatabase(path: thePath)
        if !(contactDB.open()){
            print("Unable to open database")
            return
            
        } else {
            do {
                let results = try contactDB.executeQuery("select * from person", values: nil)
                while(results.next()){
                    let movie = results.string(forColumn: "TITLE")
                    favoriteArr.append(movie!)
                    
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
