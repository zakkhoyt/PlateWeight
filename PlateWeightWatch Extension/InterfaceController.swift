//
//  InterfaceController.swift
//  PlateWeightWatch Extension
//
//  Created by Zakk Hoyt on 10/1/15.
//  Copyright © 2015 Zakk Hoyt. All rights reserved.
//

import WatchKit
import Foundation
//import ZHConverter
import WatchConnectivity

class InterfaceController: WKInterfaceController {

    private let session : WCSession? = WCSession.isSupported() ? WCSession.defaultSession() : nil
    
    @IBOutlet var weightTable: WKInterfaceTable!
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)

        session?.delegate = self
        session?.activateSession()
        
        dispatch_after(5, dispatch_get_main_queue()) { () -> Void in
            self.sendMessageWithData(44.55)
        }
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        reloadTable()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    func reloadTable() {
        weightTable.setNumberOfRows(100, withRowType: "ZHWeightRow")
        
        for i in 0..<100 {
            let row = weightTable.rowControllerAtIndex(i) as! ZHWeightRow
            let kgs = Double((i+1)*5)
            let kgsString = NSString(format: "%.2f", kgs) as String
            row.kgsLabel.setText(kgsString)
            let lbsString = NSString(format: "%.2f", ZHConverter.kilogramsToPounds(kgs)) as String
            row.lbsRow.setText(lbsString)
        }
    }
    
    override func table(table: WKInterfaceTable, didSelectRowAtIndex rowIndex: Int) {
        self.sendMessageWithData(66.77)
    }
    
    func sendMessageWithData(data: Double){
        let applicationData = ["kgs" : data]
        
        // The paired iPhone has to be connected via Bluetooth.
        if let session = self.session where session.reachable {
            session.sendMessage(applicationData,
                replyHandler: { replyData in
                    // handle reply from iPhone app here
                    print(replyData)
                }, errorHandler: { error in
                    // catch any errors here
                    print(error)
            })
        } else {
            // when the iPhone is not connected via Bluetooth
            print("uh oh")
        }

    }
}

extension InterfaceController: WCSessionDelegate {
    
}

