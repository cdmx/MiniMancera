import SpriteKit

class MOptionReformaCrossingContact:MGameUpdate<MOptionReformaCrossing>
{
    private var queue:[SKPhysicsContact]
    
    override init()
    {
        queue = []
    }
    
    override func update(
        elapsedTime:TimeInterval,
        scene:ViewGameScene<MOptionReformaCrossing>)
    {
        lookContacts(scene:scene)
        queue = []
    }
    
    //MARK: private
    
    private func lookContacts(scene:SKScene)
    {
        for contact:SKPhysicsContact in queue
        {
            contactBegin(contact:contact, scene:scene)
        }
    }
    
    private func contactBegin(
        contact:SKPhysicsContact,
        scene:SKScene)
    {
        let bodyA:SKNode? = contact.bodyA.node
        let bodyB:SKNode? = contact.bodyB.node
        
        if let foe:VOptionReformaCrossingFoe = bodyA as? VOptionReformaCrossingFoe
        {
            contactFoeAndBody(foe:foe, body:bodyB, scene:scene)
        }
        else if let foe:VOptionReformaCrossingFoe = bodyB as? VOptionReformaCrossingFoe
        {
            contactFoeAndBody(foe:foe, body:bodyA, scene:scene)
        }
    }
    
    private func contactFoeAndBody(
        foe:VOptionReformaCrossingFoe,
        body:SKNode?,
        scene:SKScene)
    {
        if let player:VOptionReformaCrossingPlayer = body as? VOptionReformaCrossingPlayer
        {
            contactPlayerFoe(player:player, foe:foe, scene:scene)
        }
        else if let otherFoe:VOptionReformaCrossingFoe = body as? VOptionReformaCrossingFoe
        {
            contactFoes(foeA:foe, foeB:otherFoe)
        }
    }
    
    private func contactFoes(foeA:VOptionReformaCrossingFoe, foeB:VOptionReformaCrossingFoe)
    {
        guard
        
            let modelA:MOptionReformaCrossingFoeItem = foeA.model,
            let modelB:MOptionReformaCrossingFoeItem = foeB.model
        
        else
        {
            return
        }
        
        if modelA.created < modelB.created
        {
            modelB.breaks()
        }
        else
        {
            modelA.breaks()
        }
    }
    
    private func contactPlayerFoe(
        player:VOptionReformaCrossingPlayer,
        foe:VOptionReformaCrossingFoe,
        scene:SKScene)
    {
        guard
            
            let scene:VOptionReformaCrossingScene = scene as? VOptionReformaCrossingScene
            
        else
        {
            return
        }
        
        scene.controller.model.hitAndRun(scene:scene)
    }
    
    //MARK: public
    
    func addContact(contact:SKPhysicsContact)
    {
        queue.append(contact)
    }
}
