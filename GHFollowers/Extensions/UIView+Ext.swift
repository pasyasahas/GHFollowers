//
//  UIView+Ext.swift
//  GHFollowers
//
//  Created by Pasya Sahas on 3/21/25.
//

import UIKit

extension UIView {
    
    func addSubviews(_ views: UIView...) {
        for view in views { addSubview(view) }
    }
}
