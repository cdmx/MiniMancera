import UIKit
import SpriteKit

protocol MGameProtocol
{
    var size:CGSize { get }
    var score:Int { get }
    var gameActive:Bool { get }
    var soundBackground:String? { get }
    
    init()
    func activateGame()
    func sceneWithSize(controller:UIViewController, size:CGSize) -> SKScene?
}
