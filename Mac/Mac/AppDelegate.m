//
//  AppDelegate.m
//  Mac
//
//  Created by Johnson on 15/12/2.
//  Copyright © 2015年 Johnson. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (NSString *)cutString:(NSString *)originalString firstString:(NSString *)first secondString:(NSString *)second
{
    NSInteger location = [originalString rangeOfString:first].location;
    NSInteger length = [originalString rangeOfString:second].location - [originalString rangeOfString:first].location;
    
//    NSLog(@"=========%@  -  %@", originalString, NSStringFromRange(NSMakeRange(location + 1, length - 1)));
    return [originalString substringWithRange:NSMakeRange(location + 1, length - 1)];
}

- (NSString *)cutString:(NSString *)originalString cutString:(NSString *)cut
{
//    NSLog(@"%@", originalString);
    NSInteger location = [originalString rangeOfString:cut].location;
    return  [originalString substringFromIndex:location + 1];
}

- (void)makeLogCode
{
    NSString *string = [[NSString alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"File" ofType:@""] encoding:NSUTF8StringEncoding error:nil];
    
    NSMutableArray *array = [NSMutableArray arrayWithArray:[string componentsSeparatedByString:@";"]];
    [array removeLastObject]; //因为拆分的时候, 最后面拆出了个空串
    
    
    [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        NSArray *tempArray = [obj componentsSeparatedByString:@":"];
        
        NSMutableString __block *tempString = [NSMutableString stringWithString:@"\n{\n"];
        
        NSMutableString __block *tempNSLogString = [NSMutableString stringWithString:@"NSLog(@\"66-66-77777777    %@"];
        NSMutableString __block *tempNSLogLastString = [NSMutableString stringWithString:@"\", NSStringFromSelector(_cmd)"];
        
        
        [tempArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            
            
            NSString *parameterType = [self cutString:obj firstString:@"(" secondString:@")"];
            
            if ([obj isEqual:tempArray.firstObject]) {
                if ([parameterType isEqualToString:@"void"]) {
                    [tempString appendString:@"%orig;\n"];
                }else {
                    [tempString appendFormat:@"%@ value = %%orig;\n", parameterType];
                }
            }else {
                NSString *parameterType = [self cutString:obj firstString:@"(" secondString:@")"];
                
                if ([obj containsString:@"struct CGPoint"] || [obj containsString:@"struct CGSize"] || [obj containsString:@"long long"] || [obj containsString:@"unsigned int"]) {
                    obj = [obj stringByReplacingOccurrencesOfString:@" " withString:@""];
                }
                NSString *parameterName = [obj componentsSeparatedByString:@" "].firstObject;
                
                
                if ([parameterType isEqualToString:@"structCGSize"]) {
                    
                    [tempNSLogString appendString:@"---%@"];
                    [tempNSLogLastString appendFormat:@", NSStringFromSize(%@)", [self cutString:parameterName cutString:@")"]];
                }else if ([parameterType isEqualToString:@"structCGPoint"]) {
                    
                    [tempNSLogString appendString:@"---%@"];
                    [tempNSLogLastString appendFormat:@", NSStringFromPoint(%@)", [self cutString:parameterName cutString:@")"]];
                }else if ([parameterType isEqualToString:@"longlong"]) {
                    
                    [tempNSLogString appendString:@"---%lld"];
                    [tempNSLogLastString appendFormat:@", %@", [self cutString:parameterName cutString:@")"]];
                }else if ([parameterType isEqualToString:@"unsignedint"]) {
                    
                    [tempNSLogString appendString:@"---%d"];
                    [tempNSLogLastString appendFormat:@", %@", [self cutString:parameterName cutString:@")"]];
                }
                
                else if ([parameterType isEqualToString:@"id"]) {
                    
                    [tempNSLogString appendString:@"---%@"];
                    [tempNSLogLastString appendFormat:@", %@", [self cutString:parameterName cutString:@")"]];
                }else if ([parameterType isEqualToString:@"double"]) {
                    
                    [tempNSLogString appendString:@"---%f"];
                    [tempNSLogLastString appendFormat:@", %@", [self cutString:parameterName cutString:@")"]];
                }else if ([parameterType isEqualToString:@"_Bool"]) {
                    
                    [tempNSLogString appendString:@"---%d"];
                    [tempNSLogLastString appendFormat:@", %@", [self cutString:parameterName cutString:@")"]];
                }else if ([parameterType isEqualToString:@"_Bool"]) {
                    
                }else if ([parameterType isEqualToString:@"_Bool"]) {
                    
                }else if ([parameterType isEqualToString:@"_Bool"]) {
                    
                }
            }
            
            
        }];
        
        [tempNSLogLastString appendString:@");\n}"];
        
        
        NSString *temp = [[[obj stringByAppendingString:tempString] stringByAppendingString:tempNSLogString] stringByAppendingString:tempNSLogLastString];
        [array replaceObjectAtIndex:[array indexOfObject:obj] withObject:temp];
        
    }];
    
    
    
    NSString *path =  [NSHomeDirectory() stringByAppendingPathComponent:@"Desktop/File.h"];
    
    [[array componentsJoinedByString:@"\n\n"] writeToFile:path atomically:YES encoding:NSUTF8StringEncoding error:nil];

}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    
    
    

    
    
    // Insert code here to initialize your application
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

@end
