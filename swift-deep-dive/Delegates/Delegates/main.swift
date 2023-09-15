protocol AdvancedLifeSupport {
    func performCPR()
}

class EmergencyCallHandler {
    var delegate: AdvancedLifeSupport?
    
    func assessSituation() {
        print("Can you tell me wha happened?")
    }
    
    func medicalEmergency() {
        delegate?.performCPR()
    }
}

struct Paramedic: AdvancedLifeSupport {
    
    init(handler: EmergencyCallHandler) {
        handler.delegate  =  self
    }
    
    func performCPR() {
        print("The paramedic does chest compressions, 30 per second.")
    }
}

class Doctor: AdvancedLifeSupport {
    
    init(handler: EmergencyCallHandler) {
        handler.delegate  =  self
    }
    
    func performCPR() {
        print("The doctor does chest compressions, 30 per second.")
    }
    
    func useStethescope() {
        print("Listening for heart sounds.")
    }
}

class Surgeon: Doctor {
    
    override func performCPR() {
        super.performCPR()
        print("Sings ah ah ah ah staying alive by the BeeGees")
    }
    
    func  useEletricDrill() {
        //pt-BR: Zumbido / Roncar / Sussurro
        //es: Zumbido / Batir / runrún
        print("Whirr...")
    }
}

let jonas = EmergencyCallHandler()
let rubens = Paramedic(handler: jonas)
let saver  = Surgeon(handler: jonas)

jonas.assessSituation()
jonas.medicalEmergency()
