//
//  Copyright © 2020 sroik. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TenjinWrapper : NSObject

+ (void)sendEventWithName:(NSString *)eventName;

+ (void)updateConversionValue:(int)conversionValue;

+ (void)transactionWithProductName:(NSString *)productName
                   andCurrencyCode:(NSString *)currencyCode
                       andQuantity:(NSInteger)quantity
                      andUnitPrice:(NSDecimalNumber *)price
                  andTransactionId:(NSString *)transactionId
                        andReceipt:(NSData *)receipt;

+ (void)setup:(NSString *)apiKey;

+ (void)optIn;

+ (void)optOut;

+ (void)connect;

@end

NS_ASSUME_NONNULL_END
