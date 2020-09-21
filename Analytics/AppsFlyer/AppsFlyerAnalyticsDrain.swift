//
//  Copyright © 2020 pocket-ninja. All rights reserved.
//

import Foundation
import AppsFlyerLib

final class AppsFlyerAnalyticsDrain: AnalyticsDrain {
    func track(_ event: AnalyticsEvent) {
        switch event {
        case .error, .plain:
            return
        case .purchase:
            AppsFlyerLib.shared().logEvent("Original Purchase", withValues: [:])
        }
    }
}
