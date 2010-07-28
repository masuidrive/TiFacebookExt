/**
 * Your Copyright Here
 *
 * Appcelerator Titanium is Copyright (c) 2009-2010 by Appcelerator, Inc.
 * and licensed under the Apache Public License (version 2)
 */
#import "TiModule.h"
#import "FacebookModule.h"

@interface FacebookModule (ext) //<FBSessionDelegate> 
- (void)showLoginDialog:(id)args;
- (void)sessionLogout:(id)args;
@end

@interface FBLoginCallback : FBDialogCallback {
}
@end
