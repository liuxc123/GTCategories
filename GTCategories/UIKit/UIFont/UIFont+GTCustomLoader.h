//
//  UIFont+GTCustomLoader.h
//  GTCategories
//
//  Created by liuxc on 2018/11/16.
//

#import <UIKit/UIKit.h>

/**
 You can use `UIFont+GTCustomLoader` category to load custom fonts for your
 application without worring about plist or real font names.
 */
@interface UIFont (GTCustomLoader)

/**
 Get `UIFont` object for the selected font file (*.ttf or *.otf files).

 The first call of this method will register the font using
 `+registerFontFromURL:` method.

 @see +registerFontFromURL: method
 @param fontURL Font file absolute url
 @param size Font size
 @return `UIFont` object or `nil` on errors
 */
+ (UIFont *)gt_customFontWithURL:(NSURL *)fontURL size:(CGFloat)size;

/// @name Explicit registration

/**
 Allow custom fonts registration.

 With this method you can load all supported font file: ttf, otf, ttc and otc.
 Font that are already registered, with this library or by system, will not be
 registered and you will see a warning log.

 @param fontURL Font file absolute url
 @return An array of postscript name which represent the file's font(s) or `nil`
 on errors. (With iOS < 7 as target you will see an empty array for collections)
 */
+ (NSArray *)gt_registerFontFromURL:(NSURL *)fontURL;

@end
