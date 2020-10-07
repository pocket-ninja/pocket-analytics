//
//  Copyright © 2020 pocket-ninja. All rights reserved.
//

import Foundation

public final class TenjinAnalyticsDrain: AnalyticsDrain {
    public init() {}
    
    public func track(_ event: AnalyticsEvent) {
        switch event {
        case .error, .plain:
            return
        case let .purchase(id, transactionId, _, price, priceLocale):
            TenjinWrapper.sendEvent(withName: "Original Purchase")

            guard
                let receiptURL = Bundle.main.appStoreReceiptURL,
                let receipt = try? Data(contentsOf: receiptURL),
                let transaction = transactionId
            else {
                return
            }

            TenjinWrapper.transaction(
                withProductName: id,
                andCurrencyCode: priceLocale.currencyCode ?? "",
                andQuantity: 1,
                andUnitPrice: NSDecimalNumber(decimal: price),
                andTransactionId: transaction,
                andReceipt: receipt
            )
        }
    }
}
