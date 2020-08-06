//
//  Copyright © 2020 pocket-ninja. All rights reserved.
//

import Analytics
import UtilsCore

final class TenjinAnalyticsDrain: AnalyticsDrain {
    func track(_ event: AnalyticsEvent) {
        switch event {
        case .error, .plain:
            return
        case let .purchase(id, transactionId, _, _, price, priceLocale):
            TenjinSDK.sendEvent(withName: "Original Purchase")

            guard
                let receiptURL = Bundle.main.appStoreReceiptURL,
                let receipt = try? Data(contentsOf: receiptURL),
                let transaction = transactionId
            else {
                return
            }

            TenjinSDK.transaction(
                withProductName: id,
                andCurrencyCode: priceLocale.currencyCode ?? .empty,
                andQuantity: 1,
                andUnitPrice: NSDecimalNumber(decimal: price),
                andTransactionId: transaction,
                andReceipt: receipt
            )
        }
    }
}
