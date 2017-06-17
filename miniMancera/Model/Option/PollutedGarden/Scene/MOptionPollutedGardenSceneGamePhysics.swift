import SpriteKit

extension MOptionPollutedGardenSceneGame:SKPhysicsContactDelegate
{
    //MARK: private
    
    private func bubbleAndBody(bubble:MOptionPollutedGardenBubble, body:SKNode?)
    {
        if bubble.alive
        {
            if let petunia:MOptionPollutedGardenPetunia = body as? MOptionPollutedGardenPetunia
            {
                contactBubblePetunia(bubble:bubble, petunia:petunia)
            }
            else if let floor:MOptionPollutedGardenFloor = body as? MOptionPollutedGardenFloor
            {
                contactBubbleFloor(bubble:bubble, floor:floor)
            }
        }
    }
    
    private func contactBubblePetunia(
        bubble:MOptionPollutedGardenBubble,
        petunia:MOptionPollutedGardenPetunia)
    {
        bubble.explode()
        petunia.polluted()
    }
    
    private func contactBubbleFloor(
        bubble:MOptionPollutedGardenBubble,
        floor:MOptionPollutedGardenFloor)
    {
        bubble.explode()
    }
    
    //MARK: public
    
    func updateContact(contactQueue:[SKPhysicsContact])
    {
        for contact:SKPhysicsContact in contactQueue
        {
            let bodyA:SKNode? = contact.bodyA.node
            let bodyB:SKNode? = contact.bodyB.node
            
            if let bubble:MOptionPollutedGardenBubble = bodyA as? MOptionPollutedGardenBubble
            {
                bubbleAndBody(bubble:bubble, body:bodyB)
            }
            else if let bubble:MOptionPollutedGardenBubble = bodyB as? MOptionPollutedGardenBubble
            {
                bubbleAndBody(bubble:bubble, body:bodyA)
            }
        }
    }
}