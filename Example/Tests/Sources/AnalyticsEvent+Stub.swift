//
//  Copyright © 2020 sroik. All rights reserved.
//

import PocketAnalytics

extension AnalyticsEvent {
    static let shot: AnalyticsEvent = .plain(name: "Shot")
    static let unique: AnalyticsEvent = .plain(name: "Unique", unique: true)
}
