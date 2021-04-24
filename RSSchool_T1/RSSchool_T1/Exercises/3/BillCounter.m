#import "BillCounter.h"

@implementation BillCounter

// Complete the following fuction
- (NSString*)compareResultForBill:(NSArray<NSNumber*>*)bill notIncludingElementWithIndex:(NSInteger)index withGivenSum:(NSNumber*)sum {
    int briansItem = [bill[index] intValue];
    int totalPrice = [[bill valueForKeyPath:@"@sum.self"] intValue];;
    if ((totalPrice - briansItem) / 2 == [sum intValue]  ) {
        return @"Bon Appetit";
    }
    int overcharge = [sum intValue] - (totalPrice - briansItem) / 2;
    NSString *output = [NSString stringWithFormat:@"%d", overcharge];
    return output;
}

@end
