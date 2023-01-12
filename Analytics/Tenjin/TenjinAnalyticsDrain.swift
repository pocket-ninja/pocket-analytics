//
//  Copyright © 2020 pocket-ninja. All rights reserved.
//

import Foundation
import PocketAnalytics

public final class TenjinAnalyticsDrain: AnalyticsDrain {
    public enum PurchasesTrackingMode {
        /* doesn't track revenue */
        case none
        /* passes transaction and receipt */
        case transaction
        /* passes revenue directly without transaction */
        case direct
    }
    
    public let purchasesTrackingMode: PurchasesTrackingMode
    
    public init(
        purchasesTrackingMode: PurchasesTrackingMode,
        conversionValueOnPurchase: Int32?
    ) {
        self.conversionValueOnPurchase = conversionValueOnPurchase
        self.purchasesTrackingMode = purchasesTrackingMode
    }
    
    public func track(_ event: AnalyticsEvent) {
        switch event {
        case .error, .plain:
            return
        case let .purchase(id, transactionId, _, price, priceLocale):
            TenjinWrapper.sendEvent(withName: "Original Purchase")
            
            if let cv = conversionValueOnPurchase {
                TenjinWrapper.updatePostbackConversionValue(cv)
            }

            switch purchasesTrackingMode {
            case .none:
                return
            case .direct:
                TenjinWrapper.transaction(
                    withProductName: id,
                    andCurrencyCode: priceLocale.currencyCode ?? "",
                    andQuantity: 1,
                    andUnitPrice: NSDecimalNumber(decimal: price)
                )
            case .transaction:
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
    
    private let conversionValueOnPurchase: Int32?
}
