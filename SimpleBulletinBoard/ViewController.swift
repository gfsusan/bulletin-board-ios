//
//  ViewController.swift
//  SimpleBulletinBoard
//
//  Created by Susan Kim on 04/03/2019.
//  Copyright © 2019 Susan Kim. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UITableViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        loadPosts()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dataCenter.posts.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! PostCell
        
        cell.titleLabel.text = dataCenter.posts[indexPath.row].title
        cell.contentLabel.text = dataCenter.posts[indexPath.row].content

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    func loadPosts() {
        Alamofire.request(
            "http://hulk.zeyo.co.kr:5002/api/documents/",
            method: .get,
            parameters: [:],
            encoding: URLEncoding.default,
            headers: nil
            )
            .validate(statusCode: 200..<300)
            .responseJSON {
                response in
                if let result = response.result.value {
                    var postCount: Int = 0
                    let JSON = result as! NSArray
                    for postJSON in JSON {
                        guard let jsonData = postJSON as? Dictionary<String, Any> else {
                            continue
                        }
                        let title = jsonData["title"] as? String
                        let content = jsonData["content"] as? String
                        
                        guard let t = title, let c = content else {
                            continue
                        }
                        postCount = postCount + 1
                        dataCenter.posts.append(Post("\(postCount)", t, c))
                    }
                    
                    
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                    
                }
        }
    }
}
