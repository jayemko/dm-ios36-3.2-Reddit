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
}
