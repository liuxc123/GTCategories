//
//  UISearchBar+GTBlocks.m
//  GTCategories
//
//  Created by liuxc on 2018/11/16.
//

#import "UISearchBar+GTBlocks.h"

#import <objc/runtime.h>

/* Only for convenience and readabilty in delegate methods */
typedef BOOL (^GT_UISearchBarReturnBlock) (UISearchBar *searchBar);
typedef void (^GT_UISearchBarVoidBlock) (UISearchBar *searchBar);
typedef void (^GT_UISearchBarSearchTextBlock) (UISearchBar *searchBar,NSString *searchText);
typedef BOOL (^GT_UISearchBarInRangeReplacementTextBlock) (UISearchBar *searchBar,NSRange range,NSString *text);
typedef void (^GT_UISearchBarScopeIndexBlock)(UISearchBar *searchBar, NSInteger selectedScope);

@implementation UISearchBar (GTBlocks)


static const void *GT_UISearchBarDelegateKey                                = &GT_UISearchBarDelegateKey;
static const void *GT_UISearchBarShouldBeginEditingKey                      = &GT_UISearchBarShouldBeginEditingKey;
static const void *GT_UISearchBarTextDidBeginEditingKey                     = &GT_UISearchBarTextDidBeginEditingKey;
static const void *GT_UISearchBarShouldEndEditingKey                        = &GT_UISearchBarShouldEndEditingKey;
static const void *GT_UISearchBarTextDidEndEditingKey                       = &GT_UISearchBarTextDidEndEditingKey;
static const void *GT_UISearchBarTextDidChangeKey                           = &GT_UISearchBarTextDidChangeKey;
static const void *GT_UISearchBarShouldChangeTextInRangeKey                 = &GT_UISearchBarShouldChangeTextInRangeKey;
static const void *GT_UISearchBarSearchButtonClickedKey                                = &GT_UISearchBarSearchButtonClickedKey;
static const void *GT_UISearchBarBookmarkButtonClickedKey                                = &GT_UISearchBarBookmarkButtonClickedKey;
static const void *GT_UISearchBarCancelButtonClickedKey                                = &GT_UISearchBarCancelButtonClickedKey;
static const void *GT_UISearchBarResultsListButtonClickedKey                                = &GT_UISearchBarResultsListButtonClickedKey;
static const void *GT_UISearchBarSelectedScopeButtonIndexDidChangeKey                                = &GT_UISearchBarSelectedScopeButtonIndexDidChangeKey;




#pragma mark UISearchBar delegate Methods
- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar;
{
    GT_UISearchBarReturnBlock block = searchBar.gt_completionShouldBeginEditingBlock;
    if (block) {
        return block(searchBar);
    }
    id delegate = objc_getAssociatedObject(self, GT_UISearchBarDelegateKey);

    if (delegate && [delegate respondsToSelector:@selector(searchBarShouldBeginEditing:)]){
        return [delegate searchBarShouldBeginEditing:searchBar];
    }
    return YES;
}

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    GT_UISearchBarVoidBlock block = searchBar.gt_completionTextDidBeginEditingBlock;
    if (block) {
        block(searchBar);
    }
    id delegate = objc_getAssociatedObject(self, GT_UISearchBarDelegateKey);

    if (delegate && [delegate respondsToSelector:@selector(searchBarTextDidBeginEditing:)]){
        [delegate searchBarTextDidBeginEditing:searchBar];
    }
}

- (BOOL)searchBarShouldEndEditing:(UISearchBar *)searchBar
{
    GT_UISearchBarReturnBlock block = searchBar.gt_completionShouldEndEditingBlock;
    if (block) {
        return block(searchBar);
    }
    id delegate = objc_getAssociatedObject(self, GT_UISearchBarDelegateKey);

    if (delegate && [delegate respondsToSelector:@selector(searchBarShouldEndEditing:)]){
        return [delegate searchBarShouldEndEditing:searchBar];
    }
    return YES;
}

- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar
{
    GT_UISearchBarVoidBlock block = searchBar.gt_completionTextDidEndEditingBlock;
    if (block) {
        block(searchBar);
    }
    id delegate = objc_getAssociatedObject(self, GT_UISearchBarDelegateKey);

    if (delegate && [delegate respondsToSelector:@selector(searchBarTextDidEndEditing:)]){
        [delegate searchBarTextDidEndEditing:searchBar];
    }
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    GT_UISearchBarSearchTextBlock block = searchBar.gt_completionTextDidChangeBlock;
    if (block) {
        block(searchBar,searchText);
    }
    id delegate = objc_getAssociatedObject(self, GT_UISearchBarDelegateKey);

    if (delegate && [delegate respondsToSelector:@selector(searchBar:textDidChange:)]){
        [delegate searchBar:searchBar textDidChange:searchText];
    }
}
// called when text changes (including clear)
- (BOOL)searchBar:(UISearchBar *)searchBar shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    GT_UISearchBarInRangeReplacementTextBlock block = searchBar.gt_completionShouldChangeTextInRangeBlock;
    if (block) {
        return block(searchBar,range,text);
    }
    id delegate = objc_getAssociatedObject(self, GT_UISearchBarDelegateKey);

    if (delegate && [delegate respondsToSelector:@selector(searchBar:shouldChangeTextInRange:replacementText:)]){
        return [delegate searchBar:searchBar shouldChangeTextInRange:range replacementText:text];
    }
    return YES;
}
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    GT_UISearchBarVoidBlock block = searchBar.gt_completionSearchButtonClickedBlock;
    if (block) {
        block(searchBar);
    }
    id delegate = objc_getAssociatedObject(self, GT_UISearchBarDelegateKey);

    if (delegate && [delegate respondsToSelector:@selector(searchBarSearchButtonClicked:)]){
        [delegate searchBarSearchButtonClicked:searchBar];
    }
}

- (void)searchBarBookmarkButtonClicked:(UISearchBar *)searchBar
{
    GT_UISearchBarVoidBlock block = searchBar.gt_completionBookmarkButtonClickedBlock;
    if (block) {
        block(searchBar);
    }
    id delegate = objc_getAssociatedObject(self, GT_UISearchBarDelegateKey);

    if (delegate && [delegate respondsToSelector:@selector(searchBarBookmarkButtonClicked:)]){
        [delegate searchBarBookmarkButtonClicked:searchBar];
    }
}

- (void)searchBarCancelButtonClicked:(UISearchBar *) searchBar
{
    GT_UISearchBarVoidBlock block = searchBar.gt_completionCancelButtonClickedBlock;
    if (block) {
        block(searchBar);
    }
    id delegate = objc_getAssociatedObject(self, GT_UISearchBarDelegateKey);

    if (delegate && [delegate respondsToSelector:@selector(searchBarCancelButtonClicked:)]){
        [delegate searchBarCancelButtonClicked:searchBar];
    }
}

- (void)searchBarResultsListButtonClicked:(UISearchBar *)searchBar
{
    GT_UISearchBarVoidBlock block = searchBar.gt_completionResultsListButtonClickedBlock;
    if (block) {
        block(searchBar);
    }
    id delegate = objc_getAssociatedObject(self, GT_UISearchBarDelegateKey);

    if (delegate && [delegate respondsToSelector:@selector(searchBarResultsListButtonClicked:)]){
        [delegate searchBarResultsListButtonClicked:searchBar];
    }
}

- (void)searchBar:(UISearchBar *)searchBar selectedScopeButtonIndexDidChange:(NSInteger)selectedScope
{
    GT_UISearchBarScopeIndexBlock block = searchBar.gt_completionSelectedScopeButtonIndexDidChangeBlock;
    if (block) {
        block(searchBar,selectedScope);
    }
    id delegate = objc_getAssociatedObject(self, GT_UISearchBarDelegateKey);

    if (delegate && [delegate respondsToSelector:@selector(searchBar:selectedScopeButtonIndexDidChange:)]){
        [delegate searchBar:searchBar selectedScopeButtonIndexDidChange:selectedScope];
    }
}


#pragma mark Block setting/getting methods
- (BOOL (^)(UISearchBar *))gt_completionShouldBeginEditingBlock
{
    return objc_getAssociatedObject(self, GT_UISearchBarShouldBeginEditingKey);
}

- (void)setGt_completionShouldBeginEditingBlock:(BOOL (^)(UISearchBar *))searchBarShouldBeginEditingBlock
{
    [self gt_setDelegateIfNoDelegateSet];
    objc_setAssociatedObject(self, GT_UISearchBarShouldBeginEditingKey, searchBarShouldBeginEditingBlock, OBJC_ASSOCIATION_COPY);
}

- (void (^)(UISearchBar *))gt_completionTextDidBeginEditingBlock
{
    return objc_getAssociatedObject(self,GT_UISearchBarTextDidBeginEditingKey);
}

- (void)setGt_completionTextDidBeginEditingBlock:(void (^)(UISearchBar *))searchBarTextDidBeginEditingBlock
{
    [self gt_setDelegateIfNoDelegateSet];
    objc_setAssociatedObject(self, GT_UISearchBarTextDidBeginEditingKey, searchBarTextDidBeginEditingBlock, OBJC_ASSOCIATION_COPY);
}

- (BOOL (^)(UISearchBar *))gt_completionShouldEndEditingBlock
{
    return objc_getAssociatedObject(self, GT_UISearchBarShouldEndEditingKey);
}

- (void)setGt_completionShouldEndEditingBlock:(BOOL (^)(UISearchBar *))searchBarShouldEndEditingBlock
{
    [self gt_setDelegateIfNoDelegateSet];
    objc_setAssociatedObject(self, GT_UISearchBarShouldEndEditingKey, searchBarShouldEndEditingBlock, OBJC_ASSOCIATION_COPY);
}

- (void (^)(UISearchBar *))gt_completionTextDidEndEditingBlock
{
    return objc_getAssociatedObject(self, GT_UISearchBarTextDidEndEditingKey);
}

- (void)setGt_completionTextDidEndEditingBlock:(void (^)(UISearchBar *))searchBarTextDidEndEditingBlock
{
    [self gt_setDelegateIfNoDelegateSet];
    objc_setAssociatedObject(self, GT_UISearchBarTextDidEndEditingKey, searchBarTextDidEndEditingBlock, OBJC_ASSOCIATION_COPY);
}

- (void (^)(UISearchBar *, NSString *))gt_completionTextDidChangeBlock
{
    return objc_getAssociatedObject(self, GT_UISearchBarTextDidChangeKey);
}

- (void)setGt_completionTextDidChangeBlock:(void (^)(UISearchBar *, NSString *))searchBarTextDidChangeBlock
{
    [self gt_setDelegateIfNoDelegateSet];
    objc_setAssociatedObject(self, GT_UISearchBarTextDidChangeKey, searchBarTextDidChangeBlock, OBJC_ASSOCIATION_COPY);
}

- (BOOL (^)(UISearchBar *, NSRange, NSString *))gt_completionShouldChangeTextInRangeBlock
{
    return objc_getAssociatedObject(self, GT_UISearchBarShouldChangeTextInRangeKey);
}

- (void)setGt_completionShouldChangeTextInRangeBlock:(BOOL (^)(UISearchBar *, NSRange, NSString *))searchBarShouldChangeTextInRangeBlock
{
    [self gt_setDelegateIfNoDelegateSet];
    objc_setAssociatedObject(self, GT_UISearchBarShouldChangeTextInRangeKey, searchBarShouldChangeTextInRangeBlock, OBJC_ASSOCIATION_COPY);
}

- (void (^)(UISearchBar *))gt_completionSearchButtonClickedBlock
{
    return objc_getAssociatedObject(self, GT_UISearchBarSearchButtonClickedKey);
}

- (void)setGt_completionSearchButtonClickedBlock:(void (^)(UISearchBar *))searchBarSearchButtonClickedBlock
{
    [self gt_setDelegateIfNoDelegateSet];
    objc_setAssociatedObject(self, GT_UISearchBarSearchButtonClickedKey, searchBarSearchButtonClickedBlock, OBJC_ASSOCIATION_COPY);
}

- (void (^)(UISearchBar *))gt_completionBookmarkButtonClickedBlock
{
    return objc_getAssociatedObject(self, GT_UISearchBarBookmarkButtonClickedKey);
}

- (void)setGt_completionBookmarkButtonClickedBlock:(void (^)(UISearchBar *))searchBarBookmarkButtonClickedBlock
{
    [self gt_setDelegateIfNoDelegateSet];
    objc_setAssociatedObject(self, GT_UISearchBarBookmarkButtonClickedKey, searchBarBookmarkButtonClickedBlock, OBJC_ASSOCIATION_COPY);
}

- (void (^)(UISearchBar *))gt_completionCancelButtonClickedBlock
{
    return objc_getAssociatedObject(self, GT_UISearchBarCancelButtonClickedKey);
}

- (void)setGt_completionCancelButtonClickedBlock:(void (^)(UISearchBar *))searchBarCancelButtonClickedBlock
{
    [self gt_setDelegateIfNoDelegateSet];
    objc_setAssociatedObject(self, GT_UISearchBarCancelButtonClickedKey, searchBarCancelButtonClickedBlock, OBJC_ASSOCIATION_COPY);
}

- (void (^)(UISearchBar *))gt_completionResultsListButtonClickedBlock
{
    return objc_getAssociatedObject(self, GT_UISearchBarResultsListButtonClickedKey);
}

- (void)setGt_completionResultsListButtonClickedBlock:(void (^)(UISearchBar *))searchBarResultsListButtonClickedBlock
{
    [self gt_setDelegateIfNoDelegateSet];
    objc_setAssociatedObject(self, GT_UISearchBarResultsListButtonClickedKey, searchBarResultsListButtonClickedBlock, OBJC_ASSOCIATION_COPY);
}

- (void (^)(UISearchBar *, NSInteger))gt_completionSelectedScopeButtonIndexDidChangeBlock
{
    return objc_getAssociatedObject(self, GT_UISearchBarSelectedScopeButtonIndexDidChangeKey);
}

- (void)setGt_completionSelectedScopeButtonIndexDidChangeBlock:(void (^)(UISearchBar *, NSInteger))searchBarSelectedScopeButtonIndexDidChangeBlock
{
    [self gt_setDelegateIfNoDelegateSet];
    objc_setAssociatedObject(self, GT_UISearchBarSelectedScopeButtonIndexDidChangeKey, searchBarSelectedScopeButtonIndexDidChangeBlock, OBJC_ASSOCIATION_COPY);
}

- (void)gt_setDelegateIfNoDelegateSet
{
    if (self.delegate != (id<UISearchBarDelegate>)self) {
        objc_setAssociatedObject(self, GT_UISearchBarDelegateKey, self.delegate, OBJC_ASSOCIATION_ASSIGN);
        self.delegate = (id<UISearchBarDelegate>)self;
    }
}

@end
