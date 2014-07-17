//
//  loadDataController.swift
//  sampleSwift
//
//  Created by SivaSankar on 08/07/14.
//  Copyright (c) 2014 Paradim Creatives. All rights reserved.
//

import Foundation
import UIKit

class loadDataController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate{
    

    @IBOutlet var tableView : UITableView = nil
    var dataSourceArray:NSMutableArray = NSMutableArray()
    var headerView:UIView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self;
        self.tableView.delegate = self;
        
        headerView.frame = CGRectMake(0, 0, 320, 200)
        headerView.backgroundColor = UIColor.blackColor()
        self.tableView.tableHeaderView = headerView
        
        var headerTextField:UITextField = UITextField(frame: CGRectMake(0, 0, 150, 45))
        headerTextField.center = headerView.center
        headerTextField.placeholder = "Enter You Name"
        headerTextField.textAlignment = NSTextAlignment.Center
        headerTextField.backgroundColor = UIColor.whiteColor()
        headerTextField.delegate = self
        headerView.addSubview(headerTextField)
        
        
    }
    func textFieldShouldReturn(textField: UITextField!) -> Bool
    {
        textField.resignFirstResponder()
        dataSourceArray.addObject(textField.text as String)
        self.tableView.reloadData()
        textField.text = ""
        
        return true
    }
    func numberOfSectionsInTableView(tableView: UITableView!) -> Int{
        return 1
    }
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int{
        return self.dataSourceArray.count
    }
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell!{
        let identifier:String = "cellIdentifier"
        var cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier(identifier) as UITableViewCell
        if cell == nil
        {
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: identifier)
        }
        cell.text = "Hello \(dataSourceArray.objectAtIndex(indexPath.row))"
        return cell
    }
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!)
    {
        var alert:UIAlertController = UIAlertController(title: "Message", message: "Thanks for clicking me", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Cancle", style: UIAlertActionStyle.Default , handler: nil))
        
        alert.addAction(UIAlertAction(title: "Change Head Color", style: UIAlertActionStyle.Default, handler: {alertAction in UIView.animateWithDuration(2.5, animations: {self.headerView.backgroundColor = UIColor.blueColor()}, completion: {_ in
                println("the action is completed")
            })
            }))
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    @IBAction func BackToRootView(sender : UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil);
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
}