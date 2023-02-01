# Quick Start

1. Get the API key on the website [geohelper.info](http://geohelper.info)

2. Create instance of ``GeoHelper/GeoHelper`` using the previously obtained key

```swift
let geohelper = GeoHelper(apiKey: "MY_API_KEY")
```

By default, the GeoHelper client itself initializes the localization settings ``LocaleConfiguration``, based on the settings of `Locale.preferredLanguages`. But you can also specify these parameters manually:

```swift
let localeConfig = LocaleConfiguration(lang: "ru", fallbackLang: "en")
let geohelper = GeoHelper(apiKey: "MY_API_KEY", localeConfiguration: localeConfig)
```

You can also add monitoring, if you wish, using `Alamofire.EventMonitor`. You can read more about this [in the Alamofire's documentation](https://github.com/Alamofire/Alamofire/blob/master/Documentation/AdvancedUsage.md#adding-eventmonitors).

```swift
let localeConfig = LocaleConfiguration(lang: "ru", fallbackLang: "en")
let monitor = ClosureEventMonitor()
monitor.requestDidCompleteTaskWithError = { (request, task, error) in
    debugPrint(request)
}
let geohelper = GeoHelper(apiKey: "MY_API_KEY", localeConfiguration: localeConfig, eventMonitors: [monitor])
```

3. Using the created GeoHelper client, create a request. You can use async/await methods as well as the classic closure callbacks:

```swift

let response = try await self.geohelper.countries(order: OrderInput(by: "name", dir: .asc))
debugPrint(response) // result is PaginatedResponse<Country>

geohelper.countries(order: OrderInput(by: "name", dir: .asc), completion: { result in
    debugPrint(result) // result is Result<PaginatedResponse<Country>, Error>
})

```
