//
//  GFRepoItemVC.swift
//  GHFollowers
//
//  Created by Pasya Sahas on 3/18/25.
//

import UIKit

protocol GFRepoItemVCDelegate: AnyObject {
    func didTapGithubProfile(for user: User)
}

class GFRepoItemVC: GFItemInfoVC {
    
    weak var delegate: GFRepoItemVCDelegate!
    
    
    init( user:User, delegate: GFRepoItemVCDelegate!) {
        super.init(user: user)
        self.delegate = delegate
    }
    
    
    @MainActor required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
    }
    
    
    private func configureItems() {
        itemInfoViewOne.set(itemInfoType: .repos, withCount: user.publicRepos)
        itemInfoViewTwo.set(itemInfoType: .gists, withCount: user.publicGists)
        actionButton.set(color: .systemPurple, title: "Github Profile", systemImmageName: "person")
    }
    
    
    override func actionButtonTapped() {
        delegate.didTapGithubProfile(for: user)
    }
}
