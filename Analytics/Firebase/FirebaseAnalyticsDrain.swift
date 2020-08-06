//
//  Copyright © 2020 pocket-ninja. All rights reserved.
//

import class FirebaseAnalytics.Analytics
import FirebaseCrashlytics
import Foundation

public final class FirebaseAnalyticsDrain: AnalyticsDrain {
    public init() {}

    public func track(_ event: AnalyticsEvent) {
        switch event {
        case let .plain(name, params, _):
            FirebaseAnalytics.Analytics.logEvent(
                name.whitespaceless,
                parameters: params.whitespaceless
            )
        case let .error(error):
            Crashlytics.crashlytics().record(error: error)
        case .purchase:
            /* Firebase tracks purchases automatically */
            break
        }
    }
}

private extension String {
    var whitespaceless: String {
        self.replacingOccurrences(of: " ", with: "_")
    }
}

private extension Dictionary where Key == String, Value == String {
    var whitespaceless: [Key: Value] {
        Dictionary(uniqueKeysWithValues: map {
            ($0.whitespaceless, $1.whitespaceless)
        })
    }
}
