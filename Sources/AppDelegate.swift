//
//  AppDelegate.swift
//  BinChCfg
//
//  Created by Flemming Pedersen on 31/03/2017.
//  Copyright © 2017 pisarm.dk. All rights reserved.
//

import Cocoa
import ORSSerial

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    func applicationDidFinishLaunching(_ aNotification: Notification) {

        if let serialPort = ORSSerialPort(path: "/dev/tty.usbserial-A7004IlM") {
            serialPort.delegate = self
            serialPort.baudRate = 115200
            serialPort.open()
            serialPort.send("get dow\r\n".data(using: String.Encoding.utf8)!)
//            serialPort.close()
        }
    }

    func applicationWillTerminate(_ aNotification: Notification) { }
}

extension AppDelegate: ORSSerialPortDelegate {
    func serialPortWasOpened(_ serialPort: ORSSerialPort) {
        print("succes")
    }

    func serialPortWasClosed(_ serialPort: ORSSerialPort) {
        print("closed")
    }

    func serialPortWasRemoved(fromSystem serialPort: ORSSerialPort) {
        print("qeh")
    }

    func serialPort(_ serialPort: ORSSerialPort, didReceive data: Data) {
        let string = String(data: data, encoding: .utf8)
        print("Sent: \(string)")
    }

    func serialPort(_ serialPort: ORSSerialPort, didReceiveResponse responseData: Data, to request: ORSSerialRequest) {
        let string = String(data: responseData, encoding: .utf8)
        print("Received: \(string)")
    }

    func serialPort(_ serialPort: ORSSerialPort, didReceivePacket packetData: Data, matching descriptor: ORSSerialPacketDescriptor) {
        let string = String(data: packetData, encoding: .utf8)
        print("PAcket: \(string)")
    }

    func serialPort(_ serialPort: ORSSerialPort, didEncounterError error: Error) {
        dump(error)
    }
}
