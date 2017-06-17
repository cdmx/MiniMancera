import UIKit
import SpriteKit

class MOptionPollutedGardenBubbleGenerator
{
    private weak var controller:COptionPollutedGarden!
    private var maxX:CGFloat
    private var maxY:CGFloat
    private let bubbleTypes:[MOptionPollutedGardenBubbleType]
    private let colours:[UIColor]
    private let explodeAnimation:SKAction
    private let kAddYPos:CGFloat = 150
    private let countBubbles:UInt32
    private let countColours:UInt32
    
    init()
    {
        bubbleTypes = MOptionPollutedGardenBubbleGenerator.factoryBubbleTypes()
        colours = MOptionPollutedGardenBubbleGenerator.factoryColours()
        countBubbles = UInt32(bubbleTypes.count)
        countColours = UInt32(colours.count)
        maxX = 0
        maxY = 0
    }
    
    //MARK: private
    
    private func randomType() -> MOptionPollutedGardenBubbleType
    {
        let random:UInt32 = arc4random_uniform(countBubbles)
        let randomInt:Int = Int(random)
        let bubble:MOptionPollutedGardenBubbleType = bubbleTypes[randomInt]
        
        return bubble
    }
    
    private func randomColour() -> UIColor
    {
        let random:UInt32 = arc4random_uniform(countColours)
        let randomInt:Int = Int(random)
        let colour:UIColor = colours[randomInt]
        
        return colour
    }
    
    private func randomPosition(size:CGSize) -> CGPoint
    {
        let width:CGFloat = size.width
        let width_2:CGFloat = width / 2.0
        let remainWidth:UInt32 = UInt32(maxX - width)
        let randomX:UInt32 = arc4random_uniform(remainWidth)
        let randomXFloat:CGFloat = CGFloat(randomX)
        let positionX:CGFloat = randomXFloat + width_2
        let position:CGPoint = CGPoint(x:positionX, y:maxY)
        
        return position
    }
    
    //MARK: public
    
    func updateController(controller:COptionPollutedGarden)
    {
        self.controller = controller
        
        let size:CGSize = controller.model.size
        maxX = size.width
        maxY = size.height + kAddYPos
    }
    
    func randomBubble() -> MOptionPollutedGardenBubble
    {
        let bubbleType:MOptionPollutedGardenBubbleType = randomType()
        let colour:UIColor = randomColour()
        let position:CGPoint = randomPosition(size:bubbleType.size)
        let bubble:MOptionPollutedGardenBubble = MOptionPollutedGardenBubble(
            controller:controller,
            bubbleType:bubbleType,
            colour:colour,
            position:position)
        
        return bubble
    }
}
