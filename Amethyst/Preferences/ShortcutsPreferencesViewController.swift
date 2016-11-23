//
//  ShortcutsPreferencesViewController.swift
//  Amethyst
//
//  Created by Ian Ynda-Hummel on 5/15/16.
//  Copyright © 2016 Ian Ynda-Hummel. All rights reserved.
//

import CCNPreferencesWindowController_ObjC
import Cocoa
import Foundation
import MASShortcut

public class ShortcutsPreferencesViewController: NSViewController, CCNPreferencesWindowControllerProtocol, NSTableViewDataSource, NSTableViewDelegate {
    private var hotKeyNameToDefaultsKey: [[String]] = []
    @IBOutlet public var tableView: NSTableView?

    public override func awakeFromNib() {
        tableView?.dataSource = self
        tableView?.delegate = self
    }

    public override func viewWillAppear() {
        super.viewWillAppear()

        hotKeyNameToDefaultsKey = HotKeyManager.hotKeyNameToDefaultsKey()
        tableView?.reloadData()
    }

    public func preferenceIdentifier() -> String! {
        return NSStringFromClass(type(of: self))
    }

    public func preferenceIcon() -> NSImage! {
        return NSImage(named: NSImageNameAdvanced)
    }

    public func preferenceTitle() -> String! {
        return "Shortcuts"
    }

    public func numberOfRows(in tableView: NSTableView) -> Int {
        return hotKeyNameToDefaultsKey.count
    }

    public func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        let frame = NSRect(x: 0, y: 0, width: tableView.frame.size.width, height: 30)
        let shortcutItemView = ShortcutsPreferencesListItemView(frame: frame)
        let name = hotKeyNameToDefaultsKey[row][0]
        let key = hotKeyNameToDefaultsKey[row][1]

        shortcutItemView.nameLabel?.stringValue = name
        shortcutItemView.shortcutView?.associatedUserDefaultsKey = key

        return shortcutItemView
    }

    public func selectionShouldChange(in tableView: NSTableView) -> Bool {
        return false
    }
}
