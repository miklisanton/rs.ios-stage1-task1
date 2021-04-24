#import "T1Array.h"

@implementation T1Array

// Complete the following fuction
- (NSArray *)convertToHappy:(NSArray *)sadArray {
    if([sadArray count] == 0){
        return sadArray;
    }
    
    NSMutableArray *sadMutableArray= [sadArray mutableCopy];
    
    for (int i = 1; i < [sadMutableArray count] - 1; i++) {
        if([sadMutableArray[i] intValue] > [sadMutableArray[i + 1] intValue] + [sadMutableArray[i - 1] intValue]){
            [sadMutableArray removeObjectAtIndex:i];
        }
    }
    
    NSArray *tempArray = [sadMutableArray copy];
    
    if ([sadArray count] != [sadMutableArray count]) {
        tempArray = [self convertToHappy:tempArray];
    }
    
    return tempArray;
}

@end
