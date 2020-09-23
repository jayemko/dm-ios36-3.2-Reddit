//
//  PostTableViewCell.swift
//  3.3-Reddit
//
//  Created by Jason Koceja on 9/23/20.
//

import UIKit

// MARK: - Protocol
protocol PresentErrorToUserDelegate: AnyObject {
    func presentError(error: LocalizedError)
}

class PostTableViewCell: UITableViewCell {
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var upvoteLabel: UILabel!
    
    // MARK: - Helper Functions and Methods
    
    // MARK: - Properties
    var post: Post? {
        didSet {
            updateViews()
        }
    }
    
    weak var delegate: PresentErrorToUserDelegate?
    
    func updateViews() {
        guard let post = post else { return }
        titleLabel.text = post.title
        upvoteLabel.text = "⬆\(post.ups)"
        thumbnailImageView.image = nil
        
        PostController.fetchThumbnailForPost(post: post) { (result) in
            DispatchQueue.main.async {
                switch result {
                    case .success(let image):
                        self.thumbnailImageView.image = image
                    case .failure(let error):
                        self.delegate?.presentError(error: error)
                        print("Error [\(#function):\(#line)] -- \(error.localizedDescription) \n---\n \(error)")
                }           
            }
        }
    }
}
