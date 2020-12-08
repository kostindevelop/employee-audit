//
//  TableViewModel.swift
//  employee-audit
//
//  Created by Konstantin Igorevich on 11.10.2019.
//  Copyright © 2019 Konstantin Igorevich. All rights reserved.
//

import Foundation

class TableViewModel: TableViewModelType {

    var workers: [BaseModel] = []
    
    var numberOfRows: Int {
        return workers.count
    }
    
    func loadData() {
        workers = StorageService.shared.getAllWorkers()
    }
    
    func employeeRemove(at indexPath: IndexPath) {
        let worker = workers[indexPath.row]
        StorageService.shared.delete(object: worker)
        workers.remove(at: indexPath.row)
    }
    
    func employeeInsert(_ worker: BaseModel, to: IndexPath) {
        workers.insert(worker, at: to.row)
    }
    
    func cellViewModel(forIndexPath indexPath: IndexPath) -> TableViewCellViewModelType {
        let worker = workers[indexPath.row]
        return TableViewCellViewModel(employee: worker)
    }
    
}
