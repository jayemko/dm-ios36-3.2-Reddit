//
//  ErrorActionSheetExtension.swift
//  3.3-Reddit
//
//  Created by Jason Koceja on 9/23/20.
//

import UIKit

extension UIViewController {
    func presentErrorToUser(localizedError: LocalizedError){
        let alertController = UIAlertController(title: "Error", message: localizedError.errorDescription, preferredStyle: .actionSheet)
        let cancelAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        
        alertController.addAction(cancelAction)
        present(alertController, animated: true)
    }
    
}
