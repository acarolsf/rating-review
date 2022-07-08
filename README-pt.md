# Rating Review
App para testar `SKStoreReviewController`. 

É muito simples implementar o alerta que facilita os usuário a fazer os comentários na loja.

Este exemplo vai pedir para os usuários avaliar o app depois de algum tempo após a última atualização.

## Como usar

### - Uso simples

Para mostrar o alerta de avaliar o app, você só precisa importar
```
import StoreKit
```

e, onde você decidir mostrar o alerta, você pode chamar:

- se o deployment target do seu app é menor que `iOS 14.0`, você vai adicionar:

```
SKStoreReviewController.requestReview()
```

- mas, se o deployment target do seu app é maior que `iOS 14.0`, você vai adicionar:

```
if let scene = UIApplication.shared.connectedScenes.first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene {
    SKStoreReviewController.requestReview(in: scene)
}
```
 
### - Para utilizar com alguma condição

Primeiro, você vai ter que copiar [RatingManager.swift](/rating-review/Manager/RatingManager.swift) para o seu projeto.

Então, você tem que incrementar a quantidade de vezes o usuário abre o app, então você tem que adicionar:

```
RatingManager.incrementNumberOfTimesLaunched()
```

no seu `AppDelegate.swift` na função `didFinishLaunchingWithOptions`.

Então, depois que decidir onde e quando o usuário irá ver o alerta, você deve adicionar:

```
RatingManager.displayStoreKit()
```

> **OBS.:** Se preferir, você pode utilizar chaves diferentes no `UserDefaults` e personalizar o código da melhor forma para adaptar ao seu projeto.

Com isso, você conseguirá ver algo desse jeito:

![review](/media/review.png)