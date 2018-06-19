//
// Created by Teruhiro Matsukawa on 2018/06/19.
// Copyright (c) 2018 Teruhiro Matsukawa. All rights reserved.
//

import Foundation

public protocol ClassNameProtocol
{
    static var className: String { get }
    var className: String { get }
}

public extension ClassNameProtocol
{
    public static var className: String
    {
        return String(describing: self)
    }

    public var className: String
    {
        return type(of: self).className
    }
}

extension NSObject: ClassNameProtocol {}

/**
    usage

    UIView.className   //=> "UIView"
    UILabel().className //=> "UILabel"
*/

public extension NSObjectProtocol
{
    public var describedProperty: String
    {
        let mirror = Mirror(reflecting: self)
        return mirror.children.map { element -> String in
                    let key = element.label ?? "Unknown"
                    let value = element.value
                    return "\(key): \(value)"
                }
                .joined(separator: "\n")
    }
}

/**
    usage

    class Hoge: NSObject {
        var foo = 1
        let bar = "bar"
       }
    }

    Hoge().described // => "foo: 1\nbar: bar"
*/