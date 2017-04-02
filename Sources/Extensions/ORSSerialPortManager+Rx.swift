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
    func observable() -> Observable<ORSSerialPort> {
        return Observable.create { observer -> Disposable in
            self.base.availablePorts.forEach {
                observer.onNext($0)
            }

            observer.on(.completed)
            return Disposables.create()
        }
    }
}
/*
 
 _ = NotificationCenter.default.rx.notification(.ORSSerialPortsWereConnected).subscribe { (event) in

 }

 _ = NotificationCenter.default.rx.notification(.ORSSerialPortsWereDisconnected).subscribe { (event) in

 }

 */
