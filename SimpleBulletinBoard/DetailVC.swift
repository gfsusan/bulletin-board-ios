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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        guard let currentPost = post else {
            return
        }
        
        titleLabel.text = currentPost.title
        contentLabel.text = currentPost.content
    }
    
    @IBAction func deletePressed(_ sender: Any) {
        if let validID = post?.id {
            dataCenter.deletePost(id: validID, completionHandler: {
                self.dismiss(animated: true, completion: nil)
            })
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
