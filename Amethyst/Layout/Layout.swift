//
//  Layout.swift
//  Amethyst
//
//  Created by Ian Ynda-Hummel on 12/3/15.
//  Copyright © 2015 Ian Ynda-Hummel. All rights reserved.
//

import Foundation
import Silica

public protocol WindowActivityCache {
    func windowIsActive(_ window: SIWindow) -> Bool
}

open class Layout: NSObject {
    open class var layoutName: String { return "" }
    open class var layoutKey: String { return "" }

    public let windowActivityCache: WindowActivityCache

    public required init(windowActivityCache: WindowActivityCache) {
        self.windowActivityCache = windowActivityCache
        super.init()
    }

    open func reflowOperationForScreen(_ screen: NSScreen, withWindows windows: [SIWindow]) -> ReflowOperation {
        fatalError()
    }

    open func shrinkMainPane() {}
    open func expandMainPane() {}
    open func increaseMainPaneCount() {}
    open func decreaseMainPaneCount() {}
    open func updateWithChange(_ windowChange: WindowChange) {}
    open func nextWindowIDCounterClockwise() -> CGWindowID? { return nil }
    open func nextWindowIDClockwise() -> CGWindowID? { return nil }
}
