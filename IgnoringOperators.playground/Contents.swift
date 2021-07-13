import UIKit
import RxSwift

let subject = PublishSubject<String>()
let bag = DisposeBag()

subject
.ignoreElements()
    .subscribe { event in
          print(event)
        }
    .disposed(by: bag)

subject.onNext("1")
subject.onNext("2")
subject.onNext("3")

subject.onCompleted()

let subject1 = PublishSubject<String>()
let bag1 = DisposeBag()
subject1.element(at: 4).subscribe{ event in
    print(event)
}
.disposed(by: bag1)
subject.onNext("1")
subject.onNext("2")
subject.onNext("3")
subject.onCompleted()

let bag2 = DisposeBag()
let array = Array(0...10)
Observable.from(array).filter{ $0 % 2 == 0}
    .subscribe( onNext: {print($0)}).disposed(by: bag2)

