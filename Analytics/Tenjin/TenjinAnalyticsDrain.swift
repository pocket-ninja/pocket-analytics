//
//  Copyright © 2020 pocket-ninja. All rights reserved.
//

import Foundation
import PocketAnalytics

public final class TenjinAnalyticsDrain: AnalyticsDrain {
    public let tracksPurchases: Bool
    
    public init(tracksPurchases: Bool, conversionValueOnPurchase: Int32?) {
        self.conversionValueOnPurchase = conversionValueOnPurchase
        self.tracksPurchases = tracksPurchases
    }
    
    public func track(_ event: AnalyticsEvent) {
        switch event {
        case .error, .plain:
            return
        case let .purchase(id, transactionId, _, price, priceLocale):
            TenjinWrapper.sendEvent(withName: "Original Purchase")
            
            if let cv = conversionValueOnPurchase {
                TenjinWrapper.updateConversionValue(cv)
            }

            guard
                tracksPurchases,
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
    
    private let conversionValueOnPurchase: Int32?
}
