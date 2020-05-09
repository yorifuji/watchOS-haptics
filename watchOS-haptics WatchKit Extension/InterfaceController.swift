//
//  InterfaceController.swift
//  watchOS-haptics WatchKit Extension
//
//  Created by yorifuji on 2020/05/09.
//  Copyright © 2020 yorifuji. All rights reserved.
//

import WatchKit
import Foundation

class MyRowController: NSObject {
    @IBOutlet weak var itemLabel: WKInterfaceLabel!
}

class InterfaceController: WKInterfaceController {

    @IBOutlet weak var table: WKInterfaceTable!

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
        loadItems()
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    override func table(_ table: WKInterfaceTable, didSelectRowAt rowIndex: Int) {
        print(#function)
        print(rowIndex)
        if let hapticType = WKHapticType(rawValue: rowIndex) {
            WKInterfaceDevice.current().play(hapticType)
        }
     }
}

extension InterfaceController {
    func loadItems() {
        let items = [
            "notification",
            "directionUp",
            "directionDown",
            "success",
            "failure",
            "retry",
            "start",
            "stop",
            "click"
        ]

        table.setNumberOfRows(items.count, withRowType: "MyRowController")

        for (index, item) in items.enumerated() {
            let row = table.rowController(at: index) as! MyRowController
            row.itemLabel.setText(item)
        }
    }
}
