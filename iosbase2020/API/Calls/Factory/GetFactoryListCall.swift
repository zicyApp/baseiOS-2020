//
//  GetFactoryListCall.swift
//  iosbase2020
//
//  Created by Robert Polovitzer on 2020-08-30.
//  Copyright © 2020 Robert Polovitzer. All rights reserved.
//

import Foundation
import UIKit

struct GetFactoryListResponse : Codable {
    var count: Int? = nil
    var next: String? = nil
    var previous: String? = nil
    var results: [Factory]? = nil
}

struct GetFactoryListRequest {
    var offset: Int = 0
}

class GetFactoryListCall {
    
    private let proxy: AppProxy
    
    init(proxy: AppProxy) {
        self.proxy = proxy
    }
    
    func getFactories(request: GetFactoryListRequest, completionCall: @escaping FactoryLitsComp) {
        let opp = GetFactoryLitsOperation(request: request, proxy: self.proxy)
        let completionOpp = CompletionOperation(resultable: opp) { result in
            DispatchQueue.main.async {
                completionCall(result)
            }
        }
        
        completionOpp.addDependency(opp)
        let operationQueue = OperationQueue()
        operationQueue.addOperations([opp, completionOpp], waitUntilFinished: false)
    }
}

class GetFactoryLitsOperation: AsyncOperation, ResultProvider {
    
    init(request: GetFactoryListRequest, proxy: AppProxy) {
        self.proxy = proxy
        self.request = request
    }
    
    private var endPoint = AppProxy.EndPoints.Factory.list.rawValue
    var dataResult: Result<GetFactoryListResponse> = .error(error: OperationError.neverStarted)
    private let proxy: AppProxy
    private let request: GetFactoryListRequest
    
    override func main() {
        /*do {
            let parameters = try CodableUtils.convertToJSON(object: self.request)
            self.performCall(withParameters: parameters)
        } catch let error {
            let codingError = ProxyCodingError(orginalContext: error, endPoint: self.endPoint)
            self.dataResult = .error(error: codingError)
            self.state = .finished
        }*/
        self.performCall()
    }
    
    private func performCall() {
        let networking = self.proxy.getNetworkingWithAuth()
        print("post call \(self.endPoint + "?offset=\(request.offset)") started")
        networking.get(self.endPoint + "?offset=\(request.offset)") { (result) in
            print("post call \(self.endPoint) ended")
            print("post call result \(result)")
            switch result {
            case .success(let response):
                self.completeSuccess(withData: response.data)
            case .failure(let response):
                let networkError = ProxyNetworkError(orginalContext: response, endPoint: self.endPoint)
                self.dataResult = .error(error: networkError)
            }
            
            self.state = .finished
        }
    }
    
    private func completeSuccess(withData data: Data) {
        do {
            let account: GetFactoryListResponse = try CodableUtils.parseJSONObject(body: data)
            self.dataResult = .success(value: account)
        } catch let error {
            let codingError = ProxyCodingError(orginalContext: error, endPoint: self.endPoint)
            self.dataResult = .error(error: codingError)
        }
    }
}
