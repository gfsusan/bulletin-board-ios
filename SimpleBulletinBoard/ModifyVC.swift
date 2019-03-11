//
//  ModifyVC.swift
//  SimpleBulletinBoard
//
//  Created by Susan Kim on 06/03/2019.
//  Copyright © 2019 Susan Kim. All rights reserved.
//

import UIKit

class ModifyVC: UIViewController {

    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var contentField: UITextView!
    
    var post:Post?
    var detailVCDelegate:DetailVC?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let currentPost = post else {
            return
        }
        
        titleField.text = currentPost.title
        contentField.text = currentPost.content
    }
    
    @IBAction func savePressed(_ sender: Any) {
        guard let currentPost = post else {
            return
        }
        
        guard let titleText = titleField.text, let contentText = contentField.text else {
            // TODO 알림
            return
        }
        
        dataCenter.modifyPost(number: currentPost.number, title: titleText, content: contentText) { error in
            if error == nil {
                let modifiedPost = Post(currentPost.number, titleText, contentText)
                self.post = modifiedPost
                
                self.detailVCDelegate?.post = self.post
                self.dismiss(animated: true, completion: nil)
            } else {
                let alert = UIAlertController(title: "Unable to modify post.", message: "Please try again later.", preferredStyle: .alert)
                let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                alert.addAction(defaultAction)
                self.present(alert, animated: true)
            }
        }
    }
    
    @IBAction func cancelPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
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
