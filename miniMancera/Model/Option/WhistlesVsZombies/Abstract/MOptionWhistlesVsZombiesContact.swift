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
        
        if let sonicBoom:VOptionWhistlesVsZombiesSonicBoom = bodyA as? VOptionWhistlesVsZombiesSonicBoom
        {
            sonicBoomAndBody(
                sonicBoom:sonicBoom,
                body:bodyB)
        }
        else if let sonicBoom:VOptionWhistlesVsZombiesSonicBoom = bodyB as? VOptionWhistlesVsZombiesSonicBoom
        {
            sonicBoomAndBody(
                sonicBoom:sonicBoom,
                body:bodyA)
        }
    }
    
    private func sonicBoomAndBody(
        sonicBoom:VOptionWhistlesVsZombiesSonicBoom,
        body:SKNode?)
    {
        
    }
    
    //MARK: public
    
    func addContact(contact:SKPhysicsContact)
    {
        queue.append(contact)
    }
}
