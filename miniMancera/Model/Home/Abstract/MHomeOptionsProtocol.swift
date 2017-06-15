import UIKit

protocol MHomeOptionsProtocol
{
    var available:Bool { get }
    var title:String? { get }
    var descr:String? { get }
    var thumbnail:UIImage? { get }
    var splashImage:UIImage? { get }
    
    init(dataOption:DOption)
    func selected() -> UIViewController?
}
