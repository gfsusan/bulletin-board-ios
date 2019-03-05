//
//  AddVC.swift
//  SimpleBulletinBoard
//
//  Created by Susan Kim on 05/03/2019.
//  Copyright © 2019 Susan Kim. All rights reserved.
//

import UIKit

class AddVC: UIViewController {

    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var contentField: UITextView!
    
    var detailVCDelegate: DetailVC?
    var post: Post?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if let currentPost = post {
            print("dlkfajlkdsfjk")
            titleField.text = currentPost.title
            contentField.text = currentPost.content
        }
    }
    

    @IBAction func savePressed(_ sender: Any) {
        let title = titleField.text!
        let content = contentField.text!
        
        if let currentPost = post {
            dataCenter.modifyPost(id: currentPost.number, title: title, content: content) {
                self.dismiss(animated: true, completion: nil)
            }
        } else {
            dataCenter.uploadPost(number: "1", title: title, content: content) {
                self.dismiss(animated: true, completion: nil)
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
