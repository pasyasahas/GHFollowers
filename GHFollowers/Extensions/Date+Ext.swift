//
//  Date+Ext.swift
//  GHFollowers
//
//  Created by Pasya Sahas on 3/19/25.
//

import Foundation

extension Date {
    func convertTOMonthYearFormat() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM yyyy"
        return dateFormatter.string(from: self)
    }
}
