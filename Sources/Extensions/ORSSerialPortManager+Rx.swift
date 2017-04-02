//
//  ORSSerialPortManager+Rx.swift
//  BinChCfg
//
//  Created by Flemming Pedersen on 02/04/2017.
//  Copyright © 2017 pisarm.dk. All rights reserved.
//

import Foundation
import RxSwift
import ORSSerial

extension Reactive where Base: ORSSerialPortManager {
    func availablePorts() -> Observable<[ORSSerialPort]> {
        let connected = NotificationCenter.default.rx.notification(.ORSSerialPortsWereConnected)
        let disconnected = NotificationCenter.default.rx.notification(.ORSSerialPortsWereDisconnected)

        return Observable.of(connected, disconnected)
            .merge()
            .map { _ in return self.base.availablePorts }
    }
}
