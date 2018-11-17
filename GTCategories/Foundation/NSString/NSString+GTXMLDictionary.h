//
//  NSString+GTXMLDictionary.h
//  GTCategories
//
//  Created by liuxc on 2018/11/16.
//
/*

 #import "NSString+XMLDictionary.h"

 ...

 NSString *XMLString = @"<test>data</test>";
 NSDictionary *XMLAsDictionary = [XMLString XMLDictionary];

 */

//https://github.com/AndrewHydeJr/NSString-XML

#import <Foundation/Foundation.h>

@interface NSString (GTXMLDictionary)

/**
 *  @brief  xml字符串转换成NSDictionary
 *
 *  @return NSDictionary
 */
-(NSDictionary *)gt_XMLDictionary;

@end
