//
//  ZHKilogramsTableViewController.swift
//  PlateWeight
//
//  Created by Zakk Hoyt on 9/29/15.
//  Copyright © 2015 Zakk Hoyt. All rights reserved.
//

import UIKit

import WatchConnectivity


class ZHKilogramsTableViewController: UITableViewController {
    private let session: WCSession? = WCSession.isSupported() ? WCSession.defaultSession() : nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.navigationItem.title = "kgs to lbs";
        
        configureWCSession()
    }

    private func configureWCSession() {
        session?.delegate = self;
        session?.activateSession()
    }
}

extension ZHKilogramsTableViewController {
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

// MARK: WCSessionDelegate
extension ZHKilogramsTableViewController: WCSessionDelegate {
    
    func session(session: WCSession, didReceiveMessage message: [String : AnyObject], replyHandler: ([String : AnyObject]) -> Void) {
        
        //Use this to update the UI instantaneously (otherwise, takes a little while)
        dispatch_async(dispatch_get_main_queue()) {
            if let counterValue = message["kgs"] as? Int {
                print("message received")

//                self.counterData.append(counterValue)
//                self.mainTableView.reloadData()
            } else if let test = message["test"] as? Int {
                            }
        }
    }
}
