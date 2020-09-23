//
//  Post.swift
//  3.3-Reddit
//
//  Created by Jason Koceja on 9/23/20.
//

import Foundation

struct TopLevelDictionary : Decodable {
    let data: SecondLevelDictionary
}

struct SecondLevelDictionary : Decodable {
    let dist: Int
    let children: [ThirdLevelObject]
    let after: String?
    let before: String?
}

struct ThirdLevelObject : Decodable {
    let data: Post
}

struct Post : Decodable {
    let title: String
    let ups: Int
    let thumbnail: URL? // can be URL, "default" or "self"
}
