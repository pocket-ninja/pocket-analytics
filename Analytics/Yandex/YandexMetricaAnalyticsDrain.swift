//
//  Copyright © 2022 sroik. All rights reserved.
//

import Foundation
import PocketAnalytics
import YandexMobileMetrica

public final class YandexMetricaAnalyticsDrain: AnalyticsDrain {
    public func track(_ event: AnalyticsEvent) {
        switch event {
        case let .plain(name, params, _):
            YMMYandexMetrica.reportEvent(name, parameters: params) { error in
                print("Yandex did fail to report event: \(error.localizedDescription)")
            }
        case .purchase, .error:
            return
        }
    }
}
