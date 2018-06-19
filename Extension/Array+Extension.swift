//
// Created by Teruhiro Matsukawa on 2018/06/19.
// Copyright (c) 2018 Teruhiro Matsukawa. All rights reserved.
//

import Foundation
import UIKit

public extension Array where Element: Equatable
{
    @discardableResult
    public mutating func remove(element: Element) -> Index?
    {
        guard let index = index(of: element) else { return nil }
        remove(at: index)
        return index
    }

    @discardableResult
    public mutating func remove(elements: [Element]) -> [Index]
    {
        return elements.flatMap { remove(element: $0) }
    }
}

/**
    usage

    let array = ["foo", "bar"]
    array.remove(element: "foo")
    array //=> ["bar"]
*/