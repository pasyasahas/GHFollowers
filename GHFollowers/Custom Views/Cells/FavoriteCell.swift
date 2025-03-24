//
//  FavoriteCell.swift
//  GHFollowers
//
//  Created by Pasya Sahas on 3/20/25.
//

import UIKit

class FavoriteCell: UITableViewCell {
    
    static let resuseID = "FavoriteCell"
    
    let avatarImageView = GFAvatarImageView(frame: .zero)
    let usernameLable = GFTitleLabel(textAlignment: .left, fontSize: 26)

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func set(favorite: Follower) {
        avatarImageView.downloadImage(fromURL: favorite.avatarUrl)
        usernameLable.text = favorite.login
    }
    
    
    private func configure() {
        addSubviews(avatarImageView, usernameLable)
        accessoryType = .disclosureIndicator
        let padding: CGFloat = 12
        
        NSLayoutConstraint.activate([
            avatarImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            avatarImageView.widthAnchor.constraint(equalToConstant: 60),
            avatarImageView.heightAnchor.constraint(equalToConstant: 60),
            
            usernameLable.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            usernameLable.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 24),
            usernameLable.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding),
            usernameLable.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
}
