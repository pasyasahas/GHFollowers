//
//  GFButton.swift
//  GHFollowers
//
//  Created by Pasya Sahas on 3/10/25.
//

import UIKit

class GFButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    convenience init(color: UIColor, title: String, systemImmageName: String) {
        self.init(frame: .zero)
        set(color: color, title: title, systemImmageName: systemImmageName)
    }
    
    
    private func configure() {
        configuration = .tinted()
        configuration?.cornerStyle = .medium
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    
    final func set(color: UIColor, title: String, systemImmageName: String) {
        configuration?.baseBackgroundColor = color
        configuration?.baseForegroundColor = color
        configuration?.title = title
        
        configuration?.image = UIImage(systemName: systemImmageName)
        configuration?.imagePadding = 6
        configuration?.imagePlacement = .leading
    }
    
}

#Preview {
    GFButton(color: .systemBlue, title: "Preview", systemImmageName: "plus")
}
