import SpriteKit

class MOptionPollutedGardenContact:MGameUpdate<MOptionPollutedGarden>
{
    private var queue:[SKPhysicsContact]
    
    override init()
    {
        queue = []
        super.init()
    }
    
    override func update(
        elapsedTime:TimeInterval,
        scene:ViewGameScene<MOptionPollutedGarden>)
    {
        lookContacts()
        queue = []
    }
    
    //MARK: private
    
    private func lookContacts()
    {
        for contact:SKPhysicsContact in queue
        {
            contactBegin(contact:contact)
        }
    }
    
    private func contactBegin(
        contact:SKPhysicsContact)
    {
        let bodyA:SKNode? = contact.bodyA.node
        let bodyB:SKNode? = contact.bodyB.node
        
        if let bubble:VOptionPollutedGardenBubble = bodyA as? VOptionPollutedGardenBubble
        {
            bubbleAndBody(bubble:bubble, body:bodyB)
        }
        else if let bubble:VOptionPollutedGardenBubble = bodyB as? VOptionPollutedGardenBubble
        {
            bubbleAndBody(bubble:bubble, body:bodyA)
        }
    }
    
    private func bubbleAndBody(
        bubble:VOptionPollutedGardenBubble,
        body:SKNode?)
    {
        guard
        
            let modelBubble:MOptionPollutedGardenBubbleItem = bubble.model
        
        else
        {
            return
        }
        
        let alive:Bool = modelBubble.alive()
        
        if alive
        {
            if let _:VOptionPollutedGardenPlayer = body as? VOptionPollutedGardenPlayer
            {
                modelBubble.explode()
            }
            else if let plant:VOptionPollutedGardenPlant = body as? VOptionPollutedGardenPlant
            {
                contactBubblePlant(bubble:bubble, plant:plant)
            }
            else if let _:VOptionPollutedGardenFloor = body as? VOptionPollutedGardenFloor
            {
                modelBubble.explode()
            }
        }
    }
    
    private func contactBubblePlant(
        bubble:VOptionPollutedGardenBubble,
        plant:VOptionPollutedGardenPlant)
    {
//        bubble.explode()
//        petunia.polluted()
    }
    
    //MARK: public
    
    func addContact(contact:SKPhysicsContact)
    {
        queue.append(contact)
    }
}
