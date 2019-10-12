//
//  TableViewCellViewModel.swift
//  employee-audit
//
//  Created by Konstantin Igorevich on 11.10.2019.
//  Copyright © 2019 Konstantin Igorevich. All rights reserved.
//

import Foundation

class TableViewCellViewModel: TableViewCellViewModelType {
    
    private let employee: EmployeeModel
    
    var name: String {
        return employee.name
    }
    
    var index: String {
        return employee.index
    }
    
    
    init(employee: EmployeeModel) {
        self.employee = employee
    }
    
}
