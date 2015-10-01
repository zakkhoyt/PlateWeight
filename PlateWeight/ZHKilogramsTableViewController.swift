//
//  ZHKilogramsTableViewController.swift
//  PlateWeight
//
//  Created by Zakk Hoyt on 9/29/15.
//  Copyright © 2015 Zakk Hoyt. All rights reserved.
//

import UIKit

class ZHKilogramsTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.navigationItem.title = "kgs to lbs";
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 100
    }


    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ZHKilogramsTableViewCell", forIndexPath: indexPath) as! ZHKilogramsTableViewCell
        cell.kilograms = Double(indexPath.row * 5);
        return cell
    }

}
