//
//  ViewController.swift
//  BinChCfg
//
//  Created by Flemming Pedersen on 31/03/2017.
//  Copyright © 2017 pisarm.dk. All rights reserved.
//

import Cocoa
import ORSSerial

final class ViewController: NSViewController {
    var viewModel: ViewModel = ViewModel()

    @IBOutlet private weak var serialPortPopUpButton: NSPopUpButton!
    @IBOutlet private weak var syncTimeButton: NSButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        let manager = ORSSerialPortManager()
        serialPortPopUpButton.addItems(withTitles: manager.availablePorts.map { $0.name })
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

