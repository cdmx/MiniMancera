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
    
    private func contactBegin(contact:SKPhysicsContact)
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
    
    private func bubbleAndBody(bubble:VOptionPollutedGardenBubble, body:SKNode?)
    {/*
        if bubble.alive
        {
            if let player:VOptionPollutedGardenPlayer = body as? VOptionPollutedGardenPlayer
            {
                contactBubbleUmbrella(bubble:bubble, player:player)
            }
            else if let petunia:VOptionPollutedGardenPetunia = body as? VOptionPollutedGardenPetunia
            {
                contactBubblePetunia(bubble:bubble, petunia:petunia)
            }
            else if let floor:VOptionPollutedGardenFloor = body as? VOptionPollutedGardenFloor
            {
                contactBubbleFloor(bubble:bubble, floor:floor)
            }
        }*/
    }
    
    private func contactBubbleUmbrella(
        bubble:VOptionPollutedGardenBubble,
        player:VOptionPollutedGardenPlayer)
    {
        //        playSound(actionSound:soundPop)
//        bubble.explode()
    }
    
    private func contactBubblePetunia(
        bubble:VOptionPollutedGardenBubble,
        petunia:VOptionPollutedGardenPetunia)
    {
//        bubble.explode()
        petunia.polluted()
    }
    
    private func contactBubbleFloor(
        bubble:VOptionPollutedGardenBubble,
        floor:VOptionPollutedGardenFloor)
    {
        //        playSound(actionSound:soundPop)
//        bubble.explode()
    }
    
    //MARK: public
    
    func addContact(contact:SKPhysicsContact)
    {
        queue.append(contact)
    }
}
