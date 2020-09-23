//
//  PostController.swift
//  3.3-Reddit
//
//  Created by Jason Koceja on 9/23/20.
//

import Foundation
import UIKit.UIImage

struct StringConstants {
    fileprivate static let baseURL = "https://www.reddit.com"
    fileprivate static let endpointR = "r"
    fileprivate static let endpointFunny = "funny"
    fileprivate static let extensionJSON = "json"
}

class PostController {
    
    static func fetchPosts(completion: @escaping (Result<[Post], PostError>) -> Void) {
        guard let baseURL = URL(string: StringConstants.baseURL) else {return completion(.failure(.invalidURL))}
        let rComponentURL = baseURL.appendingPathComponent(StringConstants.endpointR)
        let funnyComponentURL = rComponentURL.appendingPathComponent(StringConstants.endpointFunny)
        let finalURL = funnyComponentURL.appendingPathExtension(StringConstants.extensionJSON)
        
        print("\(#function): \(#line) -- \(finalURL)")
        
        URLSession.shared.dataTask(with: finalURL) { (data, _, error) in
            if let error = error {
                return completion(.failure(.thrownError(error)))
            }
            
            guard let data = data else { return completion(.failure(.invalidData)) }
            
            do {
                let topLevelObject = try JSONDecoder().decode(TopLevelDictionary.self, from: data)
                let secondLevelObject = topLevelObject.data
                let thirdLevelObjects = secondLevelObject.children
                var posts: [Post] = []
                for object in thirdLevelObjects {
                    let post = object.data
                    posts.append(post)
                }
                return completion(.success(posts))
            } catch {
                return completion(.failure(.thrownError(error)))
            }
        }.resume()
    }
    
    static func fetchThumbnailForPost(post: Post, completion: @escaping (Result<UIImage, PostError>) -> Void) {
        guard let thumbnailURL = post.thumbnail else { return completion(.failure(.invalidURL))}
        print("[\(#function):\(#line)] -- URL: \(thumbnailURL)")
        URLSession.shared.dataTask(with: thumbnailURL) { (data, _, error) in
            if let error = error {
                return completion(.failure(.thrownImageError(error)))
            }
            
            guard let data = data else { return completion(.failure(.invalidData)) }
            guard let thumbImage = UIImage(data: data) else {
                return completion(.failure(.unableToDecode))
            }
            return completion(.success(thumbImage))
        }.resume()
    }
}
