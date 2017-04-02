//
//  ViewModel.swift
//  BinChCfg
//
//  Created by Flemming Pedersen on 31/03/2017.
//  Copyright © 2017 pisarm.dk. All rights reserved.
//

import Foundation
import ORSSerial
import RxCocoa
import RxSwift

final class ViewModel {
    public var serialPortsObservable: Observable<[ORSSerialPort]> {
        return self.serialPortManager.rx.availablePorts()
    }

    private let serialPortManager: ORSSerialPortManager = ORSSerialPortManager()
}
