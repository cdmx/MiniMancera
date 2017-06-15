import UIKit
import SpriteKit

protocol MOptionProtocol
{
    var size:CGSize { get }
    var score:Int { get }
    var gameActive:Bool { get }
    var soundBackground:String? { get }
    
    init()
    func sceneWithSize(controller:UIViewController, size:CGSize) -> SKScene?
}
