import UIKit
import SpriteKit

class MOptionPollutedGardenBubbleGenerator
{
    private weak var controller:COptionPollutedGarden!
    private let bubbleTypes:[MOptionPollutedGardenBubbleType]
    private let colours:[UIColor]
    private let countBubbles:UInt32
    private let countColours:UInt32
    
    init()
    {
        bubbleTypes = MOptionPollutedGardenBubbleGenerator.factoryBubbleTypes()
        colours = MOptionPollutedGardenBubbleGenerator.factoryColours()
        countBubbles = UInt32(bubbleTypes.count)
        countColours = UInt32(colours.count)
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
    
    private func randomPosition() -> CGPoint
    {
        let position:CGPoint = CGPoint(x:100, y:500)
        
        return position
    }
    
    //MARK: public
    
    func updateController(controller:COptionPollutedGarden)
    {
        self.controller = controller
    }
    
    func randomBubble() -> MOptionPollutedGardenBubble
    {
        let bubbleType:MOptionPollutedGardenBubbleType = randomType()
        let colour:UIColor = randomColour()
        let position:CGPoint = randomPosition()
        let bubble:MOptionPollutedGardenBubble = MOptionPollutedGardenBubble(
            controller:controller,
            bubbleType:bubbleType,
            colour:colour,
            position:position)
        
        return bubble
    }
}
