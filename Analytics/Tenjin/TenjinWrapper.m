//
//  Copyright © 2020 sroik. All rights reserved.
//

#import "TenjinWrapper.h"
#import "TenjinSDK.h"

@implementation TenjinWrapper

+ (void)sendEventWithName:(NSString *)eventName {
    [TenjinSDK sendEventWithName:eventName];
}

+ (void)updateConversionValue:(int)conversionValue {
    [TenjinSDK updateConversionValue:conversionValue];
}

+ (void)transactionWithProductName:(NSString *)productName
                   andCurrencyCode:(NSString *)currencyCode
                       andQuantity:(NSInteger)quantity
                      andUnitPrice:(NSDecimalNumber *)price
                  andTransactionId:(NSString *)transactionId
                        andReceipt:(NSData *)receipt {
    [TenjinSDK transactionWithProductName:productName
                          andCurrencyCode:currencyCode
                              andQuantity:quantity
                             andUnitPrice:price
                         andTransactionId:transactionId
                               andReceipt:receipt];
}

+ (void)transactionWithProductName:(NSString *)productName
                   andCurrencyCode:(NSString *)currencyCode
                       andQuantity:(NSInteger)quantity
                      andUnitPrice:(NSDecimalNumber *)price {
    [TenjinSDK transactionWithProductName:productName
                          andCurrencyCode:currencyCode
                              andQuantity:quantity
                             andUnitPrice:price];
}

+ (void)setup:(NSString *)apiKey {
    [TenjinSDK getInstance:apiKey];
}

+ (void)optIn {
    [TenjinSDK optIn];
}

+ (void)optOut {
    [TenjinSDK optOut];
}

+ (void)connect {
    [TenjinSDK connect];
}

@end
