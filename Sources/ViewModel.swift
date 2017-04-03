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
    public lazy var serialPortsObservable: Observable<[ORSSerialPort]> = self.serialPortsVariable.asObservable()

    private var serialPortsVariable: Variable<[ORSSerialPort]>
    private let disposeBag = DisposeBag()

    private let serialPortManager: ORSSerialPortManager = ORSSerialPortManager()

    init() {
        self.serialPortsVariable = Variable(serialPortManager.availablePorts)

        serialPortManager.rx.availablePorts()
            .subscribe { self.serialPortsVariable.value = $0.element ?? [] }
            .addDisposableTo(disposeBag)
    }
}
