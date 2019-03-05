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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func savePressed(_ sender: Any) {
        var num = 1
        while (true) {
            if dataCenter.posts.filter({$0.number == String(num)}).isEmpty {
                break;
            } else {
                num = num + 1
            }
        }
        let title = titleField.text!
        let content = contentField.text!
        dataCenter.uploadPost(number: "\(num)", title: title, content: content) {
            // do nothing
        }
        self.dismiss(animated: true, completion: nil)
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
