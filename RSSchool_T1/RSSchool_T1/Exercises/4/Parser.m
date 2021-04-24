#import "Parser.h"

@implementation Parser

// Complete the parseString function below.
- (NSArray <NSString*>*)parseString:(NSString*)string {
    NSMutableArray *output = [NSMutableArray array];
    
    for (int i = 0; i < [string length]; i++) {
        if ([string characterAtIndex:i] == '<') {
            int startIndex = i;
            while ([string characterAtIndex:i] != '>') {
                i++;
            }
            int endIndex = i;
            [output addObject:[string substringWithRange:NSMakeRange(startIndex + 1, endIndex - startIndex - 1)]];
        }
        if ([string characterAtIndex:i] == '(') {
            int startIndex = i;
            while ([string characterAtIndex:i] != ')') {
                i++;
            }
            int endIndex = i;
            [output addObject:[string substringWithRange:NSMakeRange(startIndex + 1, endIndex - startIndex - 1)]];
        }
        if ([string characterAtIndex:i] == '[') {
            int startIndex = i;
            while ([string characterAtIndex:i] != ']') {
                i++;
            }
            int endIndex = i;
            [output addObject:[string substringWithRange:NSMakeRange(startIndex + 1, endIndex - startIndex - 1)]];
        }
    }
    return output;
}

@end
