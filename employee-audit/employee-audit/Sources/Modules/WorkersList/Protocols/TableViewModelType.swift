//
//  TableViewModelType.swift
//  employee-audit
//
//  Created by Konstantin Igorevich on 11.10.2019.
//  Copyright © 2019 Konstantin Igorevich. All rights reserved.
//

import Foundation

protocol TableViewModelType {
    var employees: [EmployeeModel] { get }
    var numberOfRows: Int { get }
    func loadData()
    func cellViewModel(forIndexPath indexPath: IndexPath) -> TableViewCellViewModelType
    func employeeRemove(at: IndexPath)
    func employeeInsert(_ employee: EmployeeModel, to: IndexPath)
}
