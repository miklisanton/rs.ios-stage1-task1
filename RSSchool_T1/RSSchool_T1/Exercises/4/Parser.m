#import "Parser.h"

@implementation Parser

- (NSArray <NSString*>*)parseString:(NSString*)string{
    NSMutableArray *output = [NSMutableArray array];
    NSDictionary *brackets = @{
        @"<": @">",
        @"[": @"]",
        @"(": @")",
    };
    for(NSString *key in brackets){
        int start = -1;
        int end = -1;
        for (int i = 0; i < [string length]; i++) {
            if ([[string substringWithRange:NSMakeRange(i, 1)] isEqualToString: key]) {
                start = i;
            }
            if ([[string substringWithRange:NSMakeRange(i, 1)] isEqualToString: brackets[key]]) {
                end = i;
                [output addObject:[string substringWithRange:NSMakeRange(start + 1, end - start - 1)]];
            }
        }
    }
    return output;
}

@end
