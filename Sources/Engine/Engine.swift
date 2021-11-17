//
//  Engine.swift
//  Starscream
//
//  Created by Dalton Cherry on 6/15/19.
//  Copyright © 2019 Vluxe. All rights reserved.
//

import Foundation

public enum HeaderKey: String {
    case WSProtocolName = "Sec-WebSocket-Protocol"
}

public protocol EngineDelegate: AnyObject {
    func didReceive(event: WebSocketEvent)
}

public protocol Engine {
    func register(delegate: EngineDelegate)
    func start(url: URL)
    func stop(closeCode: UInt16)
    func forceStop()
    func write(data: Data, opcode: FrameOpCode, completion: (() -> ())?)
    func write(string: String, completion: (() -> ())?)
}
