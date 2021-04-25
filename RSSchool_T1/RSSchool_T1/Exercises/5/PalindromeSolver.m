#import "PalindromeSolver.h"

@implementation PalindromeSolver

// Complete the highestValuePalindrome function below.
- (NSString *) highestValuePalindrome:(NSString *)s n:(NSNumber *)n k:(NSNumber *)k {
    NSString *q = @"";
    unsigned long length = [s length];
    int flag = 0;
    for (int i = 0; i < length / 2; i++) {
        if ([s characterAtIndex:i] != [s characterAtIndex:[s length] - 1]) {
            q = [s stringByReplacingCharactersInRange:NSMakeRange(i, 1)
                                           withString:[s substringWithRange:NSMakeRange(length-i-1,1)]];
            s = [s stringByReplacingCharactersInRange:NSMakeRange(length - i - 1, 1)
                                           withString:[s substringWithRange:NSMakeRange(i,1)]];
            s = [NSString stringWithFormat:@"%li", MAX(s.integerValue, q.integerValue)];
            flag++;
        }
        if (flag > [k intValue]) {
            return @"-1";
        }
    }
    for (int i = 0; i < length / 2; i++) {
        if([k intValue] - flag == 0 || [k intValue] - flag == -1){
            break;
        }
        if([s characterAtIndex:i] != '9'){
            s = [s stringByReplacingCharactersInRange:NSMakeRange(length - i - 1, 1)withString: @"9"];
            s = [s stringByReplacingCharactersInRange:NSMakeRange(i, 1)withString: @"9"];
            flag += 2;
        }
    }
    return s;
}

@end
