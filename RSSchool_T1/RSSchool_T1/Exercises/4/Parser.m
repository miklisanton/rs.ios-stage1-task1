#import "Parser.h"

@implementation Parser

- (NSArray <NSString*>*)parseString:(NSString*)string{
    NSMutableArray *output = [NSMutableArray array];
    NSDictionary *brackets = @{
        @"(": @")",
        @"[": @"]",
        @"<": @">",
    };
    for (int i = 0; i < [string length]; i++) {
        unichar element = [string characterAtIndex:i];
        for(NSString *key in brackets){
            //NSMutableString *word = [[NSMutableString alloc]init];
            unichar key_char = [key characterAtIndex:0];
            int j = i;
            if(key_char == element){
                int start = i;
                int omit = 0;
                while([string characterAtIndex:j] != [brackets[key] characterAtIndex:0]){
                    j++;
                    if (key_char == [string characterAtIndex:j]) {
                        omit++;
                    }
                    if([brackets[key] characterAtIndex:0] == [string characterAtIndex:j] && omit != 0){
                        omit--;
                        j++;
                    }
                }
                int end = j;
                [output addObject:[string substringWithRange:NSMakeRange(start + 1, end - start - 1)]];
            }
        }
    }
    NSLog(@"%@", output);
    return output;
}

@end
