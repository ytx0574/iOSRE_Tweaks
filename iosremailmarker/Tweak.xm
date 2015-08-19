/* How to Hook with Logos
Hooks are written with syntax similar to that of an Objective-C @implementation.
You don't need to #include <substrate.h>, it will be done automatically, as will
the generation of a class list and an automatic constructor.

%hook ClassName

// Hooking a class method
+ (id)sharedInstance {
	return %orig;
}

// Hooking an instance method with an argument.
- (void)messageName:(int)argument {
	%log; // Write a message about this call, including its class, name and arguments, to the system log.

	%orig; // Call through to the original function with its original arguments.
	%orig(nil); // Call through to the original function with a custom argument.

	// If you use %orig(), you MUST supply all arguments (except for self and _cmd, the automatically generated ones.)
}

// Hooking an instance method with no arguments.
- (id)noArguments {
	%log;
	id awesome = %orig;
	[awesome doSomethingElse];

	return awesome;
}

// Always make sure you clean up after yourself; Not doing so could have grave consequences!
%end
*/


#import "iOSREMailMarker.h"

%hook MailboxPickerController
%new
- (void)iOSREShowWhiteList
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"WhiteList" message:@"请输入一个邮箱地址" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        UITextField *textFiled = alertController.textFields.firstObject;
        if (textFiled.text.length != 0) {
            [[NSUserDefaults standardUserDefaults] setObject:textFiled.text forKey:@"whitelist"];
        }
    }];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDefault handler:nil];
        [alertController addAction:action];
        [alertController addAction:cancelAction];
        [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder = @"ytx0573@outlook.com";
        textField.text = [[NSUserDefaults standardUserDefaults] valueForKey:@"whitelist"];
    }];
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)viewDidLoad
{
    %orig;
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"WihteList" style:UIBarButtonItemStylePlain target:self action:@selector(iOSREShowWhiteList)];
}

%end


%hook MailboxContentViewController
- (void)megaMallMessageCountChanged:(NSConcreteNotification *)arg1
{
    %orig;
    NSMutableSet *targetMessages = [NSMutableSet setWithCapacity:1000];
    MessageMegaMall *mall = [arg1 object];
    NSString *whitelist = [[NSUserDefaults standardUserDefaults] valueForKey:@"whitelist"];
    NSSet *messages = [mall copyAllMessages];
    for (MFLibraryMessage *message in messages) {
    MFMessageInfo *messageInfo = [message copyMessageInfo];
    for (NSString *sender in [message senders]) {
            if (!messageInfo.read && [sender rangeOfString:[NSString stringWithFormat:@"<%@>", whitelist]].location == NSNotFound) {
                [targetMessages addObject:message];
            }
        }
    }

    [mall markMessagesAsViewed:targetMessages];
}
%end
