//
//  MyOutlineView.m
//  QuollEyeTree
//
//  Created by Ian Binnie on 18/07/11.
//  Copyright 2011 Ian Binnie. All rights reserved.
//

#import "MyOutlineView.h"

@implementation MyOutlineView

- (void)keyDown:(NSEvent *)theEvent
{
	unichar keyChar = [[theEvent charactersIgnoringModifiers] characterAtIndex:0];
	if ([theEvent modifierFlags] & NSCommandKeyMask) {
		if([self.keyDelegate respondsToSelector:@selector(keyCmdPressedInOutlineView:)])
			if([self.keyDelegate keyCmdPressedInOutlineView:keyChar])
				return;
	}
	if ([theEvent modifierFlags] & NSControlKeyMask) {
		if([self.keyDelegate respondsToSelector:@selector(keyCtlPressedInOutlineView:)])
			if([self.keyDelegate keyCtlPressedInOutlineView:keyChar])
				return;
	}
	if([self.keyDelegate respondsToSelector:@selector(keyPressedInOutlineView:)])
		if([self.keyDelegate keyPressedInOutlineView:keyChar])
			return;
	[super keyDown:theEvent];
}
- (void)mouseDown:(NSEvent *)theEvent {
	if([self.keyDelegate respondsToSelector:@selector(mouseDownInOutlineView)])
		[self.keyDelegate mouseDownInOutlineView];
	[super mouseDown:theEvent];
}
- (NSMenu *)menuForEvent:(NSEvent *)theEvent {
	NSPoint pt = [self convertPoint:[theEvent locationInWindow] fromView:nil];
	self.focusedItem = [self itemAtRow: [self rowAtPoint:pt]];
	NSMenu *menu = [self menu];
	if([self.keyDelegate respondsToSelector:@selector(validateContextMenu:)])
		[self.keyDelegate validateContextMenu:menu];
	return menu;
}

@end