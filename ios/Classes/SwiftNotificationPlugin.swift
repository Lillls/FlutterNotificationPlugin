import Flutter
import UIKit

@available(iOS 10.0, *)
public class SwiftNotificationPlugin: NSObject, FlutterPlugin {
 public static func register(with registrar: FlutterPluginRegistrar) {
         let channel = FlutterMethodChannel(name: "flutter_notification_plugin", binaryMessenger: registrar.messenger())
         let instance = SwiftNotificationPlugin()
         registrar.addMethodCallDelegate(instance, channel: channel)
     }

     public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
         switch call.method {
         case "init":
             let arguments = call.arguments as! NSDictionary
             initNotification();
             sendNotification(hour: arguments["hour"] as! Int,minute: arguments["minute"] as! Int)
         default: break

         }
     }

     @available(iOS 10.0, *)
     private func initNotification(){
         let uns = UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
         UIApplication.shared.registerUserNotificationSettings(uns)

     }

     //添加本地推送和设置固定时间推送了
     func sendNotification(hour: Int,minute: Int) {
         let content = UNMutableNotificationContent()
         content.title = "今天你存钱了吗?"
         content.body = "快来存钱吧~"
         content.sound = UNNotificationSound.default()
         // Configure the recurring date.
         var dateComponents = DateComponents()
         dateComponents.calendar = Calendar.current
         dateComponents.hour = hour
         dateComponents.minute = minute

         // Create the trigger as a repeating event.
         let trigger = UNCalendarNotificationTrigger(
             dateMatching: dateComponents, repeats: true)

         // Create the request
         let uuidString = UUID().uuidString
         let request = UNNotificationRequest(identifier: uuidString,
                                             content: content, trigger: trigger)

         // Schedule the request with the system.
         let notificationCenter = UNUserNotificationCenter.current()
         notificationCenter.add(request) { (error) in
             if error != nil {

             }
         }
     }

}
