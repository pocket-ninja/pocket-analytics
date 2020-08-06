//
//  Copyright © 2020 sroik. All rights reserved.
//

import Foundation

public enum AnalyticsEvent: Hashable {
    public typealias Params = [String: String]

    public enum PurchaseType: String, Codable, Hashable {
        case subscription
        case consumable
        case nonConsumable
    }
    
    case plain(
        name: String,
        params: Params = [:],
        unique: Bool = false
    )
    
    case purchase(
        id: String,
        transactionId: String?,
        type: PurchaseType,
        params: Params = [:],
        price: Decimal,
        priceLocale: Locale
    )
    
    case error(error: NSError)
}

extension AnalyticsEvent: OneShotable {
    var unique: Bool {
        switch self {
        case let .plain(_, _ , unique):
            return unique
        case .purchase, .error:
            return false
        }
    }
    
    var oneShotKey: String {
        switch self {
        case let .plain(name, _ , _):
            return "disposable_event_\(name)"
        case let .purchase(id, _, _ , _, _, _):
            return "disposable_event_\(id)"
        case let .error(error):
            return "disposable_event_\(error.domain)"
        }
    }
}
