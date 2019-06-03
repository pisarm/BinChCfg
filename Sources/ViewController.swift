//
//  ViewController.swift
//  BinChCfg
//
//  Created by Flemming Pedersen on 31/03/2017.
//  Copyright © 2017 pisarm.dk. All rights reserved.
//

import Cocoa
import ORSSerial
import RxCocoa
import RxSwift


final class ViewController: NSViewController {
    private let viewModel: ViewModel = ViewModel()
    private let disposeBag: DisposeBag = DisposeBag()

    @IBOutlet private weak var serialPortPopUpButton: NSPopUpButton!
    @IBOutlet private weak var syncTimeButton: NSButton!

    override func viewDidLoad() {
        super.viewDidLoad()

//        viewModel.serialPortsObservable.subscribe(onNext: { serialPorts in
//            self.serialPortPopUpButton.removeAllItems()
//            serialPorts.forEach { self.serialPortPopUpButton.addItem(withTitle: $0.name) }
//
//        }, onError: nil, onCompleted: nil, onDisposed: nil).addDisposableTo(disposeBag)
    }
}

