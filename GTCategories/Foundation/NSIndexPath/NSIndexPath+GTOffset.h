//
//  NSIndexPath+GTOffset.h
//  GTCategories
//
//  Created by liuxc on 2018/11/16.
//

#import <Foundation/Foundation.h>

@interface NSIndexPath (GTOffset)

/**
 *  @author GTCategories
 *
 *  Compute previous row indexpath
 *
 */
- (NSIndexPath *)gt_previousRow;
/**
 *  @author GTCategories
 *
 *  Compute next row indexpath
 *
 */
- (NSIndexPath *)gt_nextRow;
/**
 *  @author GTCategories
 *
 *  Compute previous item indexpath
 *
 */
- (NSIndexPath *)gt_previousItem;
/**
 *  @author GTCategories
 *
 *  Compute next item indexpath
 *
 */
- (NSIndexPath *)gt_nextItem;
/**
 *  @author GTCategories
 *
 *  Compute next section indexpath
 *
 */
- (NSIndexPath *)gt_nextSection;
/**
 *  @author GTCategories
 *
 *  Compute previous section indexpath
 *
 */
- (NSIndexPath *)gt_previousSection;


@end
