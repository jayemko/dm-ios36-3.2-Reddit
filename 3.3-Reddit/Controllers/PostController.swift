//
//  PostController.swift
//  3.3-Reddit
//
//  Created by Jason Koceja on 9/23/20.
//


// https://www.reddit.com/r/funny/.json

import Foundation

struct StringConstants {
    fileprivate static let baseURL = "https://www.reddit.com"
    fileprivate static let endpointR = "r"
    fileprivate static let endpointFunny = "funny"
}

class PostController {
    
    static func fetchPosts(completion: @escaping (Result<[Post], PostError>) -> Void) {
        guard let baseURL = URL(string: StringConstants.baseURL) else {return completion(.failure(.invalidURL))}
        let rComponentURL = baseURL.appendingPathComponent(StringConstants.endpointR)
        let funnyComponentURL = rComponentURL.appendingPathComponent(StringConstants.endpointFunny)
        
        print("\(#function): \(#line) -- \(funnyComponentURL)")
    }
    
}
