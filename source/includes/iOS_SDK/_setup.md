# iOS SDK

## Getting Started

The MDLConnect SDK for iOS allows you to integrate your iOS app with MDLive's video appointment service.

### Step 1 - Setup

Download the iOS SDK

### Step 2 -  Add SDK to Project

1) Open your application's Xcode project.
2) Drag the MDLConnect framework into Xcode's Project Navigator. When prompted, select "Copy items if needed" and continue.

## Video Appointment
### Initialize user variables

In order to initiate a video call, you will need to pass in the user's token and user id to the framework.

`Objective-C`

`[[MDLEmbedKitVideoCore sharedInstance] setAuthorizationToken:@"TOKEN" userID:@"USER_ID”];`

### Start appointment

You can call the following function with the appointment ID to start the video session.

`Objective-C`

` [[MDLEmbedKitVideoCore sharedInstance] startVideoSessionWithAppointmentID:@"APPOINTMENT_ID" onConnect:^(UIViewController * _Nullable viewController, NSString * _Nullable message) {
    // Connected session
} onDisconnect:^(UIViewController * _Nullable viewController, BOOL userHangUp) {
    // Disconnected session
}];`
