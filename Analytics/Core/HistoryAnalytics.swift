//
//  Copyright © 2020 sroik. All rights reserved.
//

import Foundation

public final class HistoryAnalytics: Analytics {
    public var events: [AnalyticsEvent] = []

    public init(storage: UserDefaults = UserDefaults.standard) {
        super.init(storage: storage, drains: [])
    }

    public override func track(_ event: AnalyticsEvent) {
        events.append(event)
    }
}

public extension AnalyticsDrain {
    var history: HistoryAnalytics? {
        return self as? HistoryAnalytics
    }
}
