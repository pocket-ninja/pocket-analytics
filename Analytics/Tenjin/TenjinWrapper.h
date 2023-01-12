//
//  Copyright © 2020 sroik. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TenjinWrapper : NSObject

+ (void)sendEventWithName:(NSString *)eventName;

+ (void)updatePostbackConversionValue:(int)conversionValue;

+ (void)transactionWithProductName:(NSString *)productName
                   andCurrencyCode:(NSString *)currencyCode
                       andQuantity:(NSInteger)quantity
                      andUnitPrice:(NSDecimalNumber *)price
                  andTransactionId:(NSString *)transactionId
                        andReceipt:(NSData *)receipt;

+ (void)transactionWithProductName:(NSString *)productName
                   andCurrencyCode:(NSString *)currencyCode
                       andQuantity:(NSInteger)quantity
                      andUnitPrice:(NSDecimalNumber *)price;

+ (void)setup:(NSString *)apiKey;

+ (void)optIn;

+ (void)optOut;

+ (void)connect;

@end

NS_ASSUME_NONNULL_END
