//
// Created by Teruhiro Matsukawa on 2018/06/19.
// Copyright (c) 2018 Teruhiro Matsukawa. All rights reserved.
//

import Foundation

public extension Collection
{
    /// 配列外参照を防いで、要素を取得
    public subscript(safe index: Index) -> Element?
    {
        return startIndex <= index && index < endIndex ? self[index] : nil
    }
}

/**
    usage

    let array = [0, 1, 2]
    if let item = array[safe: 5] {
        print("unreachable")
    }
*/