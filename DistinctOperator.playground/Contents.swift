import UIKit
import RxSwift
let disposeBag = DisposeBag()
Observable.of("A" ,"A" ,"B" , "B" ,"A" ,"A" ,"C" ,"A")
    .distinctUntilChanged()
    .subscribe(onNext: {
        print($0)
    }).disposed(by: disposeBag)
struct Point {
    var x : Int
    var y : Int
}

let array = [Point(x: 0, y: 1),
                Point(x: 0, y: 2),
                Point(x: 1, y: 0),
                Point(x: 1, y: 1),
                Point(x: 1, y: 3),
                Point(x: 2, y: 1),
                Point(x: 2, y: 2),
                Point(x: 0, y: 0),
                Point(x: 3, y: 3),
                Point(x: 0, y: 1)]
Observable.from(array)
    .distinctUntilChanged{ (p1, p2)->Bool in
        p1.x==p2.x
    }.subscribe(onNext:{ point in
        print("Point: \(point.x), \(point.y)")
    })
    .disposed(by: disposeBag)

