import UIKit
import RxSwift

//take(:_)
/*
let bag = DisposeBag()
let array = Array(1...9)
Observable.from(array).take(5)
    .subscribe(onNext: { value in
        print(value)
    }).disposed(by: bag)
 */
let bag = DisposeBag()
Observable.of(1,2,3,4,5,6,7,8,9).take(5).subscribe(onNext:{ value in
        print(value)
    })
    .disposed(by: bag)

print("/////////////////")

//take(while:_)
let bag2 = DisposeBag()
let array = Array(1...9)
Observable.from(array)
    .take(while: { $0 < array.capacity})
    .subscribe(onNext: { value in
        print(value)
    }).disposed(by: bag2)

print("/////////////////")
//enumerated()
let bag3 = DisposeBag()
Observable.of(2, 4, 6, 8, 0, 12, 1, 3, 4, 6, 2)
    .enumerated()
    .take(while: { index, value in
        value%2 == 0 && index < 3
    }).subscribe(onNext:{ (value) in
        print(value)
    }).disposed(by: bag3)

print("/////////////////")

//take(until:_)
let bag4 = DisposeBag()
let subject = PublishSubject<String>()
let trigger = PublishSubject<String>()
subject.take(until: trigger)
    .subscribe(onNext :{ value in
    print(value)
    }).disposed(by: bag4)
subject.onNext("1")
subject.onNext("2")
subject.onNext("3")
subject.onNext("4")
subject.onNext("5")
trigger.onNext("XXX")
subject.onNext("6")
subject.onNext("7")
//This line is only used to test GitHub desktop
