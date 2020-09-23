//
//  PostError.swift
//  3.3-Reddit
//
//  Created by Jason Koceja on 9/23/20.
//

import Foundation

enum PostError : LocalizedError{
    case invalidURL
    case thrownError(Error)
    case invalidData
    case thrownImageError(Error)
    case unableToDecode
    
    var errorDescription: String? {
        switch self {
            
            case .invalidURL:
                return "The sever failed to reach the necessary URL"
            case .thrownError(let error):
                return "An error was thrown: \(error.localizedDescription)"
            case .invalidData:
                return "No data found"
            case .thrownImageError(let error):
                return "There was an error fetching the image: \(error.localizedDescription)"
            case .unableToDecode:
                return "There was an error decoding the data"
        }
    }
}
