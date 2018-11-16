//
//  NSDate+GTCupertinoYankee.h
//  FBSnapshotTestCase
//
//  Created by liuxc on 2018/11/16.
//

#import <Foundation/Foundation.h>

@interface NSDate (GTCupertinoYankee)

///---------------------------------------
/// @name Calculate Beginning / End of Day
///---------------------------------------

/**

 */
- (NSDate *)gt_beginningOfDay;

/**

 */
- (NSDate *)gt_endOfDay;

///----------------------------------------
/// @name Calculate Beginning / End of Week
///----------------------------------------

/**

 */
- (NSDate *)gt_beginningOfWeek;

/**

 */
- (NSDate *)gt_endOfWeek;

///-----------------------------------------
/// @name Calculate Beginning / End of Month
///-----------------------------------------

/**

 */
- (NSDate *)gt_beginningOfMonth;

/**

 */
- (NSDate *)gt_endOfMonth;

///----------------------------------------
/// @name Calculate Beginning / End of Year
///----------------------------------------

/**

 */
- (NSDate *)gt_beginningOfYear;

/**

 */
- (NSDate *)gt_endOfYear;

@end
