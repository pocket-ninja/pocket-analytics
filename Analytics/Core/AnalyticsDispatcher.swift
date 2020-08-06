//
//  Copyright © 2020 sroik. All rights reserved.
//

import Foundation

final class AnalyticsDispatcher {
    init(storage: UserDefaults) {
        self.storage = storage
    }

    func once(for key: String, action: () -> Void) {
        synchronized(self) {
            if storage.bool(forKey: key) == true {
                return
            }

            storage.set(true, forKey: key)
            action()
        }
    }

    private let storage: UserDefaults
}
