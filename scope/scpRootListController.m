#include "scpRootListController.h"
#import <CepheiPrefs/HBListController.h>
#import <CepheiPrefs/HBTintedTableCell.h>
#import <CepheiPrefs/HBRootListController.h>
#import <CepheiPrefs/HBTwitterCell.h>
#import <CepheiPrefs/HBImageTableCell.h>
#import <CepheiPrefs/HBPackageNameHeaderCell.h>
//#import <CepheiPrefs/HBRespringController.h>

@implementation scpRootListController

- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"Root" target:self] retain];
	}

	return _specifiers;
}

+ (NSString *)hb_specifierPlist {
	return @"Root";
}

-(void)respring {
	system("killall -9 SpringBoard");
}
- (void)save
{
    [self.view endEditing:YES];
}
@end

@interface SBListController : PSListController {
}
-(id)specifiers;
@end

@interface LSListController : PSListController {
}
-(id)specifiers;
@end

@interface STBListController : PSListController {
}
-(id)specifiers;
@end

@interface NCListController : PSListController {
}
-(id)specifiers;
@end

@interface CCListController : PSListController {
}
-(id)specifiers;
@end

@interface IconListController : PSListController {
}
-(id)specifiers;
@end

@interface FolderListController : PSListController {
}
-(id)specifiers;
@end

@interface MiscListController : PSListController {
}
-(id)specifiers;
@end

@implementation IconListController
- (id)specifiers {
	if(_specifiers == nil) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"IconListController" target:self] retain];
	}
	return _specifiers;
}
@end

@implementation SBListController
- (id)specifiers {
	if(_specifiers == nil) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"SBListController" target:self] retain];
	}
	return _specifiers;
}
@end

@implementation LSListController
- (id)specifiers {
	if(_specifiers == nil) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"LSListController" target:self] retain];
	}
	return _specifiers;
}
@end

@implementation STBListController
- (id)specifiers {
	if(_specifiers == nil) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"STBListController" target:self] retain];
	}
	return _specifiers;
}
@end

@implementation NCListController
- (id)specifiers {
	if(_specifiers == nil) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"NCListController" target:self] retain];
	}
	return _specifiers;
}
@end

@implementation CCListController
- (id)specifiers {
	if(_specifiers == nil) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"CCListController" target:self] retain];
	}
	return _specifiers;
}
@end

@implementation FolderListController
- (id)specifiers {
	if(_specifiers == nil) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"FolderListController" target:self] retain];
	}
	return _specifiers;
}
@end

@implementation MiscListController
- (id)specifiers {
	if(_specifiers == nil) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"MiscListController" target:self] retain];
	}
	return _specifiers;
}
@end
