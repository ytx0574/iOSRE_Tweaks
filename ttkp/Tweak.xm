#import "ttkp.h"

%hook IAPPayHelper
- (void)completeTransaction:(id)arg1 receipt:(id)arg2
{
    %orig;
    NSLog(@"completeTransaction:receipt :::::::::::::::::::::::::::::::::%@ %@  ---  %@  ---- %@",arg1, arg2, transactionReceiptString, results);
}
%end

%hook APMidasDelegateObserver
- (void)log:(id)arg1
{
    %orig;
    NSLog(@"ŒŒŒŒŒŒŒŒŒŒŒŒŒŒŒŒŒŒŒŒŒŒŒŒŒŒŒŒŒŒŒ    log   %@",arg1);
}

- (void)onDistributeGoodsFailue:(id)arg1 withErrorMessage:(id)arg2 withErrorCode:(int)arg3
{
    //%orig;
    NSLog(@"ŒŒŒŒŒŒŒŒŒŒŒŒŒŒŒŒŒŒŒŒŒŒŒŒŒŒŒŒŒŒŒ    onDistributeGoodsFailue:withErrorMessage:withErrorCode:   %@ %@ %d",arg1, arg2, arg3);
    [self onDistributeGoodsFinish:arg1];
}

- (void)onDistributeGoodsFinish:(id)arg1
{
    %orig;
}
%end


%hook AppIAPPayTool
- (void)paymentQueue:(id)arg1 removedTransactions:(id)arg2
{
    %orig;
    NSLog(@"paymentQueue:removedTransactions %@ %@", arg1, arg2);
}

- (void)paymentQueue:(id)arg1 updatedTransactions:(id)arg2
{
    %orig;
    NSLog(@"paymentQueue: updatedTransactions %@ %@  %@", arg1, arg2, @(transaction.transactionState));
}
%end

%hook LoadingNetController
- (void)StartAnimating:(id)arg1
{
    %orig;
    NSLog(@"ˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇStartAnimating:%@",arg1);
}
%end

%hook APMidasDelegateObserver
- (void)onIAPPayFailue:(id)arg1 withError:(id)arg2
{
    %orig;
    NSLog(@"onIAPPayFailue:withError: _____________________________%@ %@", arg1, arg2);
}
- (void)onIAPPaymentSucess:(id)arg1
{
    %orig;
    NSLog(@"onIAPPaymentSucess _____________________________%@", arg1);
}
%end


%hook IAPPayHelper
+ (_Bool)isDeviceJailbroken
{
    NSLog(@"isDeviceJailbroken=====================");
    return false;
}
+ (_Bool)judgeIsCanPay
{
    NSLog(@"judgeIsCanPay================");
    return true;
}
%end

%hook CommonUtility
+ (_Bool)isDeviceJailBroken
{
    NSLog(@"isDeviceJailbroken=====================");
    return false;
}
%end


%hook Bundle
- (NSURL *)appStoreReceiptURL
{
    id obj = %orig;
    NSLog(@"°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°%@", obj);
    return obj;
}
%end



/*
%hook NSDictionary
- (id)objectForKeyedSubscript:(id)key
{
    id obj = %orig(key);
    NSLog(@"’’’’’’’’’’’’’’’’’’’’’’objectForKeyedSubscript’’’’’’’’’’’’’’’’’’’’’’’’’’’%@---%@¨¨¨¨%@",key, obj, self);
    return obj;
}

- (id)objectForKey:(id)key
{
    id obj = %orig(key);
    NSLog(@"’’’’’’’’’’’’’’’’’’’’’’objectForKey’’’’’’’’’’’’’’’’’’’’’’’’’’’%@---%@¨¨¨¨%@",key, obj, self);
    return obj;
}
%end

%hook NSMutableDictionary
- (id)objectForKeyedSubscript:(id)key
{
    id obj = %orig(key);
    NSLog(@"’’’’’’’’’’’’’’’’’’’’’’objectForKeyedSubscript’’’’’’’’’’’’’’’’’’’’’’’’’’’%@---%@¨¨¨¨%@",key, obj, self);
    return obj;
}

- (id)objectForKey:(id)key
{
    id obj = %orig(key);
    NSLog(@"’’’’’’’’’’’’’’’’’’’’’’objectForKey’’’’’’’’’’’’’’’’’’’’’’’’’’’%@---%@¨¨¨¨%@",key, obj, self);
    return obj;
}

- (void)setObject:(id)obj forKeyedSubscript:(id <NSCopying>)key
{
    %orig;
    NSLog(@"’’’’’’’’’’’’’’’’’’’’’’forKeyedSubscript’’’’’’’’’’’’’’’’’’’’’’’’’’’%@---%@¨¨¨¨%@",key, obj, self);
}

- (void)setObject:(id)obj forKey:(id <NSCopying>)key
{
    %orig;
    NSLog(@"’’’’’’’’’’’’’’’’’’’’’’setObject:forKey’’’’’’’’’’’’’’’’’’’’’’’’’’’%@---%@¨¨¨¨%@",key, obj, self);
}

- (void)setValue:(id)obj forKey:(NSString *)key
{
    %orig;
    NSLog(@"’’’’’’’’’’’’’’’’’’’’’’setValue:forKey’’’’’’’’’’’’’’’’’’’’’’’’’’’%@---%@¨¨¨¨%@",key, obj, self);
}
%end

%hook NSObject
- (id)valueForKey:(NSString *)key
{
    id obj = %orig(key);
    NSLog(@"’’’’’’’’’’’’’’’’’’’’’’valueForKey’’’’’’’’’’’’’’’’’’’’’’’’’’’%@---%@¨¨¨¨%@",key, obj, self);
    return obj;
}

- (id)valueForKeyPath:(NSString *)key
{
    id obj = %orig(key);
    NSLog(@"’’’’’’’’’’’’’’’’’’’’’’valueForKeyPath’’’’’’’’’’’’’’’’’’’’’’’’’’’%@---%@¨¨¨¨%@",key, obj, self);
    return obj;
}

- (void)setValue:(id)obj forKeyPath:(NSString *)key
{
    %orig;
    NSLog(@"’’’’’’’’’’’’’’’’’’’’’’setValue:forKeyPath’’’’’’’’’’’’’’’’’’’’’’’’’’’%@---%@¨¨¨¨%@",key, obj, self);
}

- (void)setValue:(id)obj forKey:(NSString *)key
{
    %orig;
    NSLog(@"’’’’’’’’’’’’’’’’’’’’’’setValue:forKey’’’’’’’’’’’’’’’’’’’’’’’’’’’%@---%@¨¨¨¨%@",key, obj, self);
}
%end
*/