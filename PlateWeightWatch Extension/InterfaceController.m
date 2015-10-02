//
//  InterfaceController.m
//  PlateWeightWatch Extension
//
//  Created by Zakk Hoyt on 10/1/15.
//  Copyright © 2015 Zakk Hoyt. All rights reserved.
//

#import "InterfaceController.h"
#import "WeightRow.h"




@interface InterfaceController()
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceTable *table;

@end


@implementation InterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];

    // Configure interface objects here.

}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
    [self reloadTable];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

-(void)reloadTable{
    const NSUInteger kCount = 100;
    [self.table setNumberOfRows:kCount withRowType:@"WeightRow"];
    for(NSUInteger index = 0; index < kCount; index++){
         WeightRow *row = [self.table rowControllerAtIndex:index];
        [row.kgsLabel setText:[NSString stringWithFormat:@"%.2f", (float)4.234234]];
        [row.lbsLabel setText:[NSString stringWithFormat:@"%.2f", (float)2.3423423]];
    }
    

}

@end



