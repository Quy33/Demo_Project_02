import UIKit
import RxSwift

//skip(:_)
let disposebag = DisposeBag()

Observable.of("A", "B", "C", "D", "E", "F")
    .skip(3)
    .subscribe(onNext: {
        print($0)
    }).disposed(by: disposebag)

let bag = DisposeBag()

print("//////////")

//skip(while:_)
Observable.of(2, 4, 8, 9 ,2 ,4 , 5, 7, 0, 10)
    .skip(while: { $0 % 2 == 0 })
    .subscribe(onNext: { print($0) }).disposed(by: bag)

print("//////////")

//skip(until:_)
let bag2 = DisposeBag()
let subject = PublishSubject<String>()
let trigger = PublishSubject<String>()

subject
    .skip(until: trigger)
    .subscribe(onNext:{ value in
            print(value)
    }).disposed(by: bag2)
subject.onNext("1")
subject.onNext("2")
subject.onNext("3")
subject.onNext("4")
subject.onNext("5")

trigger.onNext("XXX")

subject.onNext("6")
subject.onNext("7")

