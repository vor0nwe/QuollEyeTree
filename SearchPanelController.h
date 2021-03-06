//
//  SearchPanelController.h
//  QuollEyeTree
//
//  Created by Ian Binnie on 13/06/12.
//  Copyright (c) 2012 Ian Binnie. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface SearchPanelController : NSWindowController {
    BOOL regexPermitted;
}
@property (assign) IBOutlet NSTextField *searchFor;
@property (assign) IBOutlet NSMatrix *regex;
//@property (assign, readonly) IBOutlet NSButton *caseSensitive;
@property (assign) IBOutlet NSButton *caseSensitive;

- (IBAction)cancelSearch:(id)sender;
- (IBAction)performSearch:(id)sender;

+ (SearchPanelController *)singleton;
- (NSInteger)runModal;
- (NSString *)searchString;
- (NSString *)searchArguments;
- (BOOL)isCaseSensitive;
- (BOOL)regexSearch;
- (void)allowRegex:(BOOL)reg;

@end
