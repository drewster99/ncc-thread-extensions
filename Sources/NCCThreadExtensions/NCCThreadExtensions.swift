// NCCThreadExtensions.swift
// Copyright (C) 2019-2020 Nuclear Cyborg Corp
//
// db@nuclearcyborg.com

import Foundation

extension Thread {
    /// Ensures a block is performed on the main thread, dispatching synchronously if needed
    /// - Parameter work: The work to be performed.
    public static func onMain(_ work: () -> Void) {
        if isMainThread {
            work()
        } else {
            DispatchQueue.main.sync {
                work()
            }
        }
    }

    /// Ensures a block is performed on the main thread, dispatching synchronously if needed
    /// - Parameter work: The work to be performed
    ///
    /// - Returns: Whatever you like.
    public static func onMain<T>(_ work: () -> T) -> T {
        if isMainThread {
            return work()
        } else {
            var _result: T?
            var result: T {
                get { _result! }
                set { _result = newValue }
            }
            DispatchQueue.main.sync {
                result = work()
            }
            return result
        }
    }
}
