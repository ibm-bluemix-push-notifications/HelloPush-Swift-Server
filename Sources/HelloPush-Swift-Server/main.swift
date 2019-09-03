import IBMPushNotifications
import Foundation

// MARK: Initialize PushNotifications with apiKey
let myPushNotifications = PushNotifications(pushApiKey:"j0IuKEYWJ3sF891hjykvekTlkohGZxQH66dKQVA7ZjXT", pushAppGuid: "459c2266-55bc-4827-bcb1-f5af13d13fc5", pushRegion: PushNotifications.Region.US_SOUTH)

// MARK: GET AUTH TOKEN
myPushNotifications.getAuthToken(completionHandler: { (hasToken, tokenString) in
    if hasToken! {
        // Send push notifications
    }
})

// MARK: Initialize PushNotifications with appsecret

//let myPushNotifications = PushNotifications(pushRegion: PushNotifications.Region.US_SOUTH, pushAppGuid: "your-push-service-guid", pushAppSecret: "your-push-service-appSecret")


// MARK: FCM

let lights = Notification.Settings.GcmLights(ledArgb: GcmLED.Green, ledOnMs: 3, ledOffMs: 3)
let style = Notification.Settings.GcmStyle(type: GcmStyleTypes.inbox_notification,
                                           title: "inbox notification", url: "https://IBMCloud.net/image.png",
                                           text: "some big text", lines: ["line 1","line 2"])


let gcmSettings = Notification.Settings.Gcm(androidTitle:"title", collapseKey: "collapseKey1", delayWhileIdle: false,
                                            payload: ["key1":"value1"], priority: GcmPriority.DEFAULT,
                                            sound: "sound.wav", timeToLive: 2,
                                            interactiveCategory: "category1", icon: "icon.png",
                                            sync: false, visibility: GcmVisibility.Public,
                                            lights: lights, style: style,type: FCMType.DEFAULT)


// MARK:APNS

let apnsSetting = Notification.Settings.Apns(badge: 1, interactiveCategory: "Category",
                                             iosActionKey: "VIEW", sound: "Newtune.wav", type: ApnsType.DEFAULT,
                                             payload: ["key1":"value1"], titleLocKey: "TITLE1", locKey: "LOCKEY1",
                                             launchImage: "launchImage1.png", titleLocArgs: ["arg1","arg2"],
                                             locArgs: ["arg3","arg4"], title: "welcome to IBM Cloud Push service",
                                             subtitle: "Push Notifications", attachmentUrl: "https://IBMCloud.net/image.png")


// MARK: FireFox
let firefoxSetttings = Notification.Settings.FirefoxWeb(title: "IBM Cloud Push Notifications",
                                                        iconUrl: "https://IBM Cloud.net/icon.png",
                                                        payload: ["key1":"value1"], timeToLive: 3)

// MARK: Chrome

let chromeSetttings = Notification.Settings.ChromeWeb(title: "IBM Cloud Push Notifications",
                                                      iconUrl: "https://IBMCloud.net/icon.png",
                                                      payload: ["key1":"value1"], timeToLive: 3)

// Safari

let safariSettings = Notification.Settings.SafariWeb(title: "IBM Cloud Push Notifications", urlArgs: ["https://IBMCloud.net"], action: "View")

// MARK: Chrome App/ Ext

let chromeAppExtSettings = Notification.Settings.ChromeAppExt(title: "IBM Cloud Push Notifications", iconUrl: "https://IBMCloud.net/icon.png", collapseKey: "collapseKey1", delayWhileIdle: false, payload: ["key1":"value1"], timeToLive: 4)


// MARK: targets

let targetExample = Notification.Target(deviceIds: ["device1","device2"],
                                        userIds: ["userId1", "userId2"],
                                        platforms: [TargetPlatform.Apple,TargetPlatform.Google,TargetPlatform.ChromeExtApp,TargetPlatform.WebChrome,TargetPlatform.webFirefox,TargetPlatform.WebSafari], tagNames: ["tag1", "tag2"])


let messageExample = Notification.Message(alert: "Testing IBMPushNotifications")
//let notificationExample = Notification(message: messageExample)

let notificationExample = Notification(message: messageExample,
                                       apnsSettings: apnsSetting, gcmSettings: gcmSettings, firefoxWebSettings: firefoxSetttings,
                                       chromeWebSettings: chromeSetttings, safariWebSettings: safariSettings, chromeAppExtSettings: chromeAppExtSettings)


// MARK: Send Push

myPushNotifications.send(notification: notificationExample) { (data, status, error) in
    if error != nil {
        print("Failed to send push notification. Error: \(error!)")
    }
}
