import SpriteKit

protocol MGameProtocol
{
    var soundBackground:String? { get }
    var size:CGSize { get }
    var score:Int { get }
    var gameActive:Bool { get }
    
    init()
    func activateGame()
    func sceneWithSize(controller:UIViewController, size:CGSize) -> SKScene?
}
