import UIKit
import RxSwift
let bag3 = DisposeBag()
let array = Array(1...9)
Observable.from(array).take(5)
    .subscribe(onNext: { value in
        print(value)
    }).disposed(by: bag3)
print("/////////////////")
let bag4 = DisposeBag()

Observable.from(array)
    .take(while: { $0 < array.capacity})
    .subscribe(onNext: { value in
        print(value)
    }).disposed(by: bag4)

let bag5 = DisposeBag()
Observable.of(2, 4, 6, 8, 0, 12, 1, 3, 4, 6, 2)
    .enumerated()
    .take(while: { index, value in
        value%2 == 0 && index < 3
    }).subscribe(onNext:{ (value) in
        print(value)
    }).disposed(by: bag5)

let bag6 = DisposeBag()
let subject1 = PublishSubject<String>()
let trigger1 = PublishSubject<String>()
subject1.take(until: trigger1)
    .subscribe(onNext :{ value in
    print(value)
    }).disposed(by: bag6)
subject1.onNext("1")
subject1.onNext("2")
subject1.onNext("3")
subject1.onNext("4")
subject1.onNext("5")
trigger1.onNext("XXX")
subject1.onNext("6")
subject1.onNext("7")

