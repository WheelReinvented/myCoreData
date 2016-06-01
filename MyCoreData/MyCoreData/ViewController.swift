//
//  ViewController.swift
//  MyCoreData
//
//  Created by Michal Wierzbinski on 26/05/2016.
//  Copyright © 2016 WheelReinvented. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{

    @IBOutlet weak var tableView: UITableView!
    
    var names = [String]()
    
    // MARK: UIViewController

    override func viewDidLoad()
    {
        super.viewDidLoad()
        title = "\"The List\""
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }

    // MARK: ViewController
    
    @IBAction func addAction(sender: AnyObject)
    {
        let alert = UIAlertController(title: "New Name", message: "Add a new name", preferredStyle: .Alert)
        
        let saveAction = UIAlertAction(title: "Save", style: .Default) { (action: UIAlertAction) -> Void in
            let textField = alert.textFields!.first
            self.names.append(textField!.text!)
            self.tableView.reloadData()
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Default) { (action: UIAlertAction) -> Void in
            
        }
        
        alert.addTextFieldWithConfigurationHandler { (textField: UITextField) -> Void in
            
        }
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        presentViewController(alert, animated: true, completion: nil)
        
    }
}

extension ViewController: UITableViewDataSource
{
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return names.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell")
        
        cell!.textLabel!.text = names[indexPath.row]
        
        return cell!
    }
}

