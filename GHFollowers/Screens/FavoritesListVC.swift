//
//  FavoritesVC.swift
//  GHFollowers
//
//  Created by Pasya Sahas on 3/10/25.
//

import UIKit

class FavoritesListVC: GFDataLoadingVC {
    
    let tableview = UITableView()
    var favorites: [Follower] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        configureTableView()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getFavorites()
    }
    
    
    func configureViewController() {
        view.backgroundColor = .systemBackground
        title = "Favorites"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    
    func configureTableView() {
        view.addSubview(tableview)
        tableview.frame = view.bounds
        tableview.rowHeight = 80
        tableview.delegate = self
        tableview.dataSource = self
        tableview.register(FavoriteCell.self, forCellReuseIdentifier: FavoriteCell.resuseID)
        
    }
    
    
    func getFavorites() {
        PersistanceManager.retriveFavorites { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let favorites):
                updateUI(with: favorites)
                
            case .failure(let error):
                DispatchQueue.main.async {
                    self.presentGFAlert(title: "Something went wrong", message: error.rawValue, buttonTitle: "Ok")
                }
            }
        }
    }
    
    
    func updateUI(with favorites: [Follower]) {
        if favorites.isEmpty {
            self.showEmptyStateView(with: "No Favorites?\nAdd one on to the follwer Screen!", in: self.view)
        } else {
            self.favorites = favorites
            DispatchQueue.main.async {
                self.tableview.reloadData()
                self.view.bringSubviewToFront(self.tableview)
            }
        }
    }
}


extension FavoritesListVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favorites.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FavoriteCell.resuseID) as! FavoriteCell
        let favorite = favorites[indexPath.row]
        cell.set(favorite: favorite)
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let favorite = favorites[indexPath.row]
        let destVC = FollowerListVC(username: favorite.login)
        
        navigationController?.pushViewController(destVC, animated: true)
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        guard editingStyle == .delete else { return }

        PersistanceManager.updateWith(favorite: favorites[indexPath.row], actionType: .remove) { [weak self] error in
            guard let self = self else { return }
            guard let error = error else {
                self.favorites.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .left)
                if self.favorites.isEmpty {
                    self.showEmptyStateView(with: "No Favorites?\nAdd one on to the follwer Screen!", in: self.view)
                }
                return
            }
            DispatchQueue.main.async {
                self.presentGFAlert(title: "Something went wrong", message: error.rawValue, buttonTitle: "Ok")
            }
        }
    }
}
