import UIKit

protocol MHomeOptionsProtocol
{
    var available:Bool { get }
    var title:String { get }
    var thumbnail:UIImage { get }
    init()
    func gameController() -> UIViewController
}
