import SpriteKit

extension VOptionReformaCrossingScene:SKPhysicsContactDelegate
{
    func contactBegin(contact:SKPhysicsContact)
    {
        let bodyA:SKNode? = contact.bodyA.node
        let bodyB:SKNode? = contact.bodyB.node
        
        if let foe:VOptionReformaCrossingFoe = bodyA as? VOptionReformaCrossingFoe
        {
            contactFoeAndBody(foe:foe, body:bodyB)
        }
        else if let foe:VOptionReformaCrossingFoe = bodyB as? VOptionReformaCrossingFoe
        {
            contactFoeAndBody(foe:foe, body:bodyA)
        }
    }
    
    //MARK: private
    
    private func contactFoeAndBody(foe:VOptionReformaCrossingFoe, body:SKNode?)
    {
        if let player:VOptionReformaCrossingPlayer = body as? VOptionReformaCrossingPlayer
        {
            contactPlayerFoe(player:player, foe:foe)
        }
        else if let otherFoe:VOptionReformaCrossingFoe = body as? VOptionReformaCrossingFoe
        {
            contactFoes(foeA:foe, foeB:otherFoe)
        }
    }
    
    private func contactFoes(foeA:VOptionReformaCrossingFoe, foeB:VOptionReformaCrossingFoe)
    {
        let modelA:MOptionReformaCrossingFoeItem = foeA.model
        let modelB:MOptionReformaCrossingFoeItem = foeB.model
        
        if foeA.created < foeB.created
        {
            foeB.hitTheBreaks()
        }
        else
        {
            foeA.hitTheBreaks()
        }
    }
    
    private func contactPlayerFoe(player:VOptionReformaCrossingPlayer, foe:VOptionReformaCrossingFoe)
    {
        /*
        playSound(actionSound:soundHonk)
        
        if controller.model.gameActive
        {
            controller.hitAndRun()
        }*/
    }
}
