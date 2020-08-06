//
//  Copyright © 2020 sroik. All rights reserved.
//

import Foundation

@discardableResult
internal func synchronized<T>(_ lock: AnyObject, _ body: () throws -> T) rethrows -> T {
    objc_sync_enter(lock)
    defer { objc_sync_exit(lock) }
    return try body()
}
