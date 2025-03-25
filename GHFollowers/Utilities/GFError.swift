//
//  GFError.swift
//  GHFollowers
//
//  Created by Pasya Sahas on 3/17/25.
//


import Foundation

enum GFError: String, Error {
    
    case invalidUserName = "This username created an invalid request. please try again."
    case unableToComplete = "Unable to complete your request please check your internet"
    case invalidResponse = "Invalid response from the server. Please try again."
    case invalidData = "The data recieved from the server is invalid. Please try again"
    case unableToFavorite = "Unable to add to favorites. Please try again"
    case alreadyInFavorites = "This user is already in your favorites"
}
