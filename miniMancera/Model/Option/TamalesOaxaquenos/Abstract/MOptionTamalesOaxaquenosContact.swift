import SpriteKit

class MOptionTamalesOaxaquenosContact:MGameUpdate<MOptionTamalesOaxaquenos>
{
    private var queue:[SKPhysicsContact]
    
    override init()
    {
        queue = []
        super.init()
    }
    
    override func update(
        elapsedTime:TimeInterval,
        scene:ViewGameScene<MOptionTamalesOaxaquenos>)
    {
        lookContacts(scene:scene)
        queue = []
    }
    
    //MARK: private
    
    private func lookContacts(scene:ViewGameScene<MOptionTamalesOaxaquenos>)
    {
        for contact:SKPhysicsContact in queue
        {
            contactBegin(contact:contact, scene:scene)
        }
    }
    
    private func contactBegin(
        contact:SKPhysicsContact,
        scene:ViewGameScene<MOptionTamalesOaxaquenos>)
    {
        let bodyA:SKNode? = contact.bodyA.node
        let bodyB:SKNode? = contact.bodyB.node
        
        if let player:VOptionTamalesOaxaquenosPlayer = bodyA as? VOptionTamalesOaxaquenosPlayer
        {
            playerAndBody(
                player:player,
                body:bodyB,
                scene:scene)
        }
        else if let player:VOptionTamalesOaxaquenosPlayer = bodyB as? VOptionTamalesOaxaquenosPlayer
        {
            playerAndBody(
                player:player,
                body:bodyA,
                scene:scene)
        }
    }
    
    private func playerAndBody(
        player:VOptionTamalesOaxaquenosPlayer,
        body:SKNode?,
        scene:ViewGameScene<MOptionTamalesOaxaquenos>)
    {
        if let floor:VOptionTamalesOaxaquenosFloor = body as? VOptionTamalesOaxaquenosFloor
        {
            playerAndFloor(
                player:player,
                floor:floor,
                scene:scene)
        }
        else if let hole:VOptionTamalesOaxaquenosPhysicHole = body as? VOptionTamalesOaxaquenosPhysicHole
        {
            playerAndHole(
                player:player,
                hole:hole,
                scene:scene)
        }
        else if let finish:VOptionTamalesOaxaquenosPhysicFinish = body as? VOptionTamalesOaxaquenosPhysicFinish
        {
            playerAndFinish(
                player:player,
                finish:finish,
                scene:scene)
        }
    }
    
    private func playerAndFloor(
        player:VOptionTamalesOaxaquenosPlayer,
        floor:VOptionTamalesOaxaquenosFloor,
        scene:ViewGameScene<MOptionTamalesOaxaquenos>)
    {
        scene.controller.model.player.landed()
    }
    
    private func playerAndHole(
        player:VOptionTamalesOaxaquenosPlayer,
        hole:VOptionTamalesOaxaquenosPhysicHole,
        scene:ViewGameScene<MOptionTamalesOaxaquenos>)
    {
        guard
            
            let controller:COptionTamalesOaxaquenos = scene.controller as? COptionTamalesOaxaquenos
        
        else
        {
            return
        }
        
        controller.playerInHole()
    }
    
    private func playerAndFinish(
        player:VOptionTamalesOaxaquenosPlayer,
        finish:VOptionTamalesOaxaquenosPhysicFinish,
        scene:ViewGameScene<MOptionTamalesOaxaquenos>)
    {
        guard
            
            let controller:COptionTamalesOaxaquenos = scene.controller as? COptionTamalesOaxaquenos
            
        else
        {
            return
        }
        
        controller.playerFinish()
    }
    
    //MARK: public
    
    func addContact(contact:SKPhysicsContact)
    {
        queue.append(contact)
    }
}
