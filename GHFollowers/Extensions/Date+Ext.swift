//
//  Date+Ext.swift
//  GHFollowers
//
//  Created by Pasya Sahas on 3/19/25.
//

import Foundation

extension Date {
    
    func convertTOMonthYearFormat() -> String {
        return formatted(.dateTime.month().year())
    }
}
