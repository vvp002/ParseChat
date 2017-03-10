//
//  ChatViewController.swift
//  ParseChat
//
//  Created by Vivian Pham on 2/23/17.
//  Copyright © 2017 Vivian Pham. All rights reserved.
//

import UIKit
import Parse

class ChatViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var messageField: UITextField!
    
    @IBOutlet weak var tableView: UITableView!
    
    var messages:[PFObject]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.rowHeight = UITableViewAutomaticDimension
        // Do any additional setup after loading the view.
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ChatViewController.onTimer), userInfo: nil, repeats: true)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func sendMessage(_ sender: Any) {
        var message = PFObject(className:"Message")
        message["text"] = messageField.text
        message["user"] = PFUser.current()

        
        message.saveInBackground(block: {(success, error) -> Void in
            if let error = error {
                // Show the errorString somewhere and let the user try again.
                let alertController = UIAlertController(title: "Title", message: "Message", preferredStyle: .alert)
                // create a cancel action
                let cancelAction = UIAlertAction(title: "OK", style: .cancel) { (action) in
                    // handle cancel response here. Doing nothing will dismiss the view.
                }
                // add the cancel action to the alertController
                alertController.addAction(cancelAction)
                
                // create an OK action
                let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
                    // handle response here.
                }
                // add the OK action to the alert controller
                alertController.addAction(OKAction)
            } else {
                // Hooray! Let them use the app now.
                print(self.messageField.text! as String)
                
            }
        });

    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages?.count ?? 0
    }
    
    
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mycell") as! MyCellTableViewCell
        cell.messsageLabel.text = messages![indexPath.row]["text"] as? String;
        return cell
    }

    func onTimer() {
        // Add code to be run periodically
        
        var query = PFQuery(className:"Message")
        query.addAscendingOrder("createdAt")
        query.whereKey("user", equalTo: PFUser.current())
        query.findObjectsInBackground(block: { (objects: [PFObject]?, error) -> Void in
            if error == nil {
                // The find succeeded.
                print("Successfully retrieved \(objects!.count) scores.")
                // Do something with the found objects
                if let objects = objects {
                    for object in objects {
                        print(object.objectId)
                    }
                    self.messages = objects
                    self.tableView.reloadData()
                }
            } else {
                // Log details of the failure
                print("Error: \(error!)")
            }
        });
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
