//
//  FloatingLayout.swift
//  Amethyst
//
//  Created by Ian Ynda-Hummel on 12/14/15.
//  Copyright © 2015 Ian Ynda-Hummel. All rights reserved.
//

import Silica

public class FloatingLayout: Layout {
    private class FloatingReflowOperation: ReflowOperation {}

    override public static var layoutName: String { return "Floating" }
    override public static var layoutKey: String { return "floating" }

    override public func reflowOperationForScreen(_ screen: NSScreen, withWindows windows: [SIWindow]) -> ReflowOperation {
        return FloatingReflowOperation(screen: screen, windows: windows, windowActivityCache: windowActivityCache)
    }
}
