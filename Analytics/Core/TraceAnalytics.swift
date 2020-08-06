//
//  Copyright © 2020 sroik. All rights reserved.
//

import Foundation

public final class TraceAnalytics: AnalyticsDrain {
    public init() {}

    public func track(_ event: AnalyticsEvent) {
        #if DEBUG
            print("Analytics tracked event: \(event)")
        #endif
    }
}
