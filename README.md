# ghibli-films-ios

Application iOS SwiftUI d'entretien technique affichant les films Studio Ghibli via l'API publique ghibliapi.vercel.app.

Stack
Swift
SwiftUI
MVVM
Clean Architecture légère
async/await
XCTest
Architecture
App/ : point d'entrée et injection des dépendances
Domain/ : entités, protocole repository, use case
Data/ : DTO, mapping, client API, repository concret
Presentation/ : ViewModels, états de vue et vues SwiftUI
Tests
Mapper tests
Repository tests avec APIClient mocké
ViewModel tests pour succès, chargement et erreur
