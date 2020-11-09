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
    var favoriteMovies: [String] = UserDefaults.standard.array(forKey: "MyKey")! as? [String] ?? []{
        didSet{
            favoriteTableView.reloadData();
        }
    }
    
    @IBOutlet weak var favoriteTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        favoriteTableView.dataSource = self
        favoriteTableView.delegate = self
        favoriteTableView.register(UITableViewCell.self, forCellReuseIdentifier: "favoriteCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.favoriteMovies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let myCell = UITableViewCell(style: .default, reuseIdentifier: "favoriteCell")
        myCell.textLabel!.text = self.favoriteMovies[indexPath.row]
        return myCell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if(editingStyle == .delete){
            let title = tableView.cellForRow(at: indexPath)?.textLabel!.text
            for i in 0...self.favoriteMovies.count{
                if(self.favoriteMovies[i] == title){
                    self.favoriteMovies.remove(at: i)
                    UserDefaults.standard.set(self.favoriteMovies, forKey: "MyKey")
                    break
                }
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
