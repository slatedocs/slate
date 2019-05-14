# کیت توسعه‌دهندگان
## نیازمندی‌ها

1. بارگزاری اپلیکیشن در [پنل توسعه‌دهندگان سیبچه](https://sibche.com/developer)
1. دریافت API Key عمومی برنامه از پنل توسعه‌دهندگان
1. آخرین نسخه‌ی XCode

## نصب کیت توسعه‌دهندگان
### نصب از طریق Cocoapods
#### آماده‌سازی cocoapods
برای نصب از طریق cocoapods باید پیش از نصب کیت فایل pod ساخته شده باشد. برای این کار ابتدا نیاز است cocoapods در سیستم شما نصب باشد و سپس باید cocoapods را در پروژه فعال کنید.

> نصب cocoapods در سیستم


```shell
sudo gem install cocoapods
```

> راه‌اندازی cocoapods

```shell
pod init
```
#### نصب کیت سیبچه

> اگر podfile از قبل موجود است، کیت سیبچه را به پیش‌نیازها اضافه کنید
```ruby
pod 'SBStoreKit', '~> 1.0'
```

> اگر podfile موجود نیست، فایل podfile را ساخته و کد زیر را در آن قرار دهید
```ruby
# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'TestAppWithPods' do
  # Uncomment the next line if you're using Swift or would like to use dynamic frameworks
  # use_frameworks!

  # Pods for TestAppWithPods
  pod 'SBStoreKit', '~> 1.0'
end
```

> سپس پادهای اضافه‌شده را نصب کنید
```shell
pod repo update
pod install
```

### نصب دستی

کیت توسعه‌دهندگان سیبچه را می‌توانید از [این‌جا](https://cdn.sibche.com/sibche-developer/SBStoreKit-beta-0.1.0.zip) دانلود کرده و به پروژه خود اضافه کنید

## تنظیمات اولیه
### افزودن schema سیبچه به پروژه
کد زیر راه به `info.plist` خود اضافه کنید:

```xml
<key>LSApplicationQueriesSchemes</key>
<array>
	<string>newsibche</string>
</array>
```
