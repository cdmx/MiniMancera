import SpriteKit

extension MOptionPollutedGardenSceneGame:SKPhysicsContactDelegate
{
    //MARK: private
    
    private func contactFoes(foeA:MOptionReformaCrossingFoe, foeB:MOptionReformaCrossingFoe)
    {
        if foeA.created < foeB.created
        {
            foeB.hitTheBreaks()
        }
        else
        {
            foeA.hitTheBreaks()
        }
    }
    
    private func contactPlayerFoe(player:MOptionReformaCrossingPlayer, foe:MOptionReformaCrossingFoe)
    {
        playSound(actionSound:soundHonk)
        
        if controller.model.gameActive
        {
            controller.hitAndRun()
        }
    }
    
    //MARK: public
    
    func contactBegin(contact:SKPhysicsContact)
    {
        let bodyA:SKNode? = contact.bodyA.node
        let bodyB:SKNode? = contact.bodyB.node
        
        if let foeA:MOptionReformaCrossingFoe = bodyA as? MOptionReformaCrossingFoe
        {
            if let player:MOptionReformaCrossingPlayer = bodyB as? MOptionReformaCrossingPlayer
            {
                contactPlayerFoe(player:player, foe:foeA)
            }
            else if let foeB:MOptionReformaCrossingFoe = bodyB as? MOptionReformaCrossingFoe
            {
                contactFoes(foeA:foeA, foeB:foeB)
            }
        }
        else if let player:MOptionReformaCrossingPlayer = bodyA as? MOptionReformaCrossingPlayer
        {
            if let foeB:MOptionReformaCrossingFoe = bodyB as? MOptionReformaCrossingFoe
            {
                contactPlayerFoe(player:player, foe:foeB)
            }
        }
    }
}
