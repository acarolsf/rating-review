# Rating Review
App to test `SKStoreReviewController`.

It is very simple to implement the alert to make easier to users to make comments at the store.

This example will ask users to Review the app after they use the app in during X times after a release.

## How to use

### - Simple use

In fact, to display alert to Rate app you just need to import 
```
import StoreKit
```

and, where you decided to show the alert, you can call

- if your app target deployment is lower than `iOS 14.0`, you will have to add

```
SKStoreReviewController.requestReview()
```

- but, if your app target deployment is higher than `iOS 14.0`, you will have to add

```
if let scene = UIApplication.shared.connectedScenes.first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene {
    SKStoreReviewController.requestReview(in: scene)
}
```
 
### - Use with some condition

First, you have to copy [RatingManager.swift](/rating-review/Manager/RatingManager.swift) to your project.

Then, you have to increment how many times the user open the app. So, you have to add

```
RatingManager.incrementNumberOfTimesLaunched()
```

to your `AppDelegate.swift` on `didFinishLaunchingWithOptions` function.

Then, after you decide where the user will see the alert, you have to ask:

```
RatingManager.displayStoreKit()
```

Then, user will be able to see something like this in your app:

![review](/media/review.png)