//
//  iOSREMailMarker.h
//  MobileMail
//
//  Created by Johnson on 8/10/15.
//  Copyright (c) 2015 Johnson. All rights reserved.
//

@interface MailboxPickerController : UITableViewController

@end

@interface NSConcreteNotification : NSNotification

@end

@interface MessageMegaMall : NSObject
- (void)markMessagesAsViewed:(NSSet *)arg1;
- (NSSet *)copyAllMessages;
@end

@interface MFMessageInfo : NSObject
@property (nonatomic) BOOL read;
@end

@interface MFLibraryMessage : NSObject
- (NSArray *)senders;
- (MFMessageInfo *)copyMessageInfo;
@end



