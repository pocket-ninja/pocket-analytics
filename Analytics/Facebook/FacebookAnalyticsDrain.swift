//
//  Copyright © 2020 pocket-ninja. All rights reserved.
//

import Foundation
import FBSDKCoreKit
import PocketAnalytics

public final class FacebookAnalyticsDrain: AnalyticsDrain {
    public let tracksPurchases: Bool
    
    public init(tracksPurchases: Bool) {
        self.tracksPurchases = tracksPurchases
    }

    public func track(_ event: AnalyticsEvent) {
        switch event {
        case let .plain(name, params, _):
            AppEvents.logEvent(
                AppEvents.Name(name),
                parameters: params
            )

        case let .purchase(_, _, params, price, priceLocale) where tracksPurchases:
            AppEvents.logPurchase(
                NSDecimalNumber(decimal: price).doubleValue,
                currency: priceLocale.currencyCode ?? "",
                parameters: params
            )
        case .error, .purchase:
            break
        }
    }
}
