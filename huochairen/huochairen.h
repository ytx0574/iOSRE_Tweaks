//
//  xx.h
//  MobileMail
//
//  Created by Johnson on 8/11/15.
//  Copyright (c) 2015 Johnson. All rights reserved.
//

@interface BLTransactionDelegate : NSObject

- (void)didCompleteTransaction:(id)arg1;
- (void)didCompleteTransactionAndVerifyFailed:(id)arg1 withError:(id)arg2;
- (void)didCompleteTransactionAndVerifySucceed:(id)arg1;
- (void)didFailedTransaction:(id)arg1;
- (void)didRestoreTransaction:(id)arg1;

@end
