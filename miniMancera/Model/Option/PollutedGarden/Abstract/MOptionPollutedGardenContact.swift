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
        lookContacts(scene:scene)
        queue = []
    }
    
    //MARK: private
    
    private func lookContacts(scene:ViewGameScene<MOptionPollutedGarden>)
    {
        for contact:SKPhysicsContact in queue
        {
            contactBegin(contact:contact, scene:scene)
        }
    }
    
    private func contactBegin(
        contact:SKPhysicsContact,
        scene:ViewGameScene<MOptionPollutedGarden>)
    {
        let bodyA:SKNode? = contact.bodyA.node
        let bodyB:SKNode? = contact.bodyB.node
        
        if let bubble:VOptionPollutedGardenBubble = bodyA as? VOptionPollutedGardenBubble
        {
            bubbleAndBody(bubble:bubble, body:bodyB, scene:scene)
        }
        else if let bubble:VOptionPollutedGardenBubble = bodyB as? VOptionPollutedGardenBubble
        {
            bubbleAndBody(bubble:bubble, body:bodyA, scene:scene)
        }
    }
    
    private func bubbleAndBody(
        bubble:VOptionPollutedGardenBubble,
        body:SKNode?,
        scene:ViewGameScene<MOptionPollutedGarden>)
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
                contactBubblePlant(modelBubble:modelBubble, plant:plant, scene:scene)
            }
            else if let _:VOptionPollutedGardenFloor = body as? VOptionPollutedGardenFloor
            {
                modelBubble.explode()
            }
        }
    }
    
    private func contactBubblePlant(
        modelBubble:MOptionPollutedGardenBubbleItem,
        plant:VOptionPollutedGardenPlant,
        scene:ViewGameScene<MOptionPollutedGarden>)
    {
        modelBubble.explode()
        
        guard
            
            let modelPlant:MOptionPollutedGardenPlantItem = plant.model
        
        else
        {
            return
        }
        
        let pollutable:Bool = modelPlant.pollutable()
        
        if pollutable
        {
            scene.controller.model.poisonPlant(plantItem:modelPlant)
        }
    }
    
    //MARK: public
    
    func addContact(contact:SKPhysicsContact)
    {
        queue.append(contact)
    }
}
