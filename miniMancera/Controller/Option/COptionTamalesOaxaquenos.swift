import SpriteKit

class COptionTamalesOaxaquenos:ControllerGame<MOptionTamalesOaxaquenos>
{
    override func didBegin(_ contact:SKPhysicsContact)
    {
        model.contact.addContact(contact:contact)
    }
}
