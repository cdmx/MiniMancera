import UIKit

protocol MHomeOptionsProtocol
{
    associatedtype OptionProtocol:MOptionProtocol
    weak var dataOption:DOption? { get }
    var available:Bool { get }
    var title:String? { get }
    var descr:String? { get }
    var thumbnail:UIImage? { get }
    var splashImage:UIImage? { get }
    var gameController:ControllerGame<OptionProtocol>.Type? { get }
    
    init(dataOption:DOption)
    func selected() -> UIViewController?
}
