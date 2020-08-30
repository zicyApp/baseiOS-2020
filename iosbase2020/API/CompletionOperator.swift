//
//  CompletionOperator.swift
//  iosbase2020
//
//  Created by Robert Polovitzer on 2020-08-30.
//  Copyright © 2020 Robert Polovitzer. All rights reserved.
//

import Foundation

class CompletionOperation<ResultableType: ResultProvider>: AsyncOperation {
    var resultable: ResultableType
    var completion:(_: Result<ResultableType.ResultType>) -> Void
    
    init(resultable: ResultableType, block: @escaping(_: Result<ResultableType.ResultType>) -> Void) {
        self.resultable = resultable
        self.completion = block
    }
    
    override func main() {
        self.completion(self.resultable.dataResult)
        self.state = .finished
    }
}

