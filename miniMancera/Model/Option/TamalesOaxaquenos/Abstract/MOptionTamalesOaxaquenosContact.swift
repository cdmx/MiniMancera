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
    }
    
    private func playerAndFloor(
        player:VOptionTamalesOaxaquenosPlayer,
        floor:VOptionTamalesOaxaquenosFloor,
        scene:ViewGameScene<MOptionTamalesOaxaquenos>)
    {
        scene.controller.model.player.landed()
    }
    
    //MARK: public
    
    func addContact(contact:SKPhysicsContact)
    {
        queue.append(contact)
    }
}