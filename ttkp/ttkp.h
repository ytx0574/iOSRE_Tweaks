//
//  AppIAPPayTool.h
//  MobileMail
//
//  Created by Johnson on 8/12/15.
//  Copyright (c) 2015 Johnson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <StoreKit/StoreKit.h>
#import <Foundation/Foundation.h>

@interface AppIAPPayTool : NSObject
- (void)paymentQueue:(id)arg1 removedTransactions:(id)arg2;
- (void)paymentQueue:(id)arg1 restoreCompletedTransactionsFailedWithError:(id)arg2;
- (void)paymentQueue:(id)arg1 updatedTransactions:(id)arg2;
- (void)paymentQueueRestoreCompletedTransactionsFinished:(id)arg1;
- (void)productsRequest:(id)arg1 didReceiveResponse:(id)arg2;
- (void)registerPayment;
- (void)request:(id)arg1 didFailWithError:(id)arg2;
- (void)requestDidFinish:(id)arg1;
- (void)unRegisterPayment;
@end


@interface APMidasDelegateObserver : NSObject
- (void)onDistributeGoodsFailue:(id)arg1 withErrorMessage:(id)arg2 withErrorCode:(int)arg3;
- (void)onDistributeGoodsFinish:(id)arg1;
@end

@interface RequestInfo : NSObject
@property(copy, nonatomic) NSString *Amt; // @synthesize Amt=amt;
@property(copy, nonatomic) NSString *Appid; // @synthesize Appid=appid;
@property(copy, nonatomic) NSString *ApplicationUserName; // @synthesize ApplicationUserName=applicationUserName;
@property(copy, nonatomic) NSString *Billno; // @synthesize Billno=billno;
@property(nonatomic) int ChangeKeyType; // @synthesize ChangeKeyType=changeKeyType;
@property(copy, nonatomic) NSString *CurrencyType; // @synthesize CurrencyType=currencyType;
@property(copy, nonatomic) NSString *From; // @synthesize From=from;
@property(nonatomic) _Bool IsChangeKey; // @synthesize IsChangeKey=isChangeKey;
@property(nonatomic) _Bool IsDepositGameCoin; // @synthesize IsDepositGameCoin=isDepositGameCoin;
@property(nonatomic) _Bool IsUi; // @synthesize IsUi=isUi;
@property(nonatomic) int KeyType; // @synthesize KeyType=_KeyType;
@property(copy, nonatomic) NSString *OpenKey; // @synthesize OpenKey=openKey;
@property(copy, nonatomic) NSString *Openid; // @synthesize Openid=openid;
@property(copy, nonatomic) NSString *Payitem; // @synthesize Payitem=payitem;
@property(copy, nonatomic) NSString *Pf; // @synthesize Pf=pf;
@property(copy, nonatomic) NSString *Pfkey; // @synthesize Pfkey=pfkey;
@property(retain, nonatomic) SKProduct *Product; // @synthesize Product=product;
@property(nonatomic) int ProductType; // @synthesize ProductType=productType;
@property(copy, nonatomic) NSString *Productid; // @synthesize Productid=productid;
@property(readonly, nonatomic) int Quantity; // @synthesize Quantity=quantity;
@property(retain, nonatomic) NSData *Receipt; // @synthesize Receipt=receipt;
@property(copy, nonatomic) NSString *RequestKey; // @synthesize RequestKey=requestKey;
@property(copy, nonatomic) NSString *Session_id; // @synthesize Session_id=session_id;
@property(copy, nonatomic) NSString *Session_type; // @synthesize Session_type=session_type;
@property(retain, nonatomic) SKPaymentTransaction *SkpaymentTransaction; // @synthesize SkpaymentTransaction=skpaymentTransaction;
@property(nonatomic) double Ts; // @synthesize Ts=ts;
@property(copy, nonatomic) NSString *Url; // @synthesize Url=url;
@property(copy, nonatomic) NSString *VarItem; // @synthesize VarItem=varItem;
@property(copy, nonatomic) NSString *Zoneid; // @synthesize Zoneid=zoneid;
@property(retain, nonatomic) NSDictionary *context; // @synthesize context;
@property(nonatomic) _Bool isReprovide; // @synthesize isReprovide;
@end
