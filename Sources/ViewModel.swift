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

    private let serialPortsVariable: Variable<[ORSSerialPort]> = Variable([])
    private let disposeBag = DisposeBag()
    private let serialPortManager: ORSSerialPortManager = ORSSerialPortManager()

    public init() {
        serialPortManager.rx.observable().subscribe(onNext: { [weak self] serialPort in
            self?.serialPortsVariable.value.append(serialPort)
        }).addDisposableTo(disposeBag)
    }
}
