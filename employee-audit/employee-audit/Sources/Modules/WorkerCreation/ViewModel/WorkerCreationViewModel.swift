//
//  WorkerCreationViewModel.swift
//  employee-audit
//
//  Created by Konstantin Igorevich on 12.10.2019.
//  Copyright © 2019 Konstantin Igorevich. All rights reserved.
//

import Foundation

class WorkerCreationViewModel: WorkerCreationViewModelType {
    var typeController: TypeController = .create
    var worker: BaseModel?
}
