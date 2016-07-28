//: Playground - noun: a place where people can play
import Foundation
import UIKit

let items = NSMutableArray()
items.addObject("first string")
items.addObject("second string")
items.addObject("third string")
items.addObject(5)
items.addObject(7)
let item = items.firstObject



extension NSMutableArray {
    func middleObject() -> AnyObject? {
        let middle = self.count % 2 == 1
        if middle {
            return self[self.count/2]
        }
        return nil
    }
}

items.middleObject()

for item in items {
    if let item = item as? String {
        print("I found this string \(item)")
    }
    else if let item = item as? Int {
        print("I found this number \(item)")
    }
}

