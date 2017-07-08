import SpriteKit

class MOptionWhistlesVsZombiesContact:MGameUpdate<MOptionWhistlesVsZombies>
{
    private var queue:[SKPhysicsContact]
    
    override init()
    {
        queue = []
        super.init()
    }
    
    override func update(
        elapsedTime:TimeInterval,
        scene:ViewGameScene<MOptionWhistlesVsZombies>)
    {
        lookContacts(scene:scene)
        queue = []
    }
    
    //MARK: private
    
    private func lookContacts(scene:ViewGameScene<MOptionWhistlesVsZombies>)
    {
        for contact:SKPhysicsContact in queue
        {
            contactBegin(contact:contact, scene:scene)
        }
    }
    
    private func contactBegin(
        contact:SKPhysicsContact,
        scene:ViewGameScene<MOptionWhistlesVsZombies>)
    {
        let bodyA:SKNode? = contact.bodyA.node
        let bodyB:SKNode? = contact.bodyB.node
        
        if let sonicBoom:VOptionWhistlesVsZombiesSonicBoom = bodyA as? VOptionWhistlesVsZombiesSonicBoom
        {
            sonicBoomAndBody(
                sonicBoom:sonicBoom,
                body:bodyB,
                scene:scene)
        }
        else if let sonicBoom:VOptionWhistlesVsZombiesSonicBoom = bodyB as? VOptionWhistlesVsZombiesSonicBoom
        {
            sonicBoomAndBody(
                sonicBoom:sonicBoom,
                body:bodyA,
                scene:scene)
        }
    }
    
    private func sonicBoomAndBody(
        sonicBoom:VOptionWhistlesVsZombiesSonicBoom,
        body:SKNode?,
        scene:ViewGameScene<MOptionWhistlesVsZombies>)
    {
        guard
        
            let sonicBoomModel:MOptionWhistlesVsZombiesSonicBoomItem = sonicBoom.model
        
        else
        {
            return
        }
        
        let alive:Bool = sonicBoomModel.alive()
        
        if alive
        {
            sonicBoom.stop()
            
            if let _:VOptionWhistlesVsZombiesPhysicSonicLimit = body as? VOptionWhistlesVsZombiesPhysicSonicLimit
            {
                sonicBoomModel.collisionFinish(scene:scene)
            }
            else if let zombie:VOptionWhistlesVsZombiesZombie = body as? VOptionWhistlesVsZombiesZombie
            {
                sonicBoomAndZombie(
                    sonicBoomModel:sonicBoomModel,
                    zombie:zombie)
            }
        }
    }
    
    private func sonicBoomAndZombie(
        sonicBoomModel:MOptionWhistlesVsZombiesSonicBoomItem,
        zombie:VOptionWhistlesVsZombiesZombie)
    {
        sonicBoomModel.collisionStart()
        
        guard
        
            let modelZombie:MOptionWhistlesVsZombiesZombieItem = zombie.model
        
        else
        {
            return
        }
        
        modelZombie.sonicHit(sonicBoom:sonicBoomModel)
    }
    
    //MARK: public
    
    func addContact(contact:SKPhysicsContact)
    {
        queue.append(contact)
    }
}
