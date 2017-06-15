import UIKit
import SpriteKit

protocol MOptionProtocol
{
    var size:CGSize { get }
    var score:Int { get }
    var gameActive:Bool { get }
    
    init()
    func sceneWithSize(controller:UIViewController, size:CGSize) -> SKScene?
}
