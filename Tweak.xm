BOOL VoiceControl;
BOOL Spotlight;
BOOL BetaDot;
BOOL NoPageDots;
BOOL PinchToClose;
BOOL FolderLabels;
BOOL NoSBRotate;
BOOL NoUpdateDot;
BOOL FolderStatus; //Not Working
BOOL NoCCDots;
BOOL NoLSDots;
BOOL ColorCC;
BOOL SwitchStatus; //Not Working
BOOL NoLabels;
BOOL LiveClock;
BOOL CCRecord;
BOOL ReachOn;
BOOL LSRotate; //Not Working
BOOL NoBadges;
BOOL SameStatus;
BOOL DarkCC;
BOOL DockBG;
BOOL DateLine;
BOOL Unbold;
BOOL NoNoti; //Not Working
BOOL NoLSBar;
BOOL NCSwipe;
BOOL CCSwipe;
BOOL BreadCumb;
BOOL FolderBG;
BOOL TodayTime;
BOOL NowPlaying;
BOOL LowPower;
BOOL IconShadow;
BOOL LSStatus;
BOOL CustomCarrier;

static NSString * const iCarrierPreferencesFile = @"/var/mobile/Library/Preferences/com.harrrywantstodev.scope/STBListController.plist";


NSString *carierName   = @"";

%hook SBTelephonyManager

-(void)_reallySetOperatorName:(id)arg1 {

  NSDictionary *settings = [NSDictionary dictionaryWithContentsOfFile: iCarrierPreferencesFile];

  if(settings) {
    carierName = [settings objectForKey: @"carrierName"] ? [settings objectForKey: @"carrierName"] : carierName;
    arg1 = carierName;
  }
  return CustomCarrier ? %orig(carierName) : %orig(arg1);
}
%end
%hook SBLegibilitySettings
-(double)iconLabelLightShadowStrength
{
  return IconShadow ? -1 : %orig;
}
%end
%hook CCUILowPowerModeSetting
+(BOOL)isInternalButton
{
  return LowPower ? NO : %orig;
}
+(BOOL)isSupported:(int)arg1
{
  return LowPower ? YES : %orig;
}
+ (NSString *)statusOffString
{
	return @"Low Power Mode: Disabled";
}
+ (NSString *)statusOnString
{
	return @"Low Power Mode: Enabled";
}
- (UIImage *)glyphImageForState:(UIControlState)state
{
return [UIImage imageNamed:@"Shortcut-Battery" inBundle:[NSBundle bundleWithPath:@"/Applications/Preferences.app/"] compatibleWithTraitCollection:nil];
}
%end
%hook SBLockScreenNowPlayingController
-(void)setEnabled:(BOOL)arg1
{
	return NowPlaying ? %orig(FALSE) : %orig;
}
%end
%hook SBDashBoardTodayViewController
-(bool)_shouldHideDateTimeForZeroWidgetDisplay
{
	return TodayTime ? TRUE : %orig;
}
%end
%hook SBFolderBackgroundView
-(id)initWithFrame:(CGRect)arg1
{
	return FolderBG ? NULL : %orig;
}
%end
%hook UIStatusBarForegroundStyleAttributes
-(void)setCanShowBreadcrumbs:(BOOL)arg1
{
	return BreadCumb ? %orig(FALSE) : %orig;
}
-(BOOL)canShowBreadcrumbs
{
	return BreadCumb ? YES : %orig;
}
%end
%hook SBMainDisplaySceneManager
-(BOOL)_shouldBreadcrumbApplication:(id)arg1 withTransitionContext:(id)arg2
{
  return BreadCumb ? %orig(FALSE, FALSE) : %orig;
}
%end
%hook SBControlCenterController
-(bool)_shouldShowGrabberOnFirstSwipe
{
	return CCSwipe ? FALSE : %orig;
}
%end
%hook SBNotificationCenterController
-(bool)_shouldShowGrabberOnFirstSwipe
{
	return NCSwipe ? FALSE : %orig;
}
%end
%hook SBNotificationsViewController
-(id)contentUnavailableText
{
	return NoNoti ? NULL : %orig;
}
%end
%hook UIStatusBarTimeItemView
-(long long)textStyle
{
	return Unbold ? 0 : %orig;
}
%end
%hook SBSearchEtceteraDateViewController
-(void)setUseMultiLineDate:(BOOL)arg1
{
	return DateLine ? %orig(false) : %orig;
}
-(BOOL)useMultiLineDate
{
	return DateLine ? 0 : %orig;
}
%end
%hook SBDockView
-(void)setBackgroundAlpha:(double)arg1
{
	return DockBG ? %orig(0) : %orig;
}
%end
%hook CCUIControlCenterSettings
-(void)setBackgroundDarkening:(double)arg1
{
	return DarkCC ? %orig(0) : %orig;
}
%end
%hook SBUSSDAlert
-(long long)statusBarStyle
{
	return SameStatus ? 0 : %orig;
}
%end
%hook SBDashBoardViewController
-(bool)shouldShowLockStatusBarTime
{
	return LSStatus ? TRUE : %orig;
}
-(bool)managesOwnStatusBarAtActivation
{
	return NoLSBar ? FALSE : %orig;
}
-(bool)showsSpringBoardStatusBar
{
	return NoLSBar ? FALSE : %orig;
}
-(long long)statusBarStyle
{
	return SameStatus ? 0 : %orig;
}
%end
%hook SBApplicationInfo
-(long long)defaultStatusBarStyle
{
	return SameStatus ? 0 : %orig;
}
%end
%hook SBIconBadgeView
-(id)init
{
	return NoBadges ? nil : %orig;
}
%end
%hook SBLockScreenViewController
-(long long)statusBarStyle
{
	return SameStatus ? 0 : %orig;
}
- (bool)_forcesPortraitOrientation
{
	return LSRotate ? NO : %orig;
}
-(bool)shouldAutorotate
{
	return LSRotate ? FALSE : %orig;
}
%end
%hook SBReachabilityManager
+ (_Bool)reachabilitySupported {
  return ReachOn ? YES : %orig;
}
%end
%hook CCUIRecordScreenShortcut
+ (bool)isInternalButton
{
  return CCRecord ? NO : %orig;
}
+ (bool)isSupported:(int)arg1
{
  return CCRecord ? YES : %orig;
}
- (UIImage *)glyphImageForState:(UIControlState)state
{
  return [UIImage imageNamed:@"RecordVideo-OrbHW@2x.png" inBundle:[NSBundle bundleWithPath:@"/Applications/Camera.app/"] compatibleWithTraitCollection:nil];
}
%end
%hook SBClockApplicationIconImageView
- (void)_setAnimating:(_Bool)arg1
{
  return LiveClock ? %orig(false) : %orig;
}
%end
%hook SBIconLabelImageParameters
-(id)text {
  return NoLabels ? nil : %orig;
}
%end
%hook SBSwitcherMetahostingHomePageContentView
-(void)_createFakeStatusBar
{
  return SwitchStatus ? %orig() : %orig;
}
%end
%hook CCUIControlCenterButton
-(id)initWithFrame:(CGRect)arg1 selectedColor:(id)arg2 text:(id)arg3 type:(unsigned long long)arg4 {
  return ColorCC ? %orig(arg1, nil, arg3, arg4) : %orig;
}
%end
%hook SBDashBoardPageControl
- (id)initWithFrame:(CGRect)frame {
  return NoLSDots ? nil : %orig;
	}
//10.2
- (id)_indicatorViewEnabled:(_Bool)arg1 index:(long long)arg2
{
      return NoLSDots ? %orig(NO, arg2) : %orig;
	}
%end
%hook CCUIControlCenterPageControl
- (id)initWithFrame:(CGRect)frame
{
  return NoCCDots ? nil : %orig;
}
%end
%hook SpringBoard
-(long long) homeScreenRotationStyle
{
  return NoSBRotate ? NO : %orig;
}
%end
%hook SBVoiceControlController
-(bool) handleHomeButtonHeld
{
    return VoiceControl ? NO : %orig;
}
%end
%hook SBSearchScrollView
-(bool) gestureRecognizerShouldBegin:(id)arg1
{
    return Spotlight ? NO : %orig;
}
%end
%hook SBFolderSettings
-(bool) pinchToClose
{
	return PinchToClose ? YES : %orig;
}
-(void)_addFakeStatusBarView
{
  return FolderStatus ? %orig() : %orig;
}
%end
%hook SBLeafIcon
-(bool) isBeta
{
    return BetaDot ? NO : %orig;
}
-(BOOL)isRecentlyUpdated
{
  return NoUpdateDot ? NO : %orig;
}
%end
%hook SBIconPageIndicatorImageSetResult
-(id) pageIndicatorSet
{
	return NoPageDots ? NULL : %orig;
}
-(id) enabledPageIndicatorSet
{
	return NoPageDots ? NULL : %orig;
}
%end
%hook SBFolder
-(void) setDisplayName:(id)arg1
{
	return FolderLabels ? %orig(NULL) : %orig;
}
%end



static void loadPreferences() {
    CFPreferencesAppSynchronize(CFSTR("com.harrywantstodev.scope"));
    NSNumber *tempVal;

    tempVal = (NSNumber *)CFPreferencesCopyAppValue(CFSTR("VoiceControl"), CFSTR("com.harrywantstodev.scope"));
    VoiceControl = !tempVal ? YES : [tempVal boolValue];

    tempVal = (NSNumber *)CFPreferencesCopyAppValue(CFSTR("Spotlight"), CFSTR("com.harrywantstodev.scope"));
    Spotlight = !tempVal ? YES : [tempVal boolValue];

    tempVal = (NSNumber *)CFPreferencesCopyAppValue(CFSTR("BetaDot"), CFSTR("com.harrywantstodev.scope"));
    BetaDot = !tempVal ? YES : [tempVal boolValue];

    tempVal = (NSNumber *)CFPreferencesCopyAppValue(CFSTR("NoPageDots"), CFSTR("com.harrywantstodev.scope"));
    NoPageDots = !tempVal ? YES : [tempVal boolValue];

    tempVal = (NSNumber *)CFPreferencesCopyAppValue(CFSTR("PinchToClose"), CFSTR("com.harrywantstodev.scope"));
    PinchToClose = !tempVal ? YES : [tempVal boolValue];

    tempVal = (NSNumber *)CFPreferencesCopyAppValue(CFSTR("NoSBRotate"), CFSTR("com.harrywantstodev.scope"));
    NoSBRotate = !tempVal ? YES : [tempVal boolValue];

    tempVal = (NSNumber *)CFPreferencesCopyAppValue(CFSTR("NoUpdateDot"), CFSTR("com.harrywantstodev.scope"));
    NoUpdateDot = !tempVal ? YES : [tempVal boolValue];

    tempVal = (NSNumber *)CFPreferencesCopyAppValue(CFSTR("FolderStatus"), CFSTR("com.harrywantstodev.scope"));
    FolderStatus = !tempVal ? YES : [tempVal boolValue];

    tempVal = (NSNumber *)CFPreferencesCopyAppValue(CFSTR("FolderLabels"), CFSTR("com.harrywantstodev.scope"));
    FolderLabels = !tempVal ? YES : [tempVal boolValue];

    tempVal = (NSNumber *)CFPreferencesCopyAppValue(CFSTR("NoCCDots"), CFSTR("com.harrywantstodev.scope"));
    NoCCDots = !tempVal ? YES : [tempVal boolValue];

    tempVal = (NSNumber *)CFPreferencesCopyAppValue(CFSTR("NoLSDots"), CFSTR("com.harrywantstodev.scope"));
    NoLSDots = !tempVal ? YES : [tempVal boolValue];

    tempVal = (NSNumber *)CFPreferencesCopyAppValue(CFSTR("ColorCC"), CFSTR("com.harrywantstodev.scope"));
    ColorCC = !tempVal ? YES : [tempVal boolValue];

    tempVal = (NSNumber *)CFPreferencesCopyAppValue(CFSTR("SwitchStatus"), CFSTR("com.harrywantstodev.scope"));
    SwitchStatus = !tempVal ? YES : [tempVal boolValue];

    tempVal = (NSNumber *)CFPreferencesCopyAppValue(CFSTR("NoLabels"), CFSTR("com.harrywantstodev.scope"));
    NoLabels = !tempVal ? YES : [tempVal boolValue];

    tempVal = (NSNumber *)CFPreferencesCopyAppValue(CFSTR("LiveClock"), CFSTR("com.harrywantstodev.scope"));
    LiveClock = !tempVal ? YES : [tempVal boolValue];

    tempVal = (NSNumber *)CFPreferencesCopyAppValue(CFSTR("CCRecord"), CFSTR("com.harrywantstodev.scope"));
    CCRecord = !tempVal ? YES : [tempVal boolValue];

    tempVal = (NSNumber *)CFPreferencesCopyAppValue(CFSTR("ReachOn"), CFSTR("com.harrywantstodev.scope"));
    ReachOn = !tempVal ? YES : [tempVal boolValue];

    tempVal = (NSNumber *)CFPreferencesCopyAppValue(CFSTR("LSRotate"), CFSTR("com.harrywantstodev.scope"));
    LSRotate = !tempVal ? YES : [tempVal boolValue];

		tempVal = (NSNumber *)CFPreferencesCopyAppValue(CFSTR("NoBadges"), CFSTR("com.harrywantstodev.scope"));
		NoBadges = !tempVal ? YES : [tempVal boolValue];

		tempVal = (NSNumber *)CFPreferencesCopyAppValue(CFSTR("SameStatus"), CFSTR("com.harrywantstodev.scope"));
		SameStatus = !tempVal ? YES : [tempVal boolValue];

		tempVal = (NSNumber *)CFPreferencesCopyAppValue(CFSTR("DarkCC"), CFSTR("com.harrywantstodev.scope"));
		DarkCC = !tempVal ? YES : [tempVal boolValue];

		tempVal = (NSNumber *)CFPreferencesCopyAppValue(CFSTR("DockBG"), CFSTR("com.harrywantstodev.scope"));
		DockBG = !tempVal ? YES : [tempVal boolValue];

		tempVal = (NSNumber *)CFPreferencesCopyAppValue(CFSTR("DateLine"), CFSTR("com.harrywantstodev.scope"));
		DateLine = !tempVal ? YES : [tempVal boolValue];

		tempVal = (NSNumber *)CFPreferencesCopyAppValue(CFSTR("Unbold"), CFSTR("com.harrywantstodev.scope"));
		Unbold = !tempVal ? YES : [tempVal boolValue];

		tempVal = (NSNumber *)CFPreferencesCopyAppValue(CFSTR("NoNoti"), CFSTR("com.harrywantstodev.scope"));
		NoNoti = !tempVal ? YES : [tempVal boolValue];

		tempVal = (NSNumber *)CFPreferencesCopyAppValue(CFSTR("NoLSBar"), CFSTR("com.harrywantstodev.scope"));
		NoLSBar = !tempVal ? YES : [tempVal boolValue];

		tempVal = (NSNumber *)CFPreferencesCopyAppValue(CFSTR("NCSwipe"), CFSTR("com.harrywantstodev.scope"));
		NCSwipe = !tempVal ? YES : [tempVal boolValue];

		tempVal = (NSNumber *)CFPreferencesCopyAppValue(CFSTR("CCSwipe"), CFSTR("com.harrywantstodev.scope"));
		CCSwipe = !tempVal ? YES : [tempVal boolValue];

		tempVal = (NSNumber *)CFPreferencesCopyAppValue(CFSTR("BreadCumb"), CFSTR("com.harrywantstodev.scope"));
		BreadCumb = !tempVal ? YES : [tempVal boolValue];

		tempVal = (NSNumber *)CFPreferencesCopyAppValue(CFSTR("FolderBG"), CFSTR("com.harrywantstodev.scope"));
		FolderBG = !tempVal ? YES : [tempVal boolValue];

		tempVal = (NSNumber *)CFPreferencesCopyAppValue(CFSTR("TodayTime"), CFSTR("com.harrywantstodev.scope"));
		TodayTime = !tempVal ? YES : [tempVal boolValue];

		tempVal = (NSNumber *)CFPreferencesCopyAppValue(CFSTR("NowPlaying"), CFSTR("com.harrywantstodev.scope"));
		NowPlaying = !tempVal ? YES : [tempVal boolValue];

    tempVal = (NSNumber *)CFPreferencesCopyAppValue(CFSTR("LowPower"), CFSTR("com.harrywantstodev.scope"));
    LowPower = !tempVal ? YES : [tempVal boolValue];

    tempVal = (NSNumber *)CFPreferencesCopyAppValue(CFSTR("LSStatus"), CFSTR("com.harrywantstodev.scope"));
    LSStatus = !tempVal ? YES : [tempVal boolValue];

    tempVal = (NSNumber *)CFPreferencesCopyAppValue(CFSTR("CustomCarrier"), CFSTR("com.harrywantstodev.scope"));
    CustomCarrier = !tempVal ? YES : [tempVal boolValue];

    [tempVal release];
}

%ctor {

    CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(),
        NULL,
        (CFNotificationCallback)loadPreferences,
        CFSTR("com.harrywantstodev.scope/settingschanged"),
        NULL,
        CFNotificationSuspensionBehaviorDeliverImmediately);
    loadPreferences();
  }
