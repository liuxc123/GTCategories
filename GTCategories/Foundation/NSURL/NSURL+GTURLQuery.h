//
//  NSURL+GTURLQuery.h
//  GTCategories
//
//  Created by liuxc on 2018/11/16.
//
// https://github.com/itsthejb/NSURL-QueryDictionary
#import <Foundation/Foundation.h>

@interface NSURL (GTURLQuery)

/**
 *  @return URL's query component as keys/values
 *  Returns nil for an empty query
 */
- (NSDictionary*) gt_queryDictionary;

/**
 *  @return URL with keys values appending to query string
 *  @param queryDictionary Query keys/values
 *  @param sortedKeys Sorted the keys alphabetically?
 *  @warning If keys overlap in receiver and query dictionary,
 *  behaviour is undefined.
 */
- (NSURL*) gt_URLByAppendingQueryDictionary:(NSDictionary*) queryDictionary
                             withSortedKeys:(BOOL) sortedKeys;

/** As above, but `sortedKeys=NO` */
- (NSURL*) gt_URLByAppendingQueryDictionary:(NSDictionary*) queryDictionary;

/**
 *  @return Copy of URL with its query component replaced with
 *  the specified dictionary.
 *  @param queryDictionary A new query dictionary
 *  @param sortedKeys      Whether or not to sort the query keys
 */
- (NSURL*) gt_URLByReplacingQueryWithDictionary:(NSDictionary*) queryDictionary
                                 withSortedKeys:(BOOL) sortedKeys;

/** As above, but `sortedKeys=NO` */
- (NSURL*) gt_URLByReplacingQueryWithDictionary:(NSDictionary*) queryDictionary;

/** @return Receiver with query component completely removed */
- (NSURL*) gt_URLByRemovingQuery;

@end

#pragma mark -

@interface NSString (GTURLQuery)

/**
 *  @return If the receiver is a valid URL query component, returns
 *  components as key/value pairs. If couldn't split into *any* pairs,
 *  returns nil.
 */
- (NSDictionary*) gt_URLQueryDictionary;

@end

#pragma mark -

@interface NSDictionary (GTURLQuery)

/**
 *  @return URL query string component created from the keys and values in
 *  the dictionary. Returns nil for an empty dictionary.
 *  @param sortedKeys Sorted the keys alphabetically?
 *  @see cavetas from the main `NSURL` category as well.
 */
- (NSString*) gt_URLQueryStringWithSortedKeys:(BOOL) sortedKeys;

/** As above, but `sortedKeys=NO` */
- (NSString*) gt_URLQueryString;

@end
