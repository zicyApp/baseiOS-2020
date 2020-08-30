//
//  AsyncOperator.swift
//  iosbase2020
//
//  Created by Robert Polovitzer on 2020-08-30.
//  Copyright © 2020 Robert Polovitzer. All rights reserved.
//

import Foundation

/// A class that represent an abstract asynchronous operation.
open class AsyncOperation: Operation {
    /**
     Possible operation State.
     
     - ready: Ready to execute .
     - executing: Executing.
     - finished: Done.
     */
    
    public enum State: String {
        /// Value indicating whether the operation can be performed now.
        case ready
        /// Value indicating whether the operation is currently executing its main task.
        case executing
        /// Value indicating whether the operation has finished its main task.
        case finished
        
        fileprivate var keyPathOld: String {
            return "is" + rawValue.capitalized
        }
        
        @available(iOS 11, *)
        fileprivate var keyPathNew: KeyPath<AsyncOperation, Bool> {
            switch self {
            case .ready:
                return \AsyncOperation.isReady
            case .executing:
                return \AsyncOperation.isExecuting
            case .finished:
                return \AsyncOperation.isFinished
            }
        }
    }
    
    /**
     Setting this state variable will change the internal state of the operation through KVO.
     */
    
    public var state = State.ready {
        willSet {
            guard #available(iOS 11, *) else {
                willChangeValue(forKey: newValue.keyPathOld)
                willChangeValue(forKey: self.state.keyPathOld)
                return
            }
            
            self.willChangeValue(for: newValue.keyPathNew)
            self.willChangeValue(for: self.state.keyPathNew)
            
        }
        didSet {
            guard #available(iOS 11, *) else {
                didChangeValue(forKey: oldValue.keyPathOld)
                didChangeValue(forKey: self.state.keyPathOld)
                return
            }
            self.didChangeValue(for: oldValue.keyPathNew)
            self.didChangeValue(for: self.state.keyPathNew)
        }
    }
}

// An extension giving the desired asynchronous behaviour.
extension AsyncOperation {
    // Operation overrides
    
    /**
     A Boolean value indicating whether the operation can be performed now.
     The readiness of operations is determined by their dependencies on other operations and potentially by custom conditions
     that you define. The Operation class manages dependencies on other operations and reports the readiness of the receiver based on those dependencies.
     */
    override open var isReady: Bool {
        return super.isReady && self.state == .ready
    }
    
    /**
     The value of this property is true if the operation is currently executing its main task or false if it is not.
     */
    override open var isExecuting: Bool {
        return self.state == .executing
    }
    
    /**
     The value of this property is true if the operation has finished its main task or false if it is executing that task or has not yet started it.
     */
    override open var isFinished: Bool {
        return self.state == .finished
    }
    
    /**
     The value of this property is true for operations that run asynchronously with respect to the current thread or false for operations that run
     synchronously on the current thread. The default value of this property is false.
     */
    override open var isAsynchronous: Bool {
        return true
    }
    
    /**
     Begins the execution of the operation. If the operation is cancelled, the operation finishes instantly.
     */
    override open func start() {
        if self.isCancelled {
            self.state = .finished
            return
        }
        
        self.state = .executing
        self.main()
    }
    
    /**
     Advises the operation object that it should stop executing its task if it is not already executing.
     */
    open override func cancel() {
        super.cancel()
    }
}
