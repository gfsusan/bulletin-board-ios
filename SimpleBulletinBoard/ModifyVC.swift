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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let currentPost = post else {
            return
        }
        
        titleField.text = currentPost.title
        contentField.text = currentPost.content
    }
    
    @IBAction func savePressed(_ sender: Any) {
        
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
