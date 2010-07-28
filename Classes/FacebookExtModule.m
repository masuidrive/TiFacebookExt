/**
 * Your Copyright Here
 *
 * Appcelerator Titanium is Copyright (c) 2009-2010 by Appcelerator, Inc.
 * and licensed under the Apache Public License (version 2)
 */
#import "FacebookExtModule.h"
#import "TiBase.h"
#import "TiHost.h"
#import "TiUtils.h"


@interface FacebookModule (exists)
- (void)logout;
@end

@implementation FacebookModule (ext)

- (void)showLoginDialog:(id)args
{
	ENSURE_ARG_COUNT(args, 0);
	FBLoginCallback *cb = [[FBLoginCallback alloc] initWithCallback:nil module:self];
	[self performSelectorOnMainThread:@selector(showDialog:) withObject:cb waitUntilDone:NO];
}

- (void)sessionLogout:(id)args
{
	[self logout];
}
@end


@implementation FBLoginCallback

- (id)initWithCallback:(KrollCallback*)callback_ module:(FacebookModule*)module_
{
	NSLog(@"FBLoginCallback:init")
	if (self = [super initWithCallback:callback_ module:module_])
	{
		// Nothing
	}
	return self;
}

- (void)dealloc
{
	[super dealloc];
}

- (FBDialog*)newDialog
{
	NSLog(@"FBLoginCallback:new dialog")
	FBLoginDialog *dialog_ = [[FBLoginDialog alloc] init];
	return dialog_;
}

- (void)dialogDidSucceed:(FBDialog*)dialog_
{
	NSLog(@"[DEBUG] FacebookExt login dialogDidSucceed");
	NSDictionary *event = [NSDictionary dictionaryWithObjectsAndKeys:[NSNull null],@"error",[NSNumber numberWithBool:true],@"success",[NSNumber numberWithBool:false],@"cancel",@"login",@"event",nil];
	[module _fireEventToListener:@"login" withObject:event listener:callback thisObject:nil];
	[self autorelease];
}

- (void)dialogDidCancel:(FBDialog*)dialog_
{
	NSLog(@"[DEBUG] FacebookExt login dialogDidCancel");
	NSDictionary *event = [NSDictionary dictionaryWithObjectsAndKeys:[NSNull null],@"error",[NSNumber numberWithBool:false],@"success",[NSNumber numberWithBool:true],@"cancel",@"login",@"event",nil];
	[module _fireEventToListener:@"login" withObject:event listener:callback thisObject:nil];
	[self autorelease];
}

- (void)dialog:(FBDialog*)dialog_ didFailWithError:(NSError*)error
{
	NSLog(@"[ERROR] FacebookExt login dialog failed with error = %@",[error description]);
	NSDictionary *event = [NSDictionary dictionaryWithObjectsAndKeys:[error description],@"error",[NSNumber numberWithBool:false],@"success",[NSNumber numberWithBool:false],@"cancel",@"login",@"event",nil];
	[module _fireEventToListener:@"login" withObject:event listener:callback thisObject:nil];
	[self autorelease];
}
@end
