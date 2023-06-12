//
//  UITableView+Ext.swift
//  KSI-Task
//
//  Created by Mohamed Moustafa on 10/06/2023.
//

import UIKit

extension UITableView {
    func registerNibForTable<T: UITableViewCell>(ofType type: T.Type) {
        let cellName = String(describing: T.self)
        
        if Bundle.main.path(forResource: cellName, ofType: "nib") != nil {
            let nib = UINib(nibName: cellName, bundle: Bundle.main)
            
            register(nib, forCellReuseIdentifier: cellName)
        } else {
            register(T.self, forCellReuseIdentifier: cellName)
        }
    }
    public func dequeueCellForTable<Cell: UITableViewCell>(ofType type: Cell.Type) -> Cell {
        let identifier = String(describing: Cell.self)

        guard let cell = self.dequeueReusableCell(withIdentifier: identifier) as? Cell else {
            
            fatalError("Error in cell")
        }
        return cell
    }
    
    func registerHeaderForTable<T: UITableViewHeaderFooterView>(ofType type: T.Type) {
        let cellName = String(describing: T.self)
        
        if Bundle.main.path(forResource: cellName, ofType: "nib") != nil {
            let nib = UINib(nibName: cellName, bundle: Bundle.main)
            
            register(nib, forHeaderFooterViewReuseIdentifier: cellName)
        } else {
            register(T.self, forHeaderFooterViewReuseIdentifier: cellName)
        }
    }
    public func dequeueHeaderForTable<Cell: UITableViewHeaderFooterView>(ofType type: Cell.Type) -> Cell {
        let identifier = String(describing: Cell.self)
        
        guard let header = self.dequeueReusableHeaderFooterView(withIdentifier: identifier) as? Cell else {
            fatalError("Error in header")
        }
        return header
    }
}
