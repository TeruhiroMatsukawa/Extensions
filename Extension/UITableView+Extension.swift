//
// Created by Teruhiro Matsukawa on 2018/06/19.
// Copyright (c) 2018 Teruhiro Matsukawa. All rights reserved.
//

import Foundation
import UIKit

extension UITableView
{

    public func register<T: UITableViewCell>(cellType: T.Type, bundle: Bundle? = nil)
    {
        let className = cellType.className
        let nib = UINib(nibName: className, bundle: bundle)
        register(nib, forCellReuseIdentifier: className)
    }

    public func register<T: UITableViewCell>(cellTypes: [T.Type], bundle: Bundle? = nil)
    {
        cellTypes.forEach { register(cellType: $0, bundle: bundle) }
    }

    public func dequeueReusableCell<T: UITableViewCell>(with type: T.Type, for indexPath: IndexPath) -> T
    {
        return self.dequeueReusableCell(withIdentifier: type.className, for: indexPath) as! T
    }

}

/**
    usage

    tableView.register(cellType: MyCell.self)
    tableView.register(cellTypes: [MyCell1.self, MyCell2.self])

    let cell = tableView.dequeueReusableCell(with: MyCell.self, for: indexPath)
*/