//
//  DetailVC.swift
//  SimpleBulletinBoard
//
//  Created by Susan Kim on 05/03/2019.
//  Copyright © 2019 Susan Kim. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {

    var post:Post?
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        guard let currentPost = post else {
            return
        }
        
        titleLabel.text = currentPost.title
        contentLabel.text = currentPost.content
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func deletePressed(_ sender: Any) {
        if let validID = post?.number {
            dataCenter.deletePost(name: validID, completionHandler: { error in
                if error == nil {
                    self.navigationController?.popViewController(animated: true)
                } else {
                    let alert = UIAlertController(title: "Unable to delete post.", message: "Please try again.", preferredStyle: .alert)
                    let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                    alert.addAction(defaultAction)
                    self.present(alert, animated: true)
                }
            })
        }
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if let destinationNavigationController = segue.destination as? UINavigationController {
            let targetController = destinationNavigationController.topViewController as? ModifyVC
            targetController?.post = self.post
            targetController?.detailVCDelegate = self
        }
        
    }

}
