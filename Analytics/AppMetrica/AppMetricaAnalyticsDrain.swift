//
//  Copyright © 2025 sroik. All rights reserved.
//

import Foundation
import PocketAnalytics
import AppMetricaCore

public final class AppMetricaAnalyticsDrain: AnalyticsDrain {
    public init() {}
    
    public func track(_ event: AnalyticsEvent) {
        switch event {
        case let .plain(name, params, _):
            AppMetrica.reportEvent(name: name, parameters: params) { error in
                print("Yandex did fail to report event: \(error.localizedDescription)")
            }
        case .purchase, .error:
            return
        }
    }
}
