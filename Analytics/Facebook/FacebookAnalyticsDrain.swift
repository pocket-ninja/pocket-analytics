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
                parameters: params.fbFormatted()
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

private extension Dictionary where Key == String, Value == String {
    func fbFormatted() -> [AppEvents.ParameterName: String] {
        let keyValues: [(AppEvents.ParameterName, String)] = map {
            (AppEvents.ParameterName($0), $1)
        }
        
        return Dictionary<AppEvents.ParameterName, String>(uniqueKeysWithValues: keyValues)
    }
}
