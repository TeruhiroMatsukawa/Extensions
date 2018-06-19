//
// Created by Teruhiro Matsukawa on 2018/06/19.
// Copyright (c) 2018 Teruhiro Matsukawa. All rights reserved.
//

import Foundation

public extension String
{
    public var localized: String
    {
        return NSLocalizedString(self, comment: self)
    }

    public func localized(withTableName tableName: String? = nil, bundle: Bundle = Bundle.main, value: String = "") -> String
    {
        return NSLocalizedString(self, tableName: tableName, bundle: bundle, value: value, comment: self)
    }
}