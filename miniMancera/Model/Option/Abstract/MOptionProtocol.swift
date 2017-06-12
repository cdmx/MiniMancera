import UIKit
import SpriteKit

protocol MOptionProtocol
{
    init()
    func sceneWithSize(controller:UIViewController, size:CGSize) -> SKScene?
}
