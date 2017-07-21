# ViperKit

[![build status](https://gitlab.smedialink.com/iOS/ViperKit/badges/master/build.svg)](https://gitlab.smedialink.com/iOS/ViperKit/commits/master)

ViperKit — по сути свифтовый аналог [ViperMcFlurry]. В нем есть базовые реализации `TransitionHandler`-a и стандартных протоколов используемых в архитектуре VIPER.

В основном он выступает как база для модулей генерируемых [генерамбой][Generamba] на [нашем шаблоне][Template].

## Installation

ViperKit пока доступен только из локального репозитория cocoapods, поэтому чтобы установить его, нам необходимо добавить внутренний репозиторий как source, и сам Pod. 

**Внимание:** принципиально важно сохранить порядок источников подов, чтобы cocoapods сначала искал в локальном, а потом в публичном.

```ruby
source 'https://gitlab.smedialink.com/iOS/SmlPodsRepo.git'
source 'https://github.com/CocoaPods/Specs.git'

pod 'ViperKit'
pod 'ViperKit/PKHUD' # со стандартной реализацией протокола ViewInput
pod 'ViperKit/Dip'   # для подключения DiKit
```

## Author

George Kiriy, gkiriy@smedialink.com

## License

ViperKit is available under the MIT license. See the LICENSE file for more info.

[ViperMcFlurry]: https://github.com/rambler-digital-solutions/ViperMcFlurry
[Generamba]: https://github.com/rambler-digital-solutions/Generamba
[Template]: https://gitlab.smedialink.com/iOS/generamba_templates
